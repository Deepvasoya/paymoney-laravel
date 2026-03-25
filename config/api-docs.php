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
                'en' => 'All API routes live under <code class="px-1 py-0.5 rounded bg-slate-200 dark:bg-slate-800 text-sm">/api</code>. Use <code class="px-1 py-0.5 rounded bg-slate-200 dark:bg-slate-800 text-sm">https://your-domain.com/api/…</code> in production.',
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
        'try_path' => ['en' => 'Path (after /api/)', 'es' => 'Ruta (después de /api/)'],
        'try_body' => ['en' => 'Request body (JSON)', 'es' => 'Cuerpo (JSON)'],
        'send' => ['en' => 'Send request', 'es' => 'Enviar'],
        'response' => ['en' => 'Response', 'es' => 'Respuesta'],
        'open_menu' => ['en' => 'Open menu', 'es' => 'Menú'],
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
