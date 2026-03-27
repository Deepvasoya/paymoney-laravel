<?php

/**
 * API documentation registry.
 *
 * Translatable fields use: ['en' => 'English', 'es' => 'Spanish'] — add keys as needed.
 * Endpoint paths are relative to the /api prefix (e.g. "login" → /api/login).
 */
return [
    'meta' => [
        'title' => [
            'en' => 'PayMoney API Reference',
            'es' => 'Referencia API PayMoney',
        ],
        'description' => [
            'en' => 'REST API for the PayMoney mobile and partner integrations. All requests use JSON unless noted.',
            'es' => 'API REST para integraciones móviles y de socios de PayMoney.',
        ],
        'version' => '1.0',
    ],

    'default_locale' => 'en',
    'locales' => [
        'en' => 'English',
        'es' => 'Español',
    ],

    // Overview column (HTML allowed in body — keep trusted)
    'overview_sections' => [
        [
            'title' => ['en' => 'Base URL', 'es' => 'URL base'],
            'body' => [
                'en' => 'All API routes live under <code class="px-1 py-0.5 rounded bg-slate-200 dark:bg-slate-800 text-sm">/api</code>. Use <code class="px-1 py-0.5 rounded bg-slate-200 dark:bg-slate-800 text-sm">https://your-domain.com/api/…</code> in production. For Postman, Insomnia, or code generators, import <a href="/docs/openapi.json" class="text-blue-600 underline hover:text-blue-500 dark:text-blue-400 font-mono text-sm">/docs/openapi.json</a> (OpenAPI 3).',
                'es' => 'Todas las rutas están bajo <code class="px-1 py-0.5 rounded bg-slate-200 dark:bg-slate-800 text-sm">/api</code>.',
            ],
        ],
        [
            'title' => ['en' => 'Authentication', 'es' => 'Autenticación'],
            'body' => [
                'en' => 'Protected routes expect <code class="px-1 py-0.5 rounded bg-slate-200 dark:bg-slate-800 text-sm">Authorization: Bearer {token}</code> (Laravel Sanctum). Obtain a token from <strong>Login</strong> or <strong>Register</strong>.',
                'es' => 'Las rutas protegidas usan <code class="px-1 py-0.5 rounded bg-slate-200 dark:bg-slate-800 text-sm">Authorization: Bearer {token}</code> (Sanctum).',
            ],
        ],
        [
            'title' => ['en' => 'Format', 'es' => 'Formato'],
            'body' => [
                'en' => 'Send JSON bodies with <code class="px-1 py-0.5 rounded bg-slate-200 dark:bg-slate-800 text-sm">Content-Type: application/json</code> and <code class="px-1 py-0.5 rounded bg-slate-200 dark:bg-slate-800 text-sm">Accept: application/json</code> unless noted.',
                'es' => 'Envía JSON con los encabezados <code class="px-1 py-0.5 rounded bg-slate-200 dark:bg-slate-800 text-sm">Content-Type</code> y <code class="px-1 py-0.5 rounded bg-slate-200 dark:bg-slate-800 text-sm">Accept</code> en <code class="px-1 py-0.5 rounded bg-slate-200 dark:bg-slate-800 text-sm">application/json</code>.',
            ],
        ],
        [
            'anchor' => 'paymoney',
            'title' => ['en' => 'PayMoney partner payments', 'es' => 'Pagos partner PayMoney'],
            'body' => [
                'en' => 'Partner / external PSP integration via <code class="rounded bg-slate-200 px-1 font-mono text-sm dark:bg-slate-800">PayMoneyService</code> and <code class="rounded bg-slate-200 px-1 font-mono text-sm dark:bg-slate-800">PayMoneyPaymentController</code>. Endpoints (category <strong>Payments &amp; deposits</strong>): <code class="rounded bg-slate-200 px-1 font-mono text-sm dark:bg-slate-800">POST /api/payments/initiate</code> (Bearer + verified user), <code class="rounded bg-slate-200 px-1 font-mono text-sm dark:bg-slate-800">POST /api/payments/webhook</code> (no Bearer; HMAC when <code class="rounded bg-slate-200 px-1 dark:bg-slate-800">PAYMONEY_WEBHOOK_SECRET</code> is set), <code class="rounded bg-slate-200 px-1 font-mono text-sm dark:bg-slate-800">GET /api/payments/{id}</code>. Configure <code class="rounded bg-slate-200 px-1 font-mono text-sm dark:bg-slate-800">config/paymoney.php</code> and <code class="rounded bg-slate-200 px-1 font-mono text-sm dark:bg-slate-800">.env</code> (<code class="rounded bg-slate-200 px-1 dark:bg-slate-800">PAYMONEY_BASE_URL</code>, <code class="rounded bg-slate-200 px-1 dark:bg-slate-800">PAYMONEY_API_KEY</code>, <code class="rounded bg-slate-200 px-1 dark:bg-slate-800">PAYMONEY_API_SECRET</code>). Local testing: <code class="rounded bg-slate-200 px-1 dark:bg-slate-800">PAYMONEY_MOCK=true</code>.',
                'es' => 'Integración PSP: <code class="rounded bg-slate-200 px-1 font-mono text-sm dark:bg-slate-800">POST /api/payments/initiate</code>, <code class="rounded bg-slate-200 px-1 font-mono text-sm dark:bg-slate-800">POST /api/payments/webhook</code>, <code class="rounded bg-slate-200 px-1 font-mono text-sm dark:bg-slate-800">GET /api/payments/{id}</code>. Configuración en <code class="rounded bg-slate-200 px-1 dark:bg-slate-800">config/paymoney.php</code> y variables <code class="rounded bg-slate-200 px-1 dark:bg-slate-800">PAYMONEY_*</code>. Pruebas: <code class="rounded bg-slate-200 px-1 dark:bg-slate-800">PAYMONEY_MOCK=true</code>.',
            ],
        ],
        [
            'anchor' => 'iban',
            'title' => ['en' => 'IBAN validation (php-iban)', 'es' => 'Validación IBAN (php-iban)'],
            'body' => [
                'en' => 'For bank-account fields (e.g. recipients, transfers), validate IBANs on the server or in tooling with <a href="https://github.com/globalcitizen/php-iban" class="text-blue-600 underline hover:text-blue-500 dark:text-blue-400" target="_blank" rel="noopener">globalcitizen/php-iban</a> (LGPL). It parses, validates checksums, supports many countries, SEPA flags, and human/machine formats.<br><br><strong>Install</strong>: <code class="mt-2 inline-block rounded bg-slate-200 px-1.5 py-0.5 font-mono text-sm dark:bg-slate-800">composer require globalcitizen/php-iban</code><br><br><strong>Example (PHP)</strong>:<pre class="mt-3 overflow-x-auto rounded-lg bg-slate-900 p-4 font-mono text-xs text-slate-100"><code>'
                    . "if (!verify_iban(\$iban)) {\n    // reject invalid IBAN\n}\n\$machine = iban_to_machine_format(\$iban);\n\$suggestions = iban_mistranscription_suggestions(\$badIban);"
                    . '</code></pre>Procedural functions load through Composer autoload (see the package <code class="rounded bg-slate-200 px-1 dark:bg-slate-800">composer.json</code> <code class="rounded bg-slate-200 px-1 dark:bg-slate-800">files</code> entry). See the <a href="https://github.com/globalcitizen/php-iban?tab=readme-ov-file" class="text-blue-600 underline dark:text-blue-400" target="_blank" rel="noopener">project README</a> for <code class="rounded bg-slate-200 px-1 dark:bg-slate-800">verify_iban()</code>, national checksums, country registry helpers, and the optional OO wrapper.',
                'es' => 'Para datos bancarios IBAN, puedes validar en servidor con <a href="https://github.com/globalcitizen/php-iban" class="text-blue-600 underline hover:text-blue-500 dark:text-blue-400" target="_blank" rel="noopener">globalcitizen/php-iban</a> (LGPL): análisis, checksum, muchos países, SEPA y formatos legibles/máquina.<br><br><strong>Instalación</strong>: <code class="mt-2 inline-block rounded bg-slate-200 px-1.5 py-0.5 font-mono text-sm dark:bg-slate-800">composer require globalcitizen/php-iban</code><br><br><strong>Ejemplo</strong>: <code class="rounded bg-slate-200 px-1 dark:bg-slate-800">verify_iban($iban)</code>, <code class="rounded bg-slate-200 px-1 dark:bg-slate-800">iban_to_machine_format()</code>. Documentación en el <a href="https://github.com/globalcitizen/php-iban?tab=readme-ov-file" class="text-blue-600 underline dark:text-blue-400" target="_blank" rel="noopener">README</a>.',
            ],
        ],
    ],

    // Blade / UI labels (docs page chrome)
    'ui' => [
        'search_placeholder' => ['en' => 'Search endpoints…', 'es' => 'Buscar endpoints…'],
        'docs_title' => ['en' => 'API Reference', 'es' => 'Referencia API'],
        'version' => ['en' => 'Version', 'es' => 'Versión'],
        'theme_light' => ['en' => 'Light', 'es' => 'Claro'],
        'theme_dark' => ['en' => 'Dark', 'es' => 'Oscuro'],
        'language' => ['en' => 'Language', 'es' => 'Idioma'],
        'bearer_token' => ['en' => 'Bearer token', 'es' => 'Token Bearer'],
        'bearer_hint' => ['en' => 'Used in code samples and Try API', 'es' => 'Usado en ejemplos y Probar API'],
        'endpoint' => ['en' => 'Endpoint', 'es' => 'Endpoint'],
        'method' => ['en' => 'Method', 'es' => 'Método'],
        'description' => ['en' => 'Description', 'es' => 'Descripción'],
        'headers' => ['en' => 'Headers', 'es' => 'Cabeceras'],
        'parameters' => ['en' => 'Parameters', 'es' => 'Parámetros'],
        'request_example' => ['en' => 'Example request body', 'es' => 'Ejemplo de cuerpo'],
        'response_success' => ['en' => 'Success response', 'es' => 'Respuesta correcta'],
        'response_error' => ['en' => 'Error response', 'es' => 'Respuesta de error'],
        'status_codes' => ['en' => 'Status codes', 'es' => 'Códigos de estado'],
        'notes' => ['en' => 'Notes', 'es' => 'Notas'],
        'name' => ['en' => 'Name', 'es' => 'Nombre'],
        'in' => ['en' => 'In', 'es' => 'En'],
        'type' => ['en' => 'Type', 'es' => 'Tipo'],
        'required' => ['en' => 'Required', 'es' => 'Requerido'],
        'value' => ['en' => 'Value', 'es' => 'Valor'],
        'yes' => ['en' => 'Yes', 'es' => 'Sí'],
        'no' => ['en' => 'No', 'es' => 'No'],
        'copy' => ['en' => 'Copy', 'es' => 'Copiar'],
        'copied' => ['en' => 'Copied', 'es' => 'Copiado'],
        'code_examples' => ['en' => 'Code examples', 'es' => 'Ejemplos de código'],
        'try_api' => ['en' => 'Try API', 'es' => 'Probar API'],
        'try_api_hint' => [
            'en' => 'Sends a request from your browser to this site’s /api routes (same origin).',
            'es' => 'Envía una petición desde el navegador a las rutas /api de este sitio (mismo origen).',
        ],
        'try_path' => ['en' => 'Path (after /api/)', 'es' => 'Ruta (después de /api/)'],
        'try_body' => ['en' => 'Request body (JSON)', 'es' => 'Cuerpo (JSON)'],
        'send' => ['en' => 'Send request', 'es' => 'Enviar'],
        'response' => ['en' => 'Response', 'es' => 'Respuesta'],
        'open_menu' => ['en' => 'Open menu', 'es' => 'Menú'],
        'print_save_pdf' => ['en' => 'Print / Save as PDF', 'es' => 'Imprimir / Guardar PDF'],
        'openapi_spec' => ['en' => 'OpenAPI (Postman)', 'es' => 'OpenAPI (Postman)'],
        'more_languages' => ['en' => 'More languages', 'es' => 'Más lenguajes'],
        'no_params' => ['en' => 'No parameters.', 'es' => 'Sin parámetros.'],
        'no_headers_extra' => ['en' => 'No extra headers beyond Accept where noted.', 'es' => 'Sin cabeceras extra salvo Accept donde se indique.'],
    ],

    // Sidebar order — ids must match endpoint `category` in api-docs-endpoints.php
    'categories' => [
        ['id' => 'overview', 'label' => ['en' => 'Overview', 'es' => 'Resumen'], 'icon' => 'book'],
        ['id' => 'app', 'label' => ['en' => 'App & config', 'es' => 'App y configuración'], 'icon' => 'settings'],
        ['id' => 'callbacks', 'label' => ['en' => 'Webhooks & callbacks', 'es' => 'Webhooks'], 'icon' => 'webhook'],
        ['id' => 'auth', 'label' => ['en' => 'Authentication', 'es' => 'Autenticación'], 'icon' => 'key'],
        ['id' => 'verification', 'label' => ['en' => 'Verification', 'es' => 'Verificación'], 'icon' => 'shield'],
        ['id' => 'home', 'label' => ['en' => 'Home & feed', 'es' => 'Inicio y feed'], 'icon' => 'layout'],
        ['id' => 'dashboard', 'label' => ['en' => 'Dashboard', 'es' => 'Panel'], 'icon' => 'home'],
        ['id' => 'wallet', 'label' => ['en' => 'Wallets', 'es' => 'Carteras'], 'icon' => 'wallet'],
        ['id' => 'profile', 'label' => ['en' => 'Profile & KYC', 'es' => 'Perfil y KYC'], 'icon' => 'user'],
        ['id' => 'security', 'label' => ['en' => '2FA security', 'es' => 'Seguridad 2FA'], 'icon' => 'lock'],
        ['id' => 'support', 'label' => ['en' => 'Support tickets', 'es' => 'Soporte'], 'icon' => 'life-buoy'],
        ['id' => 'recipients', 'label' => ['en' => 'Recipients', 'es' => 'Destinatarios'], 'icon' => 'users'],
        ['id' => 'money-request', 'label' => ['en' => 'Money requests', 'es' => 'Solicitudes'], 'icon' => 'inbox'],
        ['id' => 'transfers', 'label' => ['en' => 'Money transfers', 'es' => 'Transferencias'], 'icon' => 'arrow-right-left'],
        ['id' => 'payments', 'label' => ['en' => 'Payments & deposits', 'es' => 'Pagos'], 'icon' => 'credit-card'],
        ['id' => 'virtual-cards', 'label' => ['en' => 'Virtual cards', 'es' => 'Tarjetas virtuales'], 'icon' => 'card'],
    ],

    'endpoints' => require __DIR__.'/api-docs-endpoints.php',
];
