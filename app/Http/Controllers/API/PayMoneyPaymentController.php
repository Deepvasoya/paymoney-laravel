<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Payment;
use App\Services\PayMoneyService;
use App\Traits\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

/**
 * REST endpoints for PayMoney-style partner API integration.
 *
 * Note: This project already has App\Http\Controllers\PaymentController (web IPN)
 * and App\Http\Controllers\API\PaymentController (mobile deposits). This controller
 * is dedicated to the external PayMoney API flow only.
 */
class PayMoneyPaymentController extends Controller
{
    use ApiResponse;

    public function __construct(
        protected PayMoneyService $payMoney
    ) {}

    /**
     * POST /api/payments/initiate
     *
     * Step A: Validate input, persist a pending row, call PayMoney to create a transaction,
     * then store provider reference + raw response on our side.
     */
    public function initiate(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'amount' => ['required', 'numeric', 'min:0.01'],
            'currency' => ['required', 'string', 'size:3', 'regex:/^[A-Z]{3}$/'],
            'description' => ['nullable', 'string', 'max:500'],
            'return_url' => ['nullable', 'url', 'max:2048'],
            'cancel_url' => ['nullable', 'url', 'max:2048'],
            'metadata' => ['nullable', 'array'],
        ]);

        if ($validator->fails()) {
            return response()->json($this->withError(collect($validator->errors())->collapse()), 422);
        }

        $user = $request->user();

        try {
            // Step B: Local record first (id becomes our reference to the provider).
            $payment = Payment::query()->create([
                'user_id' => $user->id,
                'amount' => $request->input('amount'),
                'currency' => strtoupper($request->input('currency')),
                'status' => 'pending',
                'external_transaction_id' => null,
                'response_payload' => ['phase' => 'initiated'],
            ]);

            // Step C: Payload sent to PayMoney — extend keys when official spec is available.
            $providerPayload = array_filter([
                'amount' => (float) $payment->amount,
                'currency' => $payment->currency,
                'reference' => (string) $payment->id,
                'description' => $request->input('description'),
                'return_url' => $request->input('return_url'),
                'cancel_url' => $request->input('cancel_url'),
                'customer' => [
                    'email' => $user->email,
                    'name' => trim($user->firstname.' '.$user->lastname),
                ],
                'metadata' => $request->input('metadata'),
            ], fn ($v) => $v !== null && $v !== []);

            $result = $this->payMoney->initiatePayment($providerPayload);

            if (! $result['success']) {
                $payment->update([
                    'status' => 'failed',
                    'response_payload' => array_merge($payment->response_payload ?? [], [
                        'error' => $result['error'] ?? 'initiate_failed',
                    ]),
                ]);

                return response()->json(
                    $this->withError($result['error'] ?? 'Could not start payment.'),
                    502
                );
            }

            $data = $result['data'] ?? [];
            $externalId = $data['external_transaction_id'] ?? null;

            // Step D: Persist provider answer (IDs + full raw body for audits).
            $payment->update([
                'external_transaction_id' => $externalId,
                'status' => $this->mapRemoteStatus($data['status'] ?? 'pending'),
                'response_payload' => array_merge($payment->response_payload ?? [], [
                    'initiate' => $data['raw'] ?? $data,
                    'checkout_url' => $data['checkout_url'] ?? null,
                ]),
            ]);

            return response()->json([
                'status' => 'success',
                'data' => [
                    'payment_id' => $payment->id,
                    'status' => $payment->status,
                    'external_transaction_id' => $payment->external_transaction_id,
                    'checkout_url' => $data['checkout_url'] ?? null,
                    'message' => 'Payment initialized. Redirect user to checkout_url when present.',
                ],
            ]);
        } catch (\Throwable $e) {
            Log::error('PayMoney initiate controller error', [
                'user_id' => $user->id,
                'message' => $e->getMessage(),
            ]);

            return response()->json($this->withError('Unable to create payment.'), 500);
        }
    }

    /**
     * POST /api/payments/webhook
     *
     * Step E: PayMoney calls this URL asynchronously — verify signature, locate payment, update status.
     * Keep idempotent: repeated webhooks should not break state.
     */
    public function webhook(Request $request): JsonResponse
    {
        $raw = $request->getContent();
        $headerName = (string) config('paymoney.webhook.signature_header');
        $signature = $request->header($headerName);

        if (! $this->payMoney->verifyWebhookSignature($raw, $signature)) {
            Log::warning('PayMoney webhook rejected: bad signature');

            return response()->json(['status' => 'error', 'message' => 'Invalid signature'], 401);
        }

        $payload = $request->all();
        // Flexible field names until contract is fixed.
        $externalId = $payload['transaction_id'] ?? $payload['id'] ?? $payload['external_id'] ?? null;
        $remoteStatus = $payload['status'] ?? $payload['state'] ?? null;

        if ($externalId === null || $externalId === '') {
            Log::warning('PayMoney webhook missing transaction id', ['payload' => $payload]);

            return response()->json(['status' => 'error', 'message' => 'Missing transaction reference'], 422);
        }

        try {
            $payment = Payment::query()
                ->where('external_transaction_id', $externalId)
                ->first();

            if (! $payment) {
                Log::notice('PayMoney webhook for unknown transaction', ['external_id' => $externalId]);

                return response()->json(['status' => 'ok', 'message' => 'ignored']);
            }

            $merged = array_merge($payment->response_payload ?? [], [
                'webhook' => $payload,
                'webhook_received_at' => now()->toIso8601String(),
            ]);

            $payment->update([
                'status' => $this->mapRemoteStatus($remoteStatus ?? $payment->status),
                'response_payload' => $merged,
            ]);

            return response()->json(['status' => 'ok']);
        } catch (\Throwable $e) {
            Log::error('PayMoney webhook handler error', ['message' => $e->getMessage()]);

            return response()->json(['status' => 'error'], 500);
        }
    }

    /**
     * GET /api/payments/{id}
     *
     * Step F: Client polls or opens screen — optionally refresh status from PayMoney.
     */
    public function show(Request $request, int $id): JsonResponse
    {
        $payment = Payment::query()
            ->where('id', $id)
            ->where('user_id', $request->user()->id)
            ->first();

        if (! $payment) {
            return response()->json($this->withError('Payment not found.'), 404);
        }

        if ($payment->external_transaction_id && in_array($payment->status, ['pending', 'processing'], true)) {
            $remote = $this->payMoney->verifyPaymentStatus($payment->external_transaction_id);
            if ($remote['success'] && isset($remote['data'])) {
                $d = $remote['data'];
                $payment->refresh();
                $payment->update([
                    'status' => $this->mapRemoteStatus($d['status'] ?? $payment->status),
                    'response_payload' => array_merge($payment->response_payload ?? [], [
                        'status_poll' => $d['raw'] ?? $d,
                    ]),
                ]);
                $payment->refresh();
            }
        }

        return response()->json([
            'status' => 'success',
            'data' => [
                'id' => $payment->id,
                'amount' => $payment->amount,
                'currency' => $payment->currency,
                'status' => $payment->status,
                'external_transaction_id' => $payment->external_transaction_id,
                'response_payload' => $payment->response_payload,
                'created_at' => $payment->created_at?->toIso8601String(),
                'updated_at' => $payment->updated_at?->toIso8601String(),
            ],
        ]);
    }

    /**
     * Map remote status strings to our stored enum-like values.
     */
    protected function mapRemoteStatus(string $remote): string
    {
        $n = strtolower(trim($remote));
        if (in_array($n, ['paid', 'completed', 'success', 'successful', 'captured'], true)) {
            return 'completed';
        }
        if (in_array($n, ['failed', 'declined', 'error', 'cancelled', 'canceled'], true)) {
            return 'failed';
        }
        if (in_array($n, ['processing', 'requires_action'], true)) {
            return 'processing';
        }
        if (in_array($n, ['pending', 'created'], true)) {
            return 'pending';
        }

        return strlen($n) > 31 ? 'pending' : $n;
    }
}
