<?php

namespace App\Http\Controllers;

use Closure;
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
