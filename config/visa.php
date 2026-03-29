<?php

/**
 * Visa Card Eligibility Service (VCES) — server-side proxy settings.
 *
 * Official reference: https://developer.visa.com/capabilities/vces/reference
 * Production/sandbox URLs, mTLS certificates, and request body fields are defined by Visa;
 * use env vars below and extend VisaCardEligibilityService when your Visa project is approved.
 */
return [

    'base_url' => rtrim((string) env('VISA_BASE_URL', ''), '/'),

    /** Visa Developer Portal HTTP Basic (API Key as username, private key password as password — see Visa docs). */
    'user_id' => env('VISA_USER_ID'),
    'password' => env('VISA_PASSWORD'),

    /**
     * Path segment for POST validate (v1 Latest).
     * @see https://developer.visa.com/capabilities/vces/reference
     */
    'path_validate' => env('VISA_PATH_VALIDATE', '/visacardeligibilityservices/v1/cardeligibility/validate'),

    'timeout' => (int) env('VISA_TIMEOUT', 45),

    /** Local/dev: return stub JSON without calling Visa. */
    'mock' => filter_var(env('VISA_MOCK', false), FILTER_VALIDATE_BOOLEAN),

    /**
     * mTLS (required for many Visa APIs). PEM paths on server; optional passphrase for key.
     * Example: storage_path('visa/visa_client.pem')
     */
    'mtls' => [
        'cert_path' => env('VISA_MTLS_CERT_PATH'),
        'cert_password' => env('VISA_MTLS_CERT_PASSWORD'),
        'key_path' => env('VISA_MTLS_KEY_PATH'),
        'key_password' => env('VISA_MTLS_KEY_PASSWORD'),
        'verify' => filter_var(env('VISA_MTLS_VERIFY_SSL', true), FILTER_VALIDATE_BOOLEAN),
    ],
];
