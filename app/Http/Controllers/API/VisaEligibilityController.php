<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Services\VisaCardEligibilityService;
use App\Traits\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

/**
 * App-facing API that proxies to Visa Card Eligibility Service (VCES).
 *
 * @see https://developer.visa.com/capabilities/vces/reference
 */
class VisaEligibilityController extends Controller
{
    use ApiResponse;

    public function __construct(
        protected VisaCardEligibilityService $visa
    ) {}

    /**
     * POST /api/visa/card-eligibility/validate
     *
     * Body: { "request": { ... } } where the inner object follows Visa’s validate payload.
     * We keep it opaque so you can align keys with the official spec without changing routes.
     */
    public function validateEligibility(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'request' => ['required', 'array', 'max:100'],
        ]);

        if ($validator->fails()) {
            return response()->json($this->withError(collect($validator->errors())->collapse()), 422);
        }

        /** @var array<string, mixed> $visaBody */
        $visaBody = $request->input('request', []);

        $result = $this->visa->validate($visaBody);

        if (! $result['success']) {
            $httpStatus = (int) ($result['status'] ?? 502);
            if ($httpStatus < 400 || $httpStatus > 599) {
                $httpStatus = 502;
            }

            return response()->json(
                $this->withError($result['error'] ?? 'Visa eligibility check failed.'),
                $httpStatus
            );
        }

        return response()->json([
            'status' => 'success',
            'data' => $result['data'] ?? [],
        ]);
    }
}
