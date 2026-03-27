<?php

/**
 * All API routes from routes/api.php — paths relative to /api.
 */
declare(strict_types=1);

if (! function_exists('api_docs_json_public_headers')) {
    function api_docs_json_public_headers(): array
    {
        return [
            ['name' => 'Content-Type', 'value' => 'application/json', 'required' => true],
            ['name' => 'Accept', 'value' => 'application/json', 'required' => true],
        ];
    }
}

if (! function_exists('api_docs_auth_headers')) {
    function api_docs_auth_headers(): array
    {
        return [
            ['name' => 'Authorization', 'value' => 'Bearer {token}', 'required' => true],
            ['name' => 'Accept', 'value' => 'application/json', 'required' => true],
        ];
    }
}

if (! function_exists('api_docs_std_ok')) {
    function api_docs_std_ok(array $body = []): array
    {
        return [
            'status' => 200,
            'body' => $body ?: ['success' => true, 'data' => []],
        ];
    }
}

if (! function_exists('api_docs_std_401')) {
    function api_docs_std_401(): array
    {
        return ['status' => 401, 'body' => ['message' => 'Unauthenticated.']];
    }
}

if (! function_exists('api_docs_std_422')) {
    function api_docs_std_422(): array
    {
        return [
            'status' => 422,
            'body' => ['success' => false, 'message' => 'Validation error', 'errors' => []],
        ];
    }
}

if (! function_exists('api_docs_std_status')) {
    function api_docs_std_status(bool $auth = true): array
    {
        $s = [
            ['code' => 200, 'description' => ['en' => 'OK', 'es' => 'Correcto']],
        ];
        if ($auth) {
            $s[] = ['code' => 401, 'description' => ['en' => 'Unauthenticated', 'es' => 'No autenticado']];
            $s[] = ['code' => 403, 'description' => ['en' => 'Forbidden / verification or KYC', 'es' => 'Prohibido / verificación o KYC']];
        }

        return $s;
    }
}

if (! function_exists('api_docs_ep')) {
    /**
     * @param  array<string, mixed>  $def
     */
    function api_docs_ep(array $def): array
    {
        $titleEn = (string) $def['title'];
        $descEn = (string) $def['desc'];
        $requiresAuth = (bool) ($def['requires_auth'] ?? true);

        return [
            'id' => (string) $def['id'],
            'category' => (string) $def['category'],
            'method' => (string) $def['method'],
            'path' => (string) $def['path'],
            'title' => ['en' => $titleEn, 'es' => (string) ($def['title_es'] ?? $titleEn)],
            'description' => ['en' => $descEn, 'es' => (string) ($def['desc_es'] ?? $descEn)],
            'requires_auth' => $requiresAuth,
            'headers' => $def['headers'] ?? ($requiresAuth ? api_docs_auth_headers() : [['name' => 'Accept', 'value' => 'application/json', 'required' => true]]),
            'parameters' => $def['parameters'] ?? [],
            'request_body' => $def['request_body'] ?? null,
            'response_success' => $def['response_success'] ?? api_docs_std_ok(),
            'response_error' => $def['response_error'] ?? ($requiresAuth ? api_docs_std_401() : api_docs_std_422()),
            'status_codes' => $def['status_codes'] ?? api_docs_std_status($requiresAuth),
            'notes' => $def['notes'] ?? [],
        ];
    }
}

