<?php

namespace App\Services;

use Illuminate\Http\Client\RequestException;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

/**
 * HTTP client wrapper for PayMoney (or compatible) REST API.
 *
 * Replace path segments and payload keys once the official PayMoney merchant API is confirmed.
 * This layer stays free of Eloquent so it can be reused from jobs or CLI.
 */
class PayMoneyService
{
    /**
     * Build the default HTTP client with base URL, timeout, and auth headers.
     */
    protected function client(): \Illuminate\Http\Client\PendingRequest
    {
        $base = (string) config('paymoney.base_url');
        $timeout = (int) config('paymoney.timeout', 30);

        $request = Http::baseUrl($base === '' ? 'http://localhost' : $base)
            ->timeout($timeout)
            ->acceptJson()
            ->asJson();

        if (config('paymoney.mock')) {
            return $request;
        }

        return $this->applyAuth($request);
    }

    /**
     * Attach credentials per PAYMONEY_AUTH_TYPE (headers, bearer, basic).
     */
    protected function applyAuth(\Illuminate\Http\Client\PendingRequest $request): \Illuminate\Http\Client\PendingRequest
    {
        $key = config('paymoney.api_key');
        $secret = config('paymoney.api_secret');
        $type = (string) config('paymoney.auth.type', 'headers');

        if ($type === 'bearer' && $key) {
            return $request->withToken($key);
        }

        if ($type === 'basic' && $key !== null && $key !== '' && $secret !== null) {
            return $request->withBasicAuth($key, $secret);
        }

        $hk = (string) config('paymoney.headers.api_key');
        $hs = (string) config('paymoney.headers.api_secret');

        if ($key) {
            $request = $request->withHeaders([$hk => $key]);
        }
        if ($secret) {
            $request = $request->withHeaders([$hs => $secret]);
        }

        return $request;
    }

    /**
     * Step 1: Create a payment session / intent on PayMoney side.
     *
     * @param  array<string, mixed>  $payload  e.g. amount, currency, reference, customer, return_url
     * @return array{success: bool, data?: array<string, mixed>, error?: string, status?: int}
     */
    public function initiatePayment(array $payload): array
    {
        if (config('paymoney.mock')) {
            $id = 'mock_txn_'.Str::uuid()->toString();

            return [
                'success' => true,
                'data' => [
                    'external_transaction_id' => $id,
                    'checkout_url' => url('/docs').'?mock_pay='.$id,
                    'status' => 'pending',
                    'raw' => ['mock' => true],
                ],
            ];
        }

        $path = (string) config('paymoney.paths.initiate');
        if (config('paymoney.base_url') === '') {
            Log::warning('PayMoney: PAYMONEY_BASE_URL is empty; set PAYMONEY_MOCK=true for local testing.');

            return ['success' => false, 'error' => 'PayMoney base URL is not configured.'];
        }

        try {
            $response = $this->client()->post($path, $payload);
            $response->throw();

            $body = $response->json();
            if (! is_array($body)) {
                $body = ['_raw' => $response->body()];
            }

            // Normalise common shapes (adjust when API is known).
            $externalId = $body['id'] ?? $body['transaction_id'] ?? $body['data']['id'] ?? null;
            $checkoutUrl = $body['checkout_url'] ?? $body['redirect_url'] ?? $body['data']['url'] ?? null;

            return [
                'success' => true,
                'data' => [
                    'external_transaction_id' => $externalId,
                    'checkout_url' => $checkoutUrl,
                    'status' => $body['status'] ?? 'pending',
                    'raw' => $body,
                ],
                'status' => $response->status(),
            ];
        } catch (RequestException $e) {
            Log::error('PayMoney initiate failed', [
                'message' => $e->getMessage(),
                'response' => $e->response?->json() ?? $e->response?->body(),
            ]);

            return [
                'success' => false,
                'error' => $e->response?->json('message') ?? $e->getMessage(),
                'status' => $e->response?->status(),
            ];
        } catch (\Throwable $e) {
            Log::error('PayMoney initiate exception', ['message' => $e->getMessage()]);

            return ['success' => false, 'error' => 'Payment provider unavailable.'];
        }
    }

    /**
     * Step 2: Poll payment status (e.g. after return from hosted checkout).
     *
     * @return array{success: bool, data?: array<string, mixed>, error?: string, status?: int}
     */
    public function verifyPaymentStatus(string $externalTransactionId): array
    {
        if (config('paymoney.mock')) {
            return [
                'success' => true,
                'data' => [
                    'external_transaction_id' => $externalTransactionId,
                    'status' => str_starts_with($externalTransactionId, 'mock_') ? 'completed' : 'pending',
                    'raw' => ['mock' => true],
                ],
            ];
        }

        $template = (string) config('paymoney.paths.status');
        $path = str_replace('{id}', rawurlencode($externalTransactionId), $template);

        if (config('paymoney.base_url') === '') {
            return ['success' => false, 'error' => 'PayMoney base URL is not configured.'];
        }

        try {
            $response = $this->client()->get($path);
            $response->throw();
            $body = $response->json();
            if (! is_array($body)) {
                $body = ['_raw' => $response->body()];
            }

            return [
                'success' => true,
                'data' => [
                    'external_transaction_id' => $externalTransactionId,
                    'status' => $body['status'] ?? $body['data']['status'] ?? 'unknown',
                    'raw' => $body,
                ],
                'status' => $response->status(),
            ];
        } catch (RequestException $e) {
            Log::warning('PayMoney status check failed', [
                'external_id' => $externalTransactionId,
                'message' => $e->getMessage(),
            ]);

            return [
                'success' => false,
                'error' => $e->response?->json('message') ?? $e->getMessage(),
                'status' => $e->response?->status(),
            ];
        } catch (\Throwable $e) {
            Log::error('PayMoney status exception', ['message' => $e->getMessage()]);

            return ['success' => false, 'error' => 'Payment provider unavailable.'];
        }
    }

    /**
     * Step 3: Validate webhook authenticity (HMAC-SHA256 of raw body by default).
     */
    public function verifyWebhookSignature(string $rawBody, ?string $signatureHeader): bool
    {
        $secret = config('paymoney.webhook.secret') ?: config('paymoney.api_secret');
        if ($secret === null || $secret === '') {
            // No secret configured: accept but log once per request (caller should log).
            return true;
        }

        if ($signatureHeader === null || $signatureHeader === '') {
            return false;
        }

        $algo = (string) config('paymoney.webhook.algorithm', 'sha256');
        $expected = hash_hmac($algo, $rawBody, $secret);

        return hash_equals($expected, $signatureHeader)
            || hash_equals($expected, trim($signatureHeader, '"'))
            || hash_equals('sha256='.$expected, $signatureHeader);
    }
}
