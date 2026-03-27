<?php

namespace App\Http\Controllers;

use Closure;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class ApiDocsController extends Controller
{
    public function index(Request $request): View
    {
        $docs = config('api-docs');
        $default = $docs['default_locale'] ?? 'en';
        $locale = (string) $request->query('lang', $default);
        if (! isset($docs['locales'][$locale])) {
            $locale = $default;
        }

        $apiBase = rtrim((string) url('/api'), '/');

        $endpoints = collect($docs['endpoints'])->map(function (array $ep) use ($apiBase) {
            $ep['full_url'] = $apiBase.'/'.ltrim($ep['path'], '/');

            return $ep;
        })->values()->all();

        $byCategory = collect($endpoints)->groupBy('category');

        $t = $this->makeTranslator($locale);

        return view('api-docs.index', [
            'docs' => $docs,
            'locale' => $locale,
            'apiBase' => $apiBase,
            'endpoints' => $endpoints,
            'endpointsByCategory' => $byCategory,
            't' => $t,
            'payload' => [
                'apiBase' => $apiBase,
                'locale' => $locale,
                'endpoints' => $endpoints,
            ],
        ]);
    }

    /**
     * OpenAPI 3.0 document derived from config/api-docs-endpoints.php for Postman, codegen, and SDK tools.
     */
    public function openapi(): JsonResponse
    {
        $docs = config('api-docs');
        $meta = $docs['meta'] ?? [];
        $title = is_array($meta['title'] ?? null)
            ? (string) ($meta['title']['en'] ?? 'API')
            : (string) ($meta['title'] ?? 'API');
        $description = is_array($meta['description'] ?? null)
            ? (string) ($meta['description']['en'] ?? '')
            : (string) ($meta['description'] ?? '');
        $version = (string) ($meta['version'] ?? '1.0');

        $appUrl = rtrim((string) url('/'), '/');
        $paths = [];

        foreach ($docs['endpoints'] ?? [] as $ep) {
            if (! is_array($ep)) {
                continue;
            }
            $rawPath = (string) ($ep['path'] ?? '');
            $method = strtoupper((string) ($ep['method'] ?? 'GET'));
            if ($rawPath === '' || ! in_array($method, ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD', 'OPTIONS'], true)) {
                continue;
            }

            $path = '/'.ltrim(preg_replace('#\{([^}]+)\?\}#', '{$1}', $rawPath), '/');

            $summary = $this->openapiString($ep['title'] ?? '');
            $desc = $this->openapiString($ep['description'] ?? $ep['desc'] ?? '');

            $operation = [
                'operationId' => (string) ($ep['id'] ?? $method.'_'.preg_replace('/[^a-zA-Z0-9_-]+/', '_', trim($path, '/'))),
                'summary' => $summary !== '' ? $summary : $method.' '.$path,
                'tags' => [ucfirst((string) ($ep['category'] ?? 'api'))],
            ];
            if ($desc !== '') {
                $operation['description'] = $desc;
            }

            if (! empty($ep['requires_auth'])) {
                $operation['security'] = [['bearerAuth' => []]];
            }

            $parameters = [];
            foreach ($ep['parameters'] ?? [] as $p) {
                if (! is_array($p)) {
                    continue;
                }
                $in = (string) ($p['in'] ?? 'query');
                if ($in === 'body') {
                    continue;
                }
                $name = (string) ($p['name'] ?? '');
                if ($name === '') {
                    continue;
                }
                $required = (bool) ($p['required'] ?? false);
                if (str_contains($rawPath, '{'.$name.'?}')) {
                    $required = false;
                }
                $paramDesc = $this->openapiString($p['description'] ?? '');
                $parameters[] = array_filter([
                    'name' => $name,
                    'in' => $in,
                    'required' => $required,
                    'description' => $paramDesc !== '' ? $paramDesc : null,
                    'schema' => $this->openapiSchemaFromType((string) ($p['type'] ?? 'string')),
                ]);
            }
            if ($parameters !== []) {
                $operation['parameters'] = $parameters;
            }

            $hasBody = in_array($method, ['POST', 'PUT', 'PATCH', 'DELETE'], true);
            $bodyExample = $ep['request_body'] ?? null;
            if ($hasBody && $bodyExample !== null && $bodyExample !== [] && is_array($bodyExample)) {
                $operation['requestBody'] = [
                    'required' => true,
                    'content' => [
                        'application/json' => [
                            'schema' => ['type' => 'object'],
                            'example' => $bodyExample,
                        ],
                    ],
                ];
            }

            if (! isset($paths[$path])) {
                $paths[$path] = [];
            }
            $paths[$path][strtolower($method)] = $operation;
        }

        ksort($paths);

        $spec = [
            'openapi' => '3.0.3',
            'info' => array_filter([
                'title' => $title,
                'version' => $version,
                'description' => $description !== '' ? $description : null,
            ]),
            'servers' => [
                ['url' => $appUrl.'/api', 'description' => 'Production API base (relative to app URL)'],
            ],
            'paths' => $paths,
            'components' => [
                'securitySchemes' => [
                    'bearerAuth' => [
                        'type' => 'http',
                        'scheme' => 'bearer',
                        'description' => 'Laravel Sanctum personal access token from POST /api/login or /api/register',
                    ],
                ],
            ],
        ];

        return response()
            ->json($spec, 200, ['Content-Type' => 'application/json; charset=UTF-8'], JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);
    }

    private function openapiString(mixed $value): string
    {
        if (is_string($value)) {
            return $value;
        }
        if (is_array($value)) {
            return (string) ($value['en'] ?? reset($value) ?: '');
        }

        return '';
    }

    /**
     * @return array<string, mixed>
     */
    private function openapiSchemaFromType(string $type): array
    {
        if (str_contains($type, 'int')) {
            return ['type' => 'integer'];
        }
        if (str_contains($type, 'bool')) {
            return ['type' => 'boolean'];
        }
        if (str_contains($type, 'number') || str_contains($type, 'float')) {
            return ['type' => 'number'];
        }

        return ['type' => 'string'];
    }

    /**
     * @return Closure(array|string): string
     */
    private function makeTranslator(string $locale): Closure
    {
        return function ($value) use ($locale): string {
            if (! is_array($value)) {
                return (string) $value;
            }
            $first = reset($value);

            return (string) ($value[$locale] ?? $value['en'] ?? ($first !== false ? $first : ''));
        };
    }
}