return [
    // ——— Public: app ———
    api_docs_ep([
        'id' => 'app-config',
        'category' => 'app',
        'method' => 'GET',
        'path' => 'app-config',
        'title' => 'App configuration',
        'desc' => 'Public app settings for mobile clients.',
        'requires_auth' => false,
        'headers' => [['name' => 'Accept', 'value' => 'application/json', 'required' => true]],
        'response_error' => ['status' => 500, 'body' => ['success' => false, 'message' => 'Server error']],
        'status_codes' => [
            ['code' => 200, 'description' => ['en' => 'OK', 'es' => 'Correcto']],
            ['code' => 500, 'description' => ['en' => 'Server error', 'es' => 'Error del servidor']],
        ],
        'notes' => [['en' => 'No Bearer token.', 'es' => 'Sin token.']],
    ]),
    api_docs_ep([
        'id' => 'language',
        'category' => 'app',
        'method' => 'GET',
        'path' => 'language/{id?}',
        'title' => 'Language / translations',
        'desc' => 'Language strings or list; optional path segment.',
        'requires_auth' => false,
        'parameters' => [
            ['name' => 'id', 'in' => 'path', 'type' => 'string|int', 'required' => false, 'description' => ['en' => 'Language id/code', 'es' => 'ID o código']],
        ],
    ]),

    // ——— Public: provider webhooks ———
    api_docs_ep([
        'id' => 'callback-ufitpay',
        'category' => 'callbacks',
        'method' => 'POST',
        'path' => 'virtual-card/ufitpay/callback',
        'title' => 'UfitPay virtual card callback',
        'desc' => 'Webhook from UfitPay; payload defined by provider. No user Bearer token.',
        'requires_auth' => false,
        'headers' => [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]],
        'request_body' => ['event' => 'example', 'data' => []],
        'response_success' => api_docs_std_ok(['received' => true]),
        'response_error' => ['status' => 400, 'body' => ['success' => false]],
        'status_codes' => [
            ['code' => 200, 'description' => ['en' => 'OK', 'es' => 'Correcto']],
            ['code' => 400, 'description' => ['en' => 'Bad request', 'es' => 'Petición inválida']],
        ],
        'notes' => [['en' => 'Called by UfitPay servers; secure with provider signatures in production.', 'es' => 'Llamado por el proveedor.']],
    ]),
    api_docs_ep([
        'id' => 'callback-flutterwave',
        'category' => 'callbacks',
        'method' => 'POST',
        'path' => 'virtual-card/flutterwave/callback',
        'title' => 'Flutterwave virtual card callback',
        'desc' => 'Webhook from Flutterwave for virtual card events.',
        'requires_auth' => false,
        'headers' => [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]],
        'request_body' => ['event' => 'example'],
        'response_success' => api_docs_std_ok(['received' => true]),
        'response_error' => ['status' => 400, 'body' => ['success' => false]],
        'status_codes' => [
            ['code' => 200, 'description' => ['en' => 'OK', 'es' => 'Correcto']],
            ['code' => 400, 'description' => ['en' => 'Bad request', 'es' => 'Petición inválida']],
        ],
        'notes' => [['en' => 'Called by Flutterwave; verify signatures.', 'es' => 'Verificar firma del proveedor.']],
    ]),
    api_docs_ep([
        'id' => 'payout-code',
        'category' => 'callbacks',
        'method' => 'POST',
        'path' => 'payout/{code}',
        'title' => 'Payout by code',
        'desc' => 'Virtual card payout endpoint with route code (admin/gateway integration).',
        'requires_auth' => false,
        'headers' => api_docs_json_public_headers(),
        'parameters' => [
            ['name' => 'code', 'in' => 'path', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Payout code', 'es' => 'Código']],
        ],
        'request_body' => [],
        'notes' => [['en' => 'Exact body depends on VirtualCardController@payout.', 'es' => 'Cuerpo según controlador.']],
    ]),

    // ——— Public: auth ———
    api_docs_ep([
        'id' => 'register',
        'category' => 'auth',
        'method' => 'POST',
        'path' => 'register',
        'title' => 'Register user',
        'desc' => 'Create account. Field names are exact: firstname, lastname, username (min 5, alpha_dash), email, password, password_confirmation, phone_code, phone, country, country_code. If strong_password is enabled, password must include mixed case, letters, numbers, symbols and pass uncompromised check.',
        'requires_auth' => false,
        'headers' => api_docs_json_public_headers(),
        'parameters' => [
            ['name' => 'firstname', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Given name', 'es' => 'Nombre']],
            ['name' => 'lastname', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Family name', 'es' => 'Apellido']],
            ['name' => 'username', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Unique username (min 5, letters/numbers/dash/underscore)', 'es' => 'Usuario único']],
            ['name' => 'email', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Email', 'es' => 'Correo']],
            ['name' => 'password', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Password', 'es' => 'Contraseña']],
            ['name' => 'password_confirmation', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Must match password', 'es' => 'Debe coincidir con password']],
            ['name' => 'phone_code', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Dial code e.g. +48', 'es' => 'Código país']],
            ['name' => 'phone', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Numeric local phone', 'es' => 'Teléfono']],
            ['name' => 'country', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Country name or code as stored', 'es' => 'País']],
            ['name' => 'country_code', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'ISO country code', 'es' => 'Código ISO']],
            ['name' => 'sponsor', 'in' => 'body', 'type' => 'string', 'required' => false, 'description' => ['en' => 'Optional referrer username', 'es' => 'Opcional: patrocinador']],
        ],
        'request_body' => [
            'firstname' => 'Jane',
            'lastname' => 'Doe',
            'username' => 'janedoe',
            'email' => 'jane@example.com',
            'password' => 'Secret1!x',
            'password_confirmation' => 'Secret1!x',
            'phone_code' => '+48',
            'phone' => '600000000',
            'country' => 'Poland',
            'country_code' => 'PL',
        ],
        'response_success' => api_docs_std_ok(['status' => 'success', 'message' => 'User registered successfully.', 'token' => '1|…']),
        'response_error' => api_docs_std_422(),
        'status_codes' => [
            ['code' => 200, 'description' => ['en' => 'Success', 'es' => 'Éxito']],
            ['code' => 422, 'description' => ['en' => 'Validation', 'es' => 'Validación']],
        ],
    ]),
    api_docs_ep([
        'id' => 'login',
        'category' => 'auth',
        'method' => 'POST',
        'path' => 'login',
        'title' => 'Login',
        'desc' => 'Authenticate; returns Sanctum token in `token`. Send either `username` (login name) or `email` plus `password`.',
        'requires_auth' => false,
        'headers' => api_docs_json_public_headers(),
        'parameters' => [
            ['name' => 'username', 'in' => 'body', 'type' => 'string', 'required' => false, 'description' => ['en' => 'Username (use this or email)', 'es' => 'Usuario']],
            ['name' => 'email', 'in' => 'body', 'type' => 'string', 'required' => false, 'description' => ['en' => 'Email if username not sent', 'es' => 'Correo si no envía username']],
            ['name' => 'password', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Password', 'es' => 'Contraseña']],
        ],
        'request_body' => ['email' => 'user@example.com', 'password' => 'secret'],
        'response_success' => api_docs_std_ok(['status' => 'success', 'message' => 'User logged in successfully.', 'token' => '2|…']),
        'response_error' => ['status' => 200, 'body' => ['status' => 'error', 'message' => 'credentials do not match']],
        'status_codes' => [
            ['code' => 200, 'description' => ['en' => 'OK', 'es' => 'Correcto']],
            ['code' => 401, 'description' => ['en' => 'Unauthorized', 'es' => 'No autorizado']],
            ['code' => 422, 'description' => ['en' => 'Validation', 'es' => 'Validación']],
        ],
    ]),
    api_docs_ep([
        'id' => 'recovery-pass-get-email',
        'category' => 'auth',
        'method' => 'POST',
        'path' => 'recovery-pass/get-email',
        'title' => 'Password recovery — request email step',
        'desc' => 'First step of password recovery flow.',
        'requires_auth' => false,
        'headers' => api_docs_json_public_headers(),
        'parameters' => [
            ['name' => 'email', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Registered email', 'es' => 'Correo registrado']],
        ],
        'request_body' => ['email' => 'user@example.com'],
    ]),
    api_docs_ep([
        'id' => 'recovery-pass-get-code',
        'category' => 'auth',
        'method' => 'POST',
        'path' => 'recovery-pass/get-code',
        'title' => 'Password recovery — verify code step',
        'desc' => 'Submit verification code from email/SMS.',
        'requires_auth' => false,
        'headers' => api_docs_json_public_headers(),
        'parameters' => [
            ['name' => 'email', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Email', 'es' => 'Correo']],
            ['name' => 'code', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'OTP code', 'es' => 'Código']],
        ],
        'request_body' => ['email' => 'user@example.com', 'code' => '123456'],
    ]),
    api_docs_ep([
        'id' => 'update-pass',
        'category' => 'auth',
        'method' => 'POST',
        'path' => 'update-pass',
        'title' => 'Update password (recovery)',
        'desc' => 'Set new password after recovery flow. Throttled (3 per minute).',
        'requires_auth' => false,
        'headers' => api_docs_json_public_headers(),
        'parameters' => [
            ['name' => 'email', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Email', 'es' => 'Correo']],
            ['name' => 'password', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'New password', 'es' => 'Nueva contraseña']],
            ['name' => 'password_confirmation', 'in' => 'body', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Confirm password', 'es' => 'Confirmación']],
        ],
        'request_body' => ['email' => 'user@example.com', 'password' => 'new-secret', 'password_confirmation' => 'new-secret'],
        'status_codes' => [
            ['code' => 200, 'description' => ['en' => 'OK', 'es' => 'Correcto']],
            ['code' => 422, 'description' => ['en' => 'Validation', 'es' => 'Validación']],
            ['code' => 429, 'description' => ['en' => 'Too many requests', 'es' => 'Demasiadas peticiones']],
        ],
        'notes' => [['en' => 'Middleware: throttle:3,1', 'es' => 'Límite 3 por minuto.']],
    ]),
    api_docs_ep([
        'id' => 'logout',
        'category' => 'auth',
        'method' => 'POST',
        'path' => 'logout',
        'title' => 'Logout',
        'desc' => 'Revoke current Sanctum token.',
        'requires_auth' => true,
        'parameters' => [],
        'request_body' => null,
    ]),
    api_docs_ep([
        'id' => 'current-user',
        'category' => 'auth',
        'method' => 'GET',
        'path' => 'user',
        'title' => 'Current user',
        'desc' => 'Authenticated user model (Sanctum).',
        'requires_auth' => true,
        'parameters' => [],
        'request_body' => null,
        'response_success' => api_docs_std_ok(['id' => 1, 'name' => 'Jane', 'email' => 'jane@example.com']),
    ]),

    // ——— Sanctum: verification (before CheckVerificationApi) ———
    api_docs_ep([
        'id' => 'twoFA-Verify',
        'category' => 'verification',
        'method' => 'POST',
        'path' => 'twoFA-Verify',
        'title' => 'Verify 2FA code',
        'desc' => 'Submit two-factor authentication code for API session.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['code' => '123456'],
        'notes' => [['en' => 'Does not require CheckVerificationApi.', 'es' => 'Sin middleware CheckVerificationApi.']],
    ]),
    api_docs_ep([
        'id' => 'mail-verify',
        'category' => 'verification',
        'method' => 'POST',
        'path' => 'mail-verify',
        'title' => 'Verify email',
        'desc' => 'Confirm email with code sent to user.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['code' => '123456'],
    ]),
    api_docs_ep([
        'id' => 'sms-verify',
        'category' => 'verification',
        'method' => 'POST',
        'path' => 'sms-verify',
        'title' => 'Verify SMS',
        'desc' => 'Confirm phone with SMS code.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['code' => '123456'],
    ]),
    api_docs_ep([
        'id' => 'resend-code',
        'category' => 'verification',
        'method' => 'GET',
        'path' => 'resend-code',
        'title' => 'Resend verification code',
        'desc' => 'Resend email/SMS code according to app state.',
        'requires_auth' => true,
        'parameters' => [],
        'request_body' => null,
    ]),

    // ——— CheckVerificationApi: home & config ———
    api_docs_ep(['id' => 'transaction-list', 'category' => 'home', 'method' => 'GET', 'path' => 'transaction-list', 'title' => 'Transaction list', 'desc' => 'Paginated or filtered transactions for the user.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep(['id' => 'fund-list', 'category' => 'home', 'method' => 'GET', 'path' => 'fund-list', 'title' => 'Fund list', 'desc' => 'Funding / deposit history list.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep(['id' => 'referral-list', 'category' => 'home', 'method' => 'GET', 'path' => 'referral-list', 'title' => 'Referral list', 'desc' => 'User referrals summary/list.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep(['id' => 'referral-details', 'category' => 'home', 'method' => 'GET', 'path' => 'referral-details', 'title' => 'Referral details', 'desc' => 'Referral details (same controller as list in routes).', 'parameters' => [], 'request_body' => null]),
    api_docs_ep(['id' => 'gateways', 'category' => 'home', 'method' => 'GET', 'path' => 'gateways', 'title' => 'Payment gateways', 'desc' => 'Available deposit/payment gateways.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep(['id' => 'notification-settings', 'category' => 'home', 'method' => 'GET', 'path' => 'notification-settings', 'title' => 'Notification settings', 'desc' => 'User notification preferences.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep([
        'id' => 'notification-permission',
        'category' => 'home',
        'method' => 'POST',
        'path' => 'notification-permission',
        'title' => 'Store notification permission',
        'desc' => 'Save push/notification permissions from client.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['device_token' => 'fcm-or-apns-token', 'channel' => 'push'],
    ]),
    api_docs_ep(['id' => 'pusher-config', 'category' => 'home', 'method' => 'GET', 'path' => 'pusher-config', 'title' => 'Pusher config', 'desc' => 'Realtime/Pusher credentials for client.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep([
        'id' => 'dashboard',
        'category' => 'dashboard',
        'method' => 'GET',
        'path' => 'dashboard',
        'title' => 'Dashboard',
        'desc' => 'Dashboard summary; requires verified user (CheckVerificationApi).',
        'parameters' => [],
        'request_body' => null,
        'notes' => [['en' => 'CheckVerificationApi middleware.', 'es' => 'Middleware CheckVerificationApi.']],
    ]),

    // ——— Wallet ———
    api_docs_ep(['id' => 'wallet-list', 'category' => 'wallet', 'method' => 'GET', 'path' => 'wallet-list', 'title' => 'List wallets', 'desc' => 'User wallets and balances.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep([
        'id' => 'wallet-store',
        'category' => 'wallet',
        'method' => 'POST',
        'path' => 'wallet-store',
        'title' => 'Create wallet',
        'desc' => 'Add a new wallet (currency, etc.).',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['currency_id' => 1, 'name' => 'USD Wallet'],
    ]),
    api_docs_ep([
        'id' => 'wallet-exchange',
        'category' => 'wallet',
        'method' => 'POST',
        'path' => 'wallet-exchange',
        'title' => 'Wallet exchange',
        'desc' => 'Exchange between wallets per app rules.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['from_wallet' => 'uuid', 'to_wallet' => 'uuid', 'amount' => '100'],
    ]),
    api_docs_ep([
        'id' => 'money-exchange',
        'category' => 'wallet',
        'method' => 'POST',
        'path' => 'money-exchange',
        'title' => 'Money exchange',
        'desc' => 'Convert money between currencies/wallets.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['amount' => '50', 'from_currency' => 'USD', 'to_currency' => 'EUR'],
    ]),
    api_docs_ep([
        'id' => 'wallet-transaction',
        'category' => 'wallet',
        'method' => 'GET',
        'path' => 'wallet-transaction/{uuid}',
        'title' => 'Wallet transactions',
        'desc' => 'Transactions for a wallet by UUID.',
        'parameters' => [
            ['name' => 'uuid', 'in' => 'path', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Wallet UUID', 'es' => 'UUID cartera']],
        ],
        'request_body' => null,
    ]),
    api_docs_ep([
        'id' => 'default-wallet',
        'category' => 'wallet',
        'method' => 'POST',
        'path' => 'default-wallet/{id}',
        'title' => 'Set default wallet',
        'desc' => 'Mark wallet as default for user.',
        'requires_auth' => true,
        'headers' => api_docs_auth_headers(),
        'parameters' => [
            ['name' => 'id', 'in' => 'path', 'type' => 'integer', 'required' => true, 'description' => ['en' => 'Wallet id', 'es' => 'ID cartera']],
        ],
        'request_body' => null,
    ]),

    // ——— Profile ———
    api_docs_ep(['id' => 'profile', 'category' => 'profile', 'method' => 'GET', 'path' => 'profile', 'title' => 'Get profile', 'desc' => 'Full profile for mobile app.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep([
        'id' => 'profile-update-image',
        'category' => 'profile',
        'method' => 'POST',
        'path' => 'profile-update/image',
        'title' => 'Update profile image',
        'desc' => 'Upload avatar; typically multipart/form-data (not JSON).',
        'requires_auth' => true,
        'headers' => [
            ['name' => 'Authorization', 'value' => 'Bearer {token}', 'required' => true],
            ['name' => 'Content-Type', 'value' => 'multipart/form-data', 'required' => true],
        ],
        'parameters' => [
            ['name' => 'image', 'in' => 'body', 'type' => 'file', 'required' => true, 'description' => ['en' => 'Image file', 'es' => 'Archivo imagen']],
        ],
        'request_body' => null,
        'notes' => [['en' => 'Try API may not support multipart; use Postman/cURL for file upload.', 'es' => 'Multipart mejor con cliente externo.']],
    ]),
    api_docs_ep([
        'id' => 'profile-update',
        'category' => 'profile',
        'method' => 'POST',
        'path' => 'profile-update',
        'title' => 'Update profile',
        'desc' => 'Update name, phone, address fields per validation.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['first_name' => 'Jane', 'last_name' => 'Doe', 'phone' => '+1000000000'],
    ]),
    api_docs_ep([
        'id' => 'email-update',
        'category' => 'profile',
        'method' => 'PUT',
        'path' => 'email-update/{user}',
        'title' => 'Update email',
        'desc' => 'Change email for user id (route model binding).',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'parameters' => [
            ['name' => 'user', 'in' => 'path', 'type' => 'integer', 'required' => true, 'description' => ['en' => 'User id', 'es' => 'ID usuario']],
        ],
        'request_body' => ['email' => 'new@example.com', 'password' => 'current-password'],
    ]),
    api_docs_ep([
        'id' => 'update-password',
        'category' => 'profile',
        'method' => 'POST',
        'path' => 'update-password',
        'title' => 'Update password',
        'desc' => 'Change password while logged in.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['current_password' => 'old', 'password' => 'new-secret', 'password_confirmation' => 'new-secret'],
    ]),
    api_docs_ep([
        'id' => 'verify-profile',
        'category' => 'profile',
        'method' => 'GET',
        'path' => 'verify/{id?}',
        'title' => 'Verification status / step',
        'desc' => 'KYC or verification step payload.',
        'parameters' => [
            ['name' => 'id', 'in' => 'path', 'type' => 'integer', 'required' => false, 'description' => ['en' => 'Optional step id', 'es' => 'ID paso opcional']],
        ],
        'request_body' => null,
    ]),
    api_docs_ep([
        'id' => 'kyc-submit',
        'category' => 'profile',
        'method' => 'POST',
        'path' => 'kyc-submit',
        'title' => 'Submit KYC',
        'desc' => 'Submit KYC documents/data.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['document_type' => 'passport', 'document_number' => 'AB123456'],
    ]),
    api_docs_ep([
        'id' => 'delete-account',
        'category' => 'profile',
        'method' => 'POST',
        'path' => 'delete-account',
        'title' => 'Delete account',
        'desc' => 'Request account deletion per app rules.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['password' => 'confirm-deletion'],
    ]),
    api_docs_ep([
        'id' => 'logout-from-all-devices',
        'category' => 'profile',
        'method' => 'POST',
        'path' => 'logout-from-all-devices',
        'title' => 'Logout from all devices',
        'desc' => 'Invalidate sessions/tokens everywhere. Route also uses web auth middleware.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => [],
        'notes' => [['en' => 'Defined with middleware auth + web in api.php; behaviour may differ in pure API clients.', 'es' => 'También usa middleware web.']],
    ]),

    // ——— 2FA ———
    api_docs_ep(['id' => '2FA-security', 'category' => 'security', 'method' => 'GET', 'path' => '2FA-security', 'title' => '2FA security status', 'desc' => '2FA settings and QR/secret state.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep([
        'id' => '2FA-security-enable',
        'category' => 'security',
        'method' => 'POST',
        'path' => '2FA-security/enable',
        'title' => 'Enable 2FA',
        'desc' => 'Enable two-factor authentication.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['code' => '123456'],
    ]),
    api_docs_ep([
        'id' => '2FA-security-disable',
        'category' => 'security',
        'method' => 'POST',
        'path' => '2FA-security/disable',
        'title' => 'Disable 2FA',
        'desc' => 'Disable two-factor authentication.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['password' => 'current-password', 'code' => '123456'],
    ]),

    // ——— Support tickets ———
    api_docs_ep(['id' => 'ticket-list', 'category' => 'support', 'method' => 'GET', 'path' => 'ticket-list', 'title' => 'Ticket list', 'desc' => 'Support tickets for user.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep([
        'id' => 'ticket-view',
        'category' => 'support',
        'method' => 'GET',
        'path' => 'ticket-view/{ticketId}',
        'title' => 'Ticket detail',
        'desc' => 'Single ticket with messages.',
        'parameters' => [
            ['name' => 'ticketId', 'in' => 'path', 'type' => 'string|int', 'required' => true, 'description' => ['en' => 'Ticket id', 'es' => 'ID ticket']],
        ],
        'request_body' => null,
    ]),
    api_docs_ep([
        'id' => 'create-ticket',
        'category' => 'support',
        'method' => 'POST',
        'path' => 'create-ticket',
        'title' => 'Create ticket',
        'desc' => 'Open a new support ticket.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['subject' => 'Help', 'message' => 'I need assistance…'],
    ]),
    api_docs_ep([
        'id' => 'reply-ticket',
        'category' => 'support',
        'method' => 'POST',
        'path' => 'reply-ticket/{id}',
        'title' => 'Reply to ticket',
        'desc' => 'Add reply to existing ticket.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'parameters' => [
            ['name' => 'id', 'in' => 'path', 'type' => 'integer', 'required' => true, 'description' => ['en' => 'Ticket id', 'es' => 'ID']],
        ],
        'request_body' => ['message' => 'Reply text…'],
    ]),
    api_docs_ep([
        'id' => 'close-ticket',
        'category' => 'support',
        'method' => 'PATCH',
        'path' => 'close-ticket/{id}',
        'title' => 'Close ticket',
        'desc' => 'Mark ticket as closed.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'parameters' => [
            ['name' => 'id', 'in' => 'path', 'type' => 'integer', 'required' => true, 'description' => ['en' => 'Ticket id', 'es' => 'ID']],
        ],
        'request_body' => [],
    ]),
    api_docs_ep([
        'id' => 'delete-ticket',
        'category' => 'support',
        'method' => 'DELETE',
        'path' => 'delete-ticket/{ticketId}',
        'title' => 'Delete ticket',
        'desc' => 'Remove a ticket.',
        'requires_auth' => true,
        'parameters' => [
            ['name' => 'ticketId', 'in' => 'path', 'type' => 'string|int', 'required' => true, 'description' => ['en' => 'Ticket id', 'es' => 'ID']],
        ],
        'request_body' => null,
    ]),

    // ——— Recipients ———
    api_docs_ep(['id' => 'recipient-list', 'category' => 'recipients', 'method' => 'GET', 'path' => 'recipient-list', 'title' => 'Recipient list', 'desc' => 'Saved transfer recipients.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep([
        'id' => 'recipient-details',
        'category' => 'recipients',
        'method' => 'GET',
        'path' => 'recipient-details/{uuid}',
        'title' => 'Recipient details',
        'desc' => 'Single recipient by UUID.',
        'parameters' => [
            ['name' => 'uuid', 'in' => 'path', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Recipient UUID', 'es' => 'UUID']],
        ],
        'request_body' => null,
    ]),
    api_docs_ep([
        'id' => 'recipient-store',
        'category' => 'recipients',
        'method' => 'POST',
        'path' => 'recipient-store',
        'title' => 'Create recipient',
        'desc' => 'Add bank/cash recipient; body matches RecipientController validation.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['service_id' => 1, 'country' => 'US', 'fields' => []],
    ]),
    api_docs_ep([
        'id' => 'recipient-user-store',
        'category' => 'recipients',
        'method' => 'POST',
        'path' => 'recipient-user-store',
        'title' => 'Create user recipient',
        'desc' => 'Add another user as recipient.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['email' => 'payee@example.com'],
    ]),
    api_docs_ep([
        'id' => 'recipient-update-name',
        'category' => 'recipients',
        'method' => 'PUT',
        'path' => 'recipient-update-name/{recipient}',
        'title' => 'Update recipient name',
        'desc' => 'Rename recipient (route model binding).',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'parameters' => [
            ['name' => 'recipient', 'in' => 'path', 'type' => 'integer', 'required' => true, 'description' => ['en' => 'Recipient id', 'es' => 'ID destinatario']],
        ],
        'request_body' => ['name' => 'New label'],
    ]),
    api_docs_ep([
        'id' => 'recipient-delete',
        'category' => 'recipients',
        'method' => 'DELETE',
        'path' => 'recipient-delete/{recipient}',
        'title' => 'Delete recipient',
        'desc' => 'Remove recipient.',
        'requires_auth' => true,
        'parameters' => [
            ['name' => 'recipient', 'in' => 'path', 'type' => 'integer', 'required' => true, 'description' => ['en' => 'Recipient id', 'es' => 'ID']],
        ],
        'request_body' => null,
    ]),
    api_docs_ep(['id' => 'get-services', 'category' => 'recipients', 'method' => 'GET', 'path' => 'get-services', 'title' => 'Transfer services', 'desc' => 'Available payout/collection services for recipient flow.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep(['id' => 'get-bank', 'category' => 'recipients', 'method' => 'GET', 'path' => 'get-bank', 'title' => 'Banks list', 'desc' => 'Banks for selected service/country (query params as per controller).', 'parameters' => [
        ['name' => 'query params', 'in' => 'query', 'type' => 'string', 'required' => false, 'description' => ['en' => 'See RecipientController@getBank', 'es' => 'Ver controlador']],
    ], 'request_body' => null]),
    api_docs_ep(['id' => 'generate-fields', 'category' => 'recipients', 'method' => 'GET', 'path' => 'generate-fields', 'title' => 'Dynamic recipient fields', 'desc' => 'Form field schema for a service.', 'parameters' => [
        ['name' => 'query params', 'in' => 'query', 'type' => 'string', 'required' => false, 'description' => ['en' => 'See RecipientController@generateFields', 'es' => 'Ver controlador']],
    ], 'request_body' => null]),

    // ——— Money request ———
    api_docs_ep([
        'id' => 'money-request-form',
        'category' => 'money-request',
        'method' => 'GET',
        'path' => 'money-request-form/{uuid}',
        'title' => 'Money request form data',
        'desc' => 'Form schema for requesting money from recipient link.',
        'parameters' => [
            ['name' => 'uuid', 'in' => 'path', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Request link UUID', 'es' => 'UUID enlace']],
        ],
        'request_body' => null,
        'notes' => [['en' => 'ApiKYC middleware — KYC must be complete.', 'es' => 'Middleware ApiKYC.']],
    ]),
    api_docs_ep([
        'id' => 'money-request',
        'category' => 'money-request',
        'method' => 'POST',
        'path' => 'money-request',
        'title' => 'Submit money request',
        'desc' => 'Create money request to a user.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['recipient_uuid' => '…', 'amount' => '100', 'currency' => 'USD'],
        'notes' => [['en' => 'ApiKYC middleware.', 'es' => 'ApiKYC.']],
    ]),
    api_docs_ep([
        'id' => 'money-request-action',
        'category' => 'money-request',
        'method' => 'POST',
        'path' => 'money-request-action',
        'title' => 'Money request action',
        'desc' => 'Accept or decline incoming money request.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['trx_id' => '…', 'action' => 'accept'],
        'notes' => [['en' => 'ApiKYC middleware.', 'es' => 'ApiKYC.']],
    ]),
    api_docs_ep(['id' => 'money-request-list', 'category' => 'money-request', 'method' => 'GET', 'path' => 'money-request-list', 'title' => 'Money request list', 'desc' => 'List sent/received money requests.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep([
        'id' => 'money-request-details',
        'category' => 'money-request',
        'method' => 'GET',
        'path' => 'money-request-details/{trx_id}',
        'title' => 'Money request details',
        'desc' => 'Single request by transaction id.',
        'parameters' => [
            ['name' => 'trx_id', 'in' => 'path', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Transaction id', 'es' => 'ID transacción']],
        ],
        'request_body' => null,
    ]),

    // ——— Transfers ———
    api_docs_ep(['id' => 'transfer-list', 'category' => 'transfers', 'method' => 'GET', 'path' => 'transfer-list', 'title' => 'Transfer list', 'desc' => 'User money transfers.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep([
        'id' => 'transfer-details',
        'category' => 'transfers',
        'method' => 'GET',
        'path' => 'transfer-details/{uuid}',
        'title' => 'Transfer details',
        'desc' => 'Single transfer by UUID.',
        'parameters' => [
            ['name' => 'uuid', 'in' => 'path', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Transfer UUID', 'es' => 'UUID']],
        ],
        'request_body' => null,
    ]),
    api_docs_ep(['id' => 'transfer-amount', 'category' => 'transfers', 'method' => 'GET', 'path' => 'transfer-amount', 'title' => 'Transfer amount step', 'desc' => 'Data for amount/currency step in transfer wizard.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep([
        'id' => 'transfer-recipient',
        'category' => 'transfers',
        'method' => 'GET',
        'path' => 'transfer-recipient/{country?}',
        'title' => 'Transfer recipient step',
        'desc' => 'Route accepts GET and POST (same URI). Use POST when submitting form data.',
        'parameters' => [
            ['name' => 'country', 'in' => 'path', 'type' => 'string', 'required' => false, 'description' => ['en' => 'Country code', 'es' => 'Código país']],
        ],
        'request_body' => null,
        'notes' => [['en' => 'Defined as Route::match GET+POST in api.php.', 'es' => 'GET y POST soportados.']],
    ]),
    api_docs_ep([
        'id' => 'transfer-review',
        'category' => 'transfers',
        'method' => 'GET',
        'path' => 'transfer-review/{uuid}',
        'title' => 'Transfer review',
        'desc' => 'Review screen before payment.',
        'parameters' => [
            ['name' => 'uuid', 'in' => 'path', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Transfer UUID', 'es' => 'UUID']],
        ],
        'request_body' => null,
        'notes' => [['en' => 'ApiKYC middleware.', 'es' => 'ApiKYC.']],
    ]),
    api_docs_ep([
        'id' => 'transfer-payment-store',
        'category' => 'transfers',
        'method' => 'POST',
        'path' => 'transfer-payment-store',
        'title' => 'Store transfer payment',
        'desc' => 'Persist payment step for transfer.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['uuid' => 'transfer-uuid', 'gateway_id' => 1],
        'notes' => [['en' => 'ApiKYC middleware.', 'es' => 'ApiKYC.']],
    ]),
    api_docs_ep([
        'id' => 'transfer-pay',
        'category' => 'transfers',
        'method' => 'GET',
        'path' => 'transfer-pay/{uuid}',
        'title' => 'Transfer pay',
        'desc' => 'Payment / redirect payload for transfer.',
        'parameters' => [
            ['name' => 'uuid', 'in' => 'path', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Transfer UUID', 'es' => 'UUID']],
        ],
        'request_body' => null,
    ]),
    api_docs_ep([
        'id' => 'money-transfer-post',
        'category' => 'transfers',
        'method' => 'POST',
        'path' => 'money-transfer-post',
        'title' => 'Execute money transfer payment',
        'desc' => 'Finalize transfer payment (controller-specific body).',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['uuid' => '…', 'otp' => '123456'],
    ]),
    api_docs_ep([
        'id' => 'currency-rate',
        'category' => 'transfers',
        'method' => 'POST',
        'path' => 'currency-rate',
        'title' => 'Currency rate',
        'desc' => 'FX rate for transfer amount conversion.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['from' => 'USD', 'to' => 'EUR', 'amount' => '100'],
    ]),
    api_docs_ep([
        'id' => 'transfer-otp',
        'category' => 'transfers',
        'method' => 'POST',
        'path' => 'transfer-otp',
        'title' => 'Transfer OTP',
        'desc' => 'Submit or request OTP for transfer; route also allows GET.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['otp' => '123456'],
        'notes' => [['en' => 'Route::match GET+POST — Try API uses POST by default.', 'es' => 'GET y POST en rutas.']],
    ]),

    // ——— Payments & deposits ———
    api_docs_ep(['id' => 'supported-currency', 'category' => 'payments', 'method' => 'GET', 'path' => 'supported-currency', 'title' => 'Supported currencies', 'desc' => 'Currencies available for deposit.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep(['id' => 'deposit-check-amount', 'category' => 'payments', 'method' => 'GET', 'path' => 'deposit-check-amount', 'title' => 'Validate deposit amount', 'desc' => 'Check min/max fees for amount (query params per controller).', 'parameters' => [
        ['name' => 'amount', 'in' => 'query', 'type' => 'string', 'required' => false, 'description' => ['en' => 'See DepositController@checkAmount', 'es' => 'Ver controlador']],
    ], 'request_body' => null]),
    api_docs_ep([
        'id' => 'payment-request',
        'category' => 'payments',
        'method' => 'POST',
        'path' => 'payment-request/{transfer?}',
        'title' => 'Create payment / deposit request',
        'desc' => 'Start add-fund or linked transfer payment; optional transfer segment.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'parameters' => [
            ['name' => 'transfer', 'in' => 'path', 'type' => 'string', 'required' => false, 'description' => ['en' => 'Optional transfer id', 'es' => 'Transfer opcional']],
        ],
        'request_body' => ['gateway' => 'stripe', 'amount' => '50', 'currency' => 'USD'],
    ]),
    api_docs_ep([
        'id' => 'payment-process',
        'category' => 'payments',
        'method' => 'GET',
        'path' => 'payment-process/{trx_id}',
        'title' => 'Payment process / confirm view',
        'desc' => 'Deposit confirmation step by transaction id.',
        'parameters' => [
            ['name' => 'trx_id', 'in' => 'path', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Transaction id', 'es' => 'ID trx']],
        ],
        'request_body' => null,
    ]),
    api_docs_ep([
        'id' => 'addFundConfirm',
        'category' => 'payments',
        'method' => 'POST',
        'path' => 'addFundConfirm/{trx_id}',
        'title' => 'Confirm add fund',
        'desc' => 'Submit confirmation for pending deposit.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'parameters' => [
            ['name' => 'trx_id', 'in' => 'path', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Transaction id', 'es' => 'ID trx']],
        ],
        'request_body' => ['gateway_response' => []],
    ]),
    api_docs_ep([
        'id' => 'card-payment',
        'category' => 'payments',
        'method' => 'POST',
        'path' => 'card-payment',
        'title' => 'Card payment',
        'desc' => 'Process card payment payload.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['trx_id' => '…', 'token' => 'gateway-token'],
    ]),
    api_docs_ep([
        'id' => 'payment-done',
        'category' => 'payments',
        'method' => 'POST',
        'path' => 'payment-done',
        'title' => 'Payment done callback',
        'desc' => 'Client notifies completion or gateway finalizes.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['trx_id' => '…', 'status' => 'completed'],
    ]),
    api_docs_ep(['id' => 'payment-webview', 'category' => 'payments', 'method' => 'GET', 'path' => 'payment-webview', 'title' => 'Payment webview URL/data', 'desc' => 'Webview payload for hosted payment pages.', 'parameters' => [], 'request_body' => null]),

    // PayMoney / partner payment API (PayMoneyPaymentController — config/paymoney.php)
    api_docs_ep([
        'id' => 'payments-initiate',
        'category' => 'payments',
        'method' => 'POST',
        'path' => 'payments/initiate',
        'title' => 'PayMoney — initiate payment',
        'title_es' => 'PayMoney — iniciar pago',
        'desc' => 'Creates a local payment row and calls the configured PayMoney (or partner) API to start a transaction. Returns payment_id, external_transaction_id, and checkout_url when the provider returns one. Requires verified account (same middleware as other payments). Env: PAYMONEY_BASE_URL, PAYMONEY_API_KEY, PAYMONEY_API_SECRET; use PAYMONEY_MOCK=true for local testing without HTTP.',
        'desc_es' => 'Crea un pago local y llama a la API PayMoney configurada. Requiere cuenta verificada. Variables: PAYMONEY_*; PAYMONEY_MOCK=true para pruebas.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'parameters' => [],
        'request_body' => [
            'amount' => 99.99,
            'currency' => 'PLN',
            'description' => 'Order 123',
            'return_url' => 'https://your-app.example/pay/return',
            'cancel_url' => 'https://your-app.example/pay/cancel',
            'metadata' => ['order_id' => '123'],
        ],
        'response_success' => api_docs_std_ok([
            'status' => 'success',
            'data' => [
                'payment_id' => 1,
                'status' => 'pending',
                'external_transaction_id' => 'pm_txn_…',
                'checkout_url' => 'https://checkout.example/…',
                'message' => 'Payment initialized. Redirect user to checkout_url when present.',
            ],
        ]),
        'response_error' => ['status' => 422, 'body' => ['status' => 'error', 'message' => ['amount' => ['The amount field is required.']]]],
        'status_codes' => [
            ['code' => 200, 'description' => ['en' => 'Payment created', 'es' => 'Pago creado']],
            ['code' => 401, 'description' => ['en' => 'Unauthenticated', 'es' => 'No autenticado']],
            ['code' => 403, 'description' => ['en' => 'Verification / KYC required', 'es' => 'Verificación requerida']],
            ['code' => 422, 'description' => ['en' => 'Validation', 'es' => 'Validación']],
            ['code' => 502, 'description' => ['en' => 'Provider error', 'es' => 'Error del proveedor']],
        ],
        'notes' => [
            ['en' => 'Implementation: App\Http\Controllers\API\PayMoneyPaymentController@initiate, App\Services\PayMoneyService.', 'es' => 'Controlador PayMoneyPaymentController, servicio PayMoneyService.'],
        ],
    ]),
    api_docs_ep([
        'id' => 'payments-webhook',
        'category' => 'payments',
        'method' => 'POST',
        'path' => 'payments/webhook',
        'title' => 'PayMoney — webhook / callback',
        'title_es' => 'PayMoney — webhook',
        'desc' => 'Server-to-server callback from PayMoney (or partner). No Bearer token. When PAYMONEY_WEBHOOK_SECRET (or API secret) is set, the request must include a valid HMAC signature in the header named by PAYMONEY_WEBHOOK_SIGNATURE_HEADER (default X-PayMoney-Signature). Body should include transaction_id or id matching external_transaction_id.',
        'desc_es' => 'Callback servidor a servidor. Sin Bearer. Firma HMAC si PAYMONEY_WEBHOOK_SECRET está definido. Cuerpo: transaction_id o id.',
        'requires_auth' => false,
        'headers' => [
            ['name' => 'Content-Type', 'value' => 'application/json', 'required' => true],
            ['name' => 'Accept', 'value' => 'application/json', 'required' => true],
            ['name' => 'X-PayMoney-Signature', 'value' => '{hmac}', 'required' => false, 'description' => ['en' => 'Required when webhook secret is configured', 'es' => 'Requerido si hay secreto']],
        ],
        'parameters' => [],
        'request_body' => [
            'transaction_id' => 'pm_txn_…',
            'status' => 'completed',
            'amount' => '99.99',
            'currency' => 'PLN',
        ],
        'response_success' => api_docs_std_ok(['status' => 'ok']),
        'response_error' => ['status' => 401, 'body' => ['status' => 'error', 'message' => 'Invalid signature']],
        'status_codes' => [
            ['code' => 200, 'description' => ['en' => 'Acknowledged', 'es' => 'Recibido']],
            ['code' => 401, 'description' => ['en' => 'Invalid signature', 'es' => 'Firma inválida']],
            ['code' => 422, 'description' => ['en' => 'Bad payload', 'es' => 'Cuerpo inválido']],
            ['code' => 429, 'description' => ['en' => 'Too many requests (throttle)', 'es' => 'Límite de peticiones']],
        ],
        'notes' => [
            ['en' => 'Register this URL in the PayMoney merchant dashboard. Throttle: 120/min.', 'es' => 'Registrar URL en el panel del comercio.'],
        ],
    ]),
    api_docs_ep([
        'id' => 'payments-show',
        'category' => 'payments',
        'method' => 'GET',
        'path' => 'payments/{id}',
        'title' => 'PayMoney — get payment status',
        'title_es' => 'PayMoney — estado del pago',
        'desc' => 'Returns one payment for the authenticated user (owner only). If status is pending or processing and external_transaction_id is set, the server may refresh status from the provider.',
        'desc_es' => 'Devuelve un pago del usuario autenticado. Puede actualizar el estado desde el proveedor si está pendiente.',
        'requires_auth' => true,
        'headers' => api_docs_auth_headers(),
        'parameters' => [
            ['name' => 'id', 'in' => 'path', 'type' => 'integer', 'required' => true, 'description' => ['en' => 'Local payment id (payments.id)', 'es' => 'ID local del pago']],
        ],
        'request_body' => null,
        'response_success' => api_docs_std_ok([
            'status' => 'success',
            'data' => [
                'id' => 1,
                'amount' => '99.99',
                'currency' => 'PLN',
                'status' => 'completed',
                'external_transaction_id' => 'pm_txn_…',
                'response_payload' => ['initiate' => [], 'webhook' => []],
                'created_at' => '2025-03-27T12:00:00+00:00',
                'updated_at' => '2025-03-27T12:05:00+00:00',
            ],
        ]),
        'response_error' => ['status' => 404, 'body' => ['status' => 'error', 'message' => 'Payment not found.']],
        'status_codes' => [
            ['code' => 200, 'description' => ['en' => 'OK', 'es' => 'Correcto']],
            ['code' => 401, 'description' => ['en' => 'Unauthenticated', 'es' => 'No autenticado']],
            ['code' => 403, 'description' => ['en' => 'Forbidden', 'es' => 'Prohibido']],
            ['code' => 404, 'description' => ['en' => 'Not found or not yours', 'es' => 'No encontrado']],
        ],
        'notes' => [
            ['en' => 'Path id must be numeric (whereNumber).', 'es' => 'El id debe ser numérico.'],
        ],
    ]),

    // ——— Virtual cards (user API) ———
    api_docs_ep(['id' => 'virtual-cards', 'category' => 'virtual-cards', 'method' => 'GET', 'path' => 'virtual-cards', 'title' => 'List virtual cards', 'desc' => 'User virtual cards.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep(['id' => 'virtual-card-order', 'category' => 'virtual-cards', 'method' => 'GET', 'path' => 'virtual-card/order', 'title' => 'Virtual card order form', 'desc' => 'Order creation data/fees.', 'parameters' => [], 'request_body' => null]),
    api_docs_ep([
        'id' => 'virtual-card-order-submit',
        'category' => 'virtual-cards',
        'method' => 'POST',
        'path' => 'virtual-card/order/submit',
        'title' => 'Submit virtual card order',
        'desc' => 'Place virtual card order.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => ['currency_id' => 1, 'amount' => '25'],
    ]),
    api_docs_ep([
        'id' => 'virtual-card-confirm',
        'category' => 'virtual-cards',
        'method' => 'GET',
        'path' => 'virtual-card/confirm/{utr}',
        'title' => 'Confirm virtual card order',
        'desc' => 'Confirm order by UTR; route also accepts POST.',
        'parameters' => [
            ['name' => 'utr', 'in' => 'path', 'type' => 'string', 'required' => true, 'description' => ['en' => 'Unique transaction reference', 'es' => 'UTR']],
        ],
        'request_body' => null,
        'notes' => [['en' => 'Route::match GET+POST.', 'es' => 'GET y POST.']],
    ]),
    api_docs_ep([
        'id' => 'virtual-card-order-re-submit',
        'category' => 'virtual-cards',
        'method' => 'POST',
        'path' => 'virtual-card/order/re-submit',
        'title' => 'Re-submit virtual card order',
        'desc' => 'Retry failed order; Route::any in api.php — POST is typical.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'request_body' => [],
        'notes' => [['en' => 'Registered as Route::any.', 'es' => 'Cualquier método en ruta.']],
    ]),
    api_docs_ep([
        'id' => 'virtual-card-block',
        'category' => 'virtual-cards',
        'method' => 'POST',
        'path' => 'virtual-card/block/{id}',
        'title' => 'Block virtual card',
        'desc' => 'Block/freeze card by id.',
        'requires_auth' => true,
        'headers' => array_merge(api_docs_auth_headers(), [['name' => 'Content-Type', 'value' => 'application/json', 'required' => true]]),
        'parameters' => [
            ['name' => 'id', 'in' => 'path', 'type' => 'integer', 'required' => true, 'description' => ['en' => 'Card id', 'es' => 'ID tarjeta']],
        ],
        'request_body' => [],
    ]),
    api_docs_ep([
        'id' => 'virtual-card-transaction',
        'category' => 'virtual-cards',
        'method' => 'GET',
        'path' => 'virtual-card/transaction/{id?}',
        'title' => 'Virtual card transactions',
        'desc' => 'Transactions for card; optional card id.',
        'parameters' => [
            ['name' => 'id', 'in' => 'path', 'type' => 'integer', 'required' => false, 'description' => ['en' => 'Card id', 'es' => 'ID tarjeta']],
        ],
        'request_body' => null,
    ]),
];
