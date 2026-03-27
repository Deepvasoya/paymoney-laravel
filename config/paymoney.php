<?php

/**
 * PayMoney partner / external API integration.
 * Adjust paths and headers when the official API contract is available.
 */
return [

    'base_url' => rtrim((string) env('PAYMONEY_BASE_URL', ''), '/'),

    'api_key' => env('PAYMONEY_API_KEY'),

    'api_secret' => env('PAYMONEY_API_SECRET'),

    'timeout' => (int) env('PAYMONEY_TIMEOUT', 30),

    /**
     * When true, initiate/status skip HTTP and return deterministic fake data (local/dev only).
     */
    'mock' => filter_var(env('PAYMONEY_MOCK', false), FILTER_VALIDATE_BOOLEAN),

    /**
     * Relative paths appended to base_url. Use {id} placeholder for status route.
     */
    'paths' => [
        'initiate' => env('PAYMONEY_PATH_INITIATE', '/v1/payments'),
        'status' => env('PAYMONEY_PATH_STATUS', '/v1/payments/{id}'),
    ],

    /**
     * Outbound request authentication (change to Bearer-only, Basic, etc. per provider docs).
     */
    'auth' => [
        'type' => env('PAYMONEY_AUTH_TYPE', 'headers'), // headers | bearer | basic
    ],

    'headers' => [
        'api_key' => env('PAYMONEY_HEADER_API_KEY', 'X-Api-Key'),
        'api_secret' => env('PAYMONEY_HEADER_API_SECRET', 'X-Api-Secret'),
    ],

    /**
     * Webhook verification: HMAC of raw body, header name configurable.
     */
    'webhook' => [
        'signature_header' => env('PAYMONEY_WEBHOOK_SIGNATURE_HEADER', 'X-PayMoney-Signature'),
        'secret' => env('PAYMONEY_WEBHOOK_SECRET'), // defaults to api_secret if null
        'algorithm' => env('PAYMONEY_WEBHOOK_ALGORITHM', 'sha256'),
    ],
];
