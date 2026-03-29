<?php

namespace App\Services;

use Illuminate\Http\Client\RequestException;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

/**
 * Visa Card Eligibility Service (VCES) — outbound integration.
 *
 * Endpoint (documented by Visa): POST …/visacardeligibilityservices/v1/cardeligibility/validate
 * Reference: https://developer.visa.com/capabilities/vces/reference
 *
 * Security: do not log full card numbers or other PCI data. Pass only fields required by Visa’s spec.
 */
class VisaCardEligibilityService
{
    /**
     * Apply mTLS + optional SSL options when certificate paths are configured.
     */
    protected function httpClient(): \Illuminate\Http\Client\PendingRequest
    {
        $base = rtrim((string) config('visa.base_url'), '/');
        $timeout = (int) config('visa.timeout', 45);

        $req = Http::baseUrl($base)
            ->timeout($timeout)
            ->acceptJson()
            ->asJson();

        $user = config('visa.user_id');
        $pass = config('visa.password');
        if ($user !== null && $user !== '' && $pass !== null) {
            $req = $req->withBasicAuth($user, $pass);
        }

        $mtls = config('visa.mtls', []);
        $options = ['verify' => (bool) ($mtls['verify'] ?? true)];

        $certPath = $mtls['cert_path'] ?? null;
        if ($certPath && is_readable($certPath)) {
            $certPwd = $mtls['cert_password'] ?? '';
            $options['cert'] = $certPwd !== '' && $certPwd !== null ? [$certPath, $certPwd] : $certPath;
        }

        $keyPath = $mtls['key_path'] ?? null;
        if ($keyPath && is_readable($keyPath)) {
            $keyPwd = $mtls['key_password'] ?? '';
            $options['ssl_key'] = $keyPwd !== '' && $keyPwd !== null ? [$keyPath, $keyPwd] : $keyPath;
        }

        if (count($options) > 1 || ! ($options['verify'] ?? true)) {
            $req = $req->withOptions($options);
        }

        return $req;
    }

    /**
     * POST card eligibility validate — body must match Visa’s OpenAPI (see developer portal).
     *
     * @param  array<string, mixed>  $visaRequestBody
     * @return array{success: bool, data?: array<string, mixed>, error?: string, status?: int}
     */
    public function validate(array $visaRequestBody): array
    {
        if (config('visa.mock')) {
            return [
                'success' => true,
                'data' => [
                    'mock' => true,
                    'message' => 'VISA_MOCK=true — replace with real Visa response shape from docs.',
                ],
                'status' => 200,
            ];
        }

        if (config('visa.base_url') === '' || config('visa.base_url') === null) {
            Log::warning('Visa VCES: VISA_BASE_URL is empty. Set it or use VISA_MOCK=true.');

            return ['success' => false, 'error' => 'Visa API base URL is not configured.'];
        }

        $path = (string) config('visa.path_validate');

        try {
            $response = $this->httpClient()->post($path, $visaRequestBody);
            $response->throw();

            $json = $response->json();
            if (! is_array($json)) {
                $json = ['_raw' => $response->body()];
            }

            return [
                'success' => true,
                'data' => $json,
                'status' => $response->status(),
            ];
        } catch (RequestException $e) {
            Log::warning('Visa VCES validate request failed', [
                'status' => $e->response?->status(),
                // Intentionally omit response body if it may contain PCI-related fields
            ]);

            return [
                'success' => false,
                'error' => $e->response?->json('message') ?? $e->getMessage(),
                'status' => $e->response?->status(),
            ];
        } catch (\Throwable $e) {
            Log::error('Visa VCES validate exception', ['message' => $e->getMessage()]);

            return ['success' => false, 'error' => 'Visa service unavailable.'];
        }
    }
}
