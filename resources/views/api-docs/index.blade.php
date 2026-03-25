@php
    /** @var \Closure $t */
    $ui = $docs['ui'] ?? [];
@endphp
<!DOCTYPE html>
<html lang="{{ $locale }}" class="h-full scroll-smooth">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ $t($docs['meta']['title'] ?? 'API') }} — {{ config('app.name', 'Laravel') }}</title>
    <meta name="description" content="{{ $t($docs['meta']['description'] ?? '') }}">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            darkMode: 'class',
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'system-ui', 'sans-serif'],
                        mono: ['JetBrains Mono', 'ui-monospace', 'monospace'],
                    },
                },
            },
        };
    </script>
    <style>
        [id] { scroll-margin-top: 5.5rem; }
    </style>
</head>
<body class="h-full min-h-screen bg-slate-50 font-sans text-slate-900 antialiased dark:bg-slate-950 dark:text-slate-100">
    <div id="docs-backdrop" class="fixed inset-0 z-40 hidden bg-slate-900/50 lg:hidden" aria-hidden="true"></div>

    <header class="sticky top-0 z-30 border-b border-slate-200/80 bg-white/90 backdrop-blur dark:border-slate-800 dark:bg-slate-950/90">
        <div class="mx-auto flex max-w-[1600px] flex-wrap items-center gap-3 px-4 py-3 lg:px-6">
            <button type="button" id="docs-open-sidebar" class="rounded-lg p-2 text-slate-600 hover:bg-slate-100 dark:text-slate-300 dark:hover:bg-slate-800 lg:hidden" aria-label="{{ $t($ui['open_menu'] ?? 'Menu') }}">
                <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/></svg>
            </button>
            <div class="flex min-w-0 flex-1 flex-col gap-1 sm:flex-row sm:items-center sm:gap-4">
                <a href="{{ url('/docs') }}" class="truncate text-lg font-semibold tracking-tight text-slate-900 dark:text-white">{{ $t($ui['docs_title'] ?? 'API Reference') }}</a>
                <span class="hidden text-sm text-slate-500 dark:text-slate-400 sm:inline">{{ $t($ui['version'] ?? 'Version') }} {{ $docs['meta']['version'] ?? '1.0' }}</span>
            </div>
            <div class="flex w-full flex-wrap items-center gap-2 sm:w-auto">
                <label class="sr-only" for="docs-bearer-token">{{ $t($ui['bearer_token'] ?? 'Bearer token') }}</label>
                <input id="docs-bearer-token" type="password" autocomplete="off" placeholder="{{ $t($ui['bearer_token'] ?? 'Bearer token') }}"
                    class="min-w-[12rem] flex-1 rounded-lg border border-slate-200 bg-white px-3 py-2 text-sm text-slate-900 placeholder:text-slate-400 focus:border-violet-500 focus:outline-none focus:ring-1 focus:ring-violet-500 dark:border-slate-700 dark:bg-slate-900 dark:text-slate-100 sm:max-w-xs"
                    title="{{ $t($ui['bearer_hint'] ?? '') }}">
                <span class="text-xs text-slate-500 dark:text-slate-400">{{ $t($ui['language'] ?? 'Language') }}:</span>
                @foreach ($docs['locales'] ?? [] as $code => $label)
                    <a href="{{ request()->fullUrlWithQuery(['lang' => $code]) }}"
                        class="rounded-md px-2 py-1 text-sm font-medium {{ $locale === $code ? 'bg-violet-100 text-violet-800 dark:bg-violet-900/40 dark:text-violet-200' : 'text-slate-600 hover:bg-slate-100 dark:text-slate-400 dark:hover:bg-slate-800' }}">{{ $label }}</a>
                @endforeach
                <button type="button" class="docs-theme-toggle rounded-lg border border-slate-200 px-3 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50 dark:border-slate-700 dark:text-slate-200 dark:hover:bg-slate-800">
                    <span class="dark:hidden">{{ $t($ui['theme_dark'] ?? 'Dark') }}</span>
                    <span class="hidden dark:inline">{{ $t($ui['theme_light'] ?? 'Light') }}</span>
                </button>
            </div>
        </div>
    </header>

    <div class="mx-auto flex max-w-[1600px]">
        <aside id="docs-sidebar"
            class="fixed inset-y-0 left-0 z-50 flex w-[min(100%,280px)] -translate-x-full flex-col border-r border-slate-200 bg-white pt-[4.25rem] transition-transform dark:border-slate-800 dark:bg-slate-950 lg:static lg:z-0 lg:translate-x-0 lg:pt-0 lg:top-auto lg:h-[calc(100vh-4.25rem)] lg:sticky lg:top-[4.25rem]">
            <div class="flex items-center justify-between border-b border-slate-200 px-4 py-3 dark:border-slate-800 lg:hidden">
                <span class="text-sm font-medium text-slate-700 dark:text-slate-300">{{ $t($ui['docs_title'] ?? 'API') }}</span>
                <button type="button" id="docs-close-sidebar" class="rounded-lg p-2 text-slate-600 hover:bg-slate-100 dark:hover:bg-slate-800">
                    <svg class="h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/></svg>
                </button>
            </div>
            <div class="p-4">
                <input type="search" id="docs-search" placeholder="{{ $t($ui['search_placeholder'] ?? 'Search…') }}"
                    class="w-full rounded-lg border border-slate-200 bg-slate-50 px-3 py-2 text-sm text-slate-900 placeholder:text-slate-400 focus:border-violet-500 focus:outline-none focus:ring-1 focus:ring-violet-500 dark:border-slate-700 dark:bg-slate-900 dark:text-slate-100">
            </div>
            <nav class="flex-1 overflow-y-auto px-2 pb-8 text-sm" aria-label="API sections">
                @foreach ($docs['categories'] ?? [] as $cat)
                    @if (($cat['id'] ?? '') === 'overview')
                        <div class="docs-nav-category mb-4 px-2" data-category="overview">
                            <a href="#overview" class="block rounded-md px-2 py-1.5 font-medium text-slate-800 hover:bg-slate-100 dark:text-slate-100 dark:hover:bg-slate-800">{{ $t($cat['label'] ?? '') }}</a>
                        </div>
                    @else
                        @php $catEps = $endpointsByCategory->get($cat['id'], collect()); @endphp
                        @if ($catEps->isNotEmpty())
                            <div class="docs-nav-category mb-4 px-2" data-category="{{ $cat['id'] }}">
                                <div class="mb-1 px-2 text-xs font-semibold uppercase tracking-wider text-slate-400 dark:text-slate-500">{{ $t($cat['label'] ?? '') }}</div>
                                <ul class="space-y-0.5">
                                    @foreach ($catEps as $navEp)
                                        <li>
                                            <a href="#ep-{{ $navEp['id'] }}" class="docs-nav-endpoint block rounded-md px-2 py-1.5 text-slate-600 hover:bg-slate-100 hover:text-slate-900 dark:text-slate-400 dark:hover:bg-slate-800 dark:hover:text-slate-100"
                                                data-search="{{ strtolower($t($navEp['title'] ?? '')) }} {{ strtolower($navEp['method']) }} {{ $navEp['path'] }}">
                                                <span class="font-mono text-xs text-violet-600 dark:text-violet-400">{{ $navEp['method'] }}</span>
                                                <span class="ml-1">{{ $t($navEp['title'] ?? $navEp['path']) }}</span>
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                    @endif
                @endforeach
            </nav>
        </aside>

        <main class="min-w-0 flex-1 px-4 py-8 lg:px-10 lg:py-10">
            <div class="mx-auto max-w-3xl">
                <p class="text-lg text-slate-600 dark:text-slate-400">{{ $t($docs['meta']['description'] ?? '') }}</p>
                <p class="mt-2 font-mono text-sm text-slate-500 dark:text-slate-500">{{ $apiBase }}</p>
            </div>

            @php $overviewCat = collect($docs['categories'] ?? [])->firstWhere('id', 'overview'); @endphp
            <section id="overview" class="mx-auto mt-12 max-w-3xl border-t border-slate-200 pt-10 dark:border-slate-800">
                <h2 class="text-2xl font-bold tracking-tight text-slate-900 dark:text-white">{{ $t($overviewCat['label'] ?? ['en' => 'Overview']) }}</h2>
                <div class="mt-6 space-y-8">
                    @foreach ($docs['overview_sections'] ?? [] as $section)
                        <div>
                            <h3 class="text-lg font-semibold text-slate-800 dark:text-slate-200">{{ $t($section['title'] ?? '') }}</h3>
                            <div class="mt-2 text-slate-600 dark:text-slate-400">{!! $t($section['body'] ?? '') !!}</div>
                        </div>
                    @endforeach
                </div>
            </section>

            @foreach ($endpoints as $ep)
                @php
                    $method = strtoupper($ep['method'] ?? 'GET');
                    $methodClass = match ($method) {
                        'GET' => 'bg-emerald-100 text-emerald-800 dark:bg-emerald-900/40 dark:text-emerald-300',
                        'POST' => 'bg-sky-100 text-sky-800 dark:bg-sky-900/40 dark:text-sky-300',
                        'PUT' => 'bg-amber-100 text-amber-900 dark:bg-amber-900/40 dark:text-amber-200',
                        'PATCH' => 'bg-orange-100 text-orange-900 dark:bg-orange-900/40 dark:text-orange-200',
                        'DELETE' => 'bg-rose-100 text-rose-800 dark:bg-rose-900/40 dark:text-rose-300',
                        default => 'bg-slate-200 text-slate-800 dark:bg-slate-700 dark:text-slate-200',
                    };
                    $tryDefaultPath = preg_replace('/\{[^}]+\??\}/', '', $ep['path'] ?? '');
                    $tryDefaultPath = trim(preg_replace('#/+#', '/', $tryDefaultPath), '/');
                @endphp
                <article id="ep-{{ $ep['id'] }}" class="mx-auto mt-14 max-w-3xl scroll-mt-24 border-t border-slate-200 pt-12 dark:border-slate-800">
                    <div class="flex flex-wrap items-center gap-3">
                        <span class="inline-flex rounded-md px-2.5 py-1 font-mono text-xs font-bold {{ $methodClass }}">{{ $method }}</span>
                        <code class="break-all font-mono text-base text-slate-800 dark:text-slate-200">{{ $ep['full_url'] }}</code>
                    </div>
                    <h2 class="mt-4 text-2xl font-bold tracking-tight text-slate-900 dark:text-white">{{ $t($ep['title'] ?? '') }}</h2>
                    <p class="mt-3 text-slate-600 dark:text-slate-400">{{ $t($ep['description'] ?? '') }}</p>

                    <div class="mt-8 overflow-hidden rounded-xl border border-slate-200 dark:border-slate-800">
                        <table class="w-full text-left text-sm">
                            <tbody class="divide-y divide-slate-200 dark:divide-slate-800">
                                <tr class="bg-slate-50 dark:bg-slate-900/50">
                                    <th class="w-36 px-4 py-3 font-medium text-slate-500 dark:text-slate-400">{{ $t($ui['endpoint'] ?? 'Endpoint') }}</th>
                                    <td class="px-4 py-3 font-mono text-slate-900 dark:text-slate-100">{{ $ep['full_url'] }}</td>
                                </tr>
                                <tr>
                                    <th class="px-4 py-3 font-medium text-slate-500 dark:text-slate-400">{{ $t($ui['method'] ?? 'Method') }}</th>
                                    <td class="px-4 py-3 font-mono">{{ $method }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <h3 class="mt-10 text-lg font-semibold text-slate-900 dark:text-white">{{ $t($ui['headers'] ?? 'Headers') }}</h3>
                    <div class="mt-3 overflow-x-auto rounded-xl border border-slate-200 dark:border-slate-800">
                        @if (!empty($ep['headers']))
                            <table class="w-full min-w-[480px] text-left text-sm">
                                <thead class="bg-slate-50 dark:bg-slate-900/50">
                                    <tr>
                                        <th class="px-4 py-2 font-medium text-slate-500 dark:text-slate-400">{{ $t($ui['name'] ?? 'Name') }}</th>
                                        <th class="px-4 py-2 font-medium text-slate-500 dark:text-slate-400">{{ $t($ui['value'] ?? 'Value') }}</th>
                                        <th class="px-4 py-2 font-medium text-slate-500 dark:text-slate-400">{{ $t($ui['required'] ?? 'Required') }}</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-slate-200 dark:divide-slate-800">
                                    @foreach ($ep['headers'] as $h)
                                        <tr>
                                            <td class="px-4 py-2 font-mono text-violet-700 dark:text-violet-300">{{ $h['name'] ?? '' }}</td>
                                            <td class="px-4 py-2 font-mono text-slate-700 dark:text-slate-300">{{ $h['value'] ?? '' }}</td>
                                            <td class="px-4 py-2">{{ !empty($h['required']) ? $t($ui['yes'] ?? 'Yes') : $t($ui['no'] ?? 'No') }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        @else
                            <p class="px-4 py-3 text-sm text-slate-500">{{ $t($ui['no_headers_extra'] ?? '') }}</p>
                        @endif
                    </div>

                    <h3 class="mt-10 text-lg font-semibold text-slate-900 dark:text-white">{{ $t($ui['parameters'] ?? 'Parameters') }}</h3>
                    <div class="mt-3 overflow-x-auto rounded-xl border border-slate-200 dark:border-slate-800">
                        @if (!empty($ep['parameters']))
                            <table class="w-full min-w-[560px] text-left text-sm">
                                <thead class="bg-slate-50 dark:bg-slate-900/50">
                                    <tr>
                                        <th class="px-4 py-2 font-medium text-slate-500 dark:text-slate-400">{{ $t($ui['name'] ?? 'Name') }}</th>
                                        <th class="px-4 py-2 font-medium text-slate-500 dark:text-slate-400">{{ $t($ui['in'] ?? 'In') }}</th>
                                        <th class="px-4 py-2 font-medium text-slate-500 dark:text-slate-400">{{ $t($ui['type'] ?? 'Type') }}</th>
                                        <th class="px-4 py-2 font-medium text-slate-500 dark:text-slate-400">{{ $t($ui['required'] ?? 'Required') }}</th>
                                        <th class="px-4 py-2 font-medium text-slate-500 dark:text-slate-400">{{ $t($ui['description'] ?? 'Description') }}</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-slate-200 dark:divide-slate-800">
                                    @foreach ($ep['parameters'] as $p)
                                        <tr>
                                            <td class="px-4 py-2 font-mono text-slate-800 dark:text-slate-200">{{ $p['name'] ?? '' }}</td>
                                            <td class="px-4 py-2">{{ $p['in'] ?? '' }}</td>
                                            <td class="px-4 py-2 font-mono text-xs">{{ $p['type'] ?? '' }}</td>
                                            <td class="px-4 py-2">{{ !empty($p['required']) ? $t($ui['yes'] ?? 'Yes') : $t($ui['no'] ?? 'No') }}</td>
                                            <td class="px-4 py-2 text-slate-600 dark:text-slate-400">{{ $t($p['description'] ?? '') }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        @else
                            <p class="px-4 py-3 text-sm text-slate-500">{{ $t($ui['no_params'] ?? '') }}</p>
                        @endif
                    </div>

                    @if (!empty($ep['request_body']))
                        <h3 class="mt-10 text-lg font-semibold text-slate-900 dark:text-white">{{ $t($ui['request_example'] ?? 'Request body') }}</h3>
                        <div class="docs-snippet-wrap relative mt-3">
                            <pre class="overflow-x-auto rounded-xl border border-slate-200 bg-slate-900 p-4 text-sm text-slate-100 dark:border-slate-700"><code id="json-req-{{ $ep['id'] }}">{{ json_encode($ep['request_body'], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) }}</code></pre>
                            <button type="button" data-copy-target="json-req-{{ $ep['id'] }}" data-copied-label="{{ $t($ui['copied'] ?? 'Copied') }}"
                                class="absolute right-3 top-3 rounded-md bg-slate-700 px-2 py-1 text-xs font-medium text-white hover:bg-slate-600">{{ $t($ui['copy'] ?? 'Copy') }}</button>
                        </div>
                    @endif

                    <h3 class="mt-10 text-lg font-semibold text-slate-900 dark:text-white">{{ $t($ui['response_success'] ?? 'Success') }}</h3>
                    <p class="mt-1 text-xs text-slate-500">HTTP {{ $ep['response_success']['status'] ?? 200 }}</p>
                    <div class="docs-snippet-wrap relative mt-2">
                        <pre class="overflow-x-auto rounded-xl border border-slate-200 bg-slate-900 p-4 text-sm text-slate-100 dark:border-slate-700"><code id="json-ok-{{ $ep['id'] }}">{{ json_encode($ep['response_success']['body'] ?? [], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) }}</code></pre>
                        <button type="button" data-copy-target="json-ok-{{ $ep['id'] }}" data-copied-label="{{ $t($ui['copied'] ?? 'Copied') }}"
                            class="absolute right-3 top-3 rounded-md bg-slate-700 px-2 py-1 text-xs font-medium text-white hover:bg-slate-600">{{ $t($ui['copy'] ?? 'Copy') }}</button>
                    </div>

                    <h3 class="mt-10 text-lg font-semibold text-slate-900 dark:text-white">{{ $t($ui['response_error'] ?? 'Error') }}</h3>
                    <p class="mt-1 text-xs text-slate-500">HTTP {{ $ep['response_error']['status'] ?? '4xx/5xx' }}</p>
                    <div class="docs-snippet-wrap relative mt-2">
                        <pre class="overflow-x-auto rounded-xl border border-slate-200 bg-slate-900 p-4 text-sm text-slate-100 dark:border-slate-700"><code id="json-err-{{ $ep['id'] }}">{{ json_encode($ep['response_error']['body'] ?? [], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) }}</code></pre>
                        <button type="button" data-copy-target="json-err-{{ $ep['id'] }}" data-copied-label="{{ $t($ui['copied'] ?? 'Copied') }}"
                            class="absolute right-3 top-3 rounded-md bg-slate-700 px-2 py-1 text-xs font-medium text-white hover:bg-slate-600">{{ $t($ui['copy'] ?? 'Copy') }}</button>
                    </div>

                    <h3 class="mt-10 text-lg font-semibold text-slate-900 dark:text-white">{{ $t($ui['status_codes'] ?? 'Status codes') }}</h3>
                    <div class="mt-3 overflow-x-auto rounded-xl border border-slate-200 dark:border-slate-800">
                        <table class="w-full text-left text-sm">
                            <thead class="bg-slate-50 dark:bg-slate-900/50">
                                <tr>
                                    <th class="px-4 py-2 font-medium text-slate-500 dark:text-slate-400">HTTP</th>
                                    <th class="px-4 py-2 font-medium text-slate-500 dark:text-slate-400">{{ $t($ui['description'] ?? 'Description') }}</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-slate-200 dark:divide-slate-800">
                                @foreach ($ep['status_codes'] ?? [] as $sc)
                                    <tr>
                                        <td class="px-4 py-2 font-mono">{{ $sc['code'] ?? '' }}</td>
                                        <td class="px-4 py-2 text-slate-600 dark:text-slate-400">{{ $t($sc['description'] ?? '') }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>

                    @if (!empty($ep['notes']))
                        <h3 class="mt-10 text-lg font-semibold text-slate-900 dark:text-white">{{ $t($ui['notes'] ?? 'Notes') }}</h3>
                        <ul class="mt-3 list-disc space-y-2 pl-5 text-slate-600 dark:text-slate-400">
                            @foreach ($ep['notes'] as $note)
                                <li>{{ $t($note) }}</li>
                            @endforeach
                        </ul>
                    @endif

                    <h3 class="mt-10 text-lg font-semibold text-slate-900 dark:text-white">{{ $t($ui['code_examples'] ?? 'Code examples') }}</h3>
                    <p class="mt-1 text-sm text-slate-500 dark:text-slate-400">{{ $t($ui['bearer_hint'] ?? '') }}</p>
                    <div class="docs-code-tab-group mt-4" data-endpoint-id="{{ $ep['id'] }}">
                        <div class="flex flex-wrap gap-1 border-b border-slate-200 dark:border-slate-800">
                            @foreach (['curl' => 'cURL', 'fetch' => 'fetch', 'axios' => 'axios', 'php' => 'PHP', 'python' => 'Python', 'node' => 'Node.js'] as $tab => $tabLabel)
                                <button type="button" class="docs-code-tab border-b-2 px-3 py-2 text-sm font-medium {{ $loop->first ? 'border-violet-500 text-violet-600 dark:text-violet-400' : 'border-transparent text-slate-500' }}">{{ $tabLabel }}</button>
                            @endforeach
                        </div>
                        @foreach (['curl', 'fetch', 'axios', 'php', 'python', 'node'] as $idx => $tab)
                            <div class="docs-code-panel docs-snippet-wrap relative {{ $idx > 0 ? 'hidden' : '' }} mt-3">
                                <pre class="overflow-x-auto rounded-xl border border-slate-200 bg-slate-900 p-4 text-sm text-slate-100 dark:border-slate-700"><code class="font-mono text-xs leading-relaxed" id="snippet-{{ $ep['id'] }}-{{ $tab }}"></code></pre>
                                <button type="button" data-copy-target="snippet-{{ $ep['id'] }}-{{ $tab }}" data-copied-label="{{ $t($ui['copied'] ?? 'Copied') }}"
                                    class="absolute right-3 top-3 rounded-md bg-slate-700 px-2 py-1 text-xs font-medium text-white hover:bg-slate-600">{{ $t($ui['copy'] ?? 'Copy') }}</button>
                            </div>
                        @endforeach
                    </div>

                    <div class="mt-10 rounded-xl border border-dashed border-violet-300 bg-violet-50/50 p-6 dark:border-violet-800 dark:bg-violet-950/20">
                        <h3 class="text-lg font-semibold text-slate-900 dark:text-white">{{ $t($ui['try_api'] ?? 'Try API') }}</h3>
                        <form class="docs-try-form mt-4 space-y-4" data-endpoint-id="{{ $ep['id'] }}">
                            <div>
                                <label class="block text-sm font-medium text-slate-700 dark:text-slate-300">{{ $t($ui['try_path'] ?? 'Path') }}</label>
                                <input type="text" name="path" value="{{ $tryDefaultPath }}"
                                    class="mt-1 w-full rounded-lg border border-slate-200 bg-white px-3 py-2 font-mono text-sm dark:border-slate-700 dark:bg-slate-900 dark:text-slate-100">
                            </div>
                            @if (in_array($method, ['POST', 'PUT', 'PATCH', 'DELETE'], true))
                                <div>
                                    <label class="block text-sm font-medium text-slate-700 dark:text-slate-300">{{ $t($ui['try_body'] ?? 'Body') }}</label>
                                    <textarea name="body" rows="6" class="mt-1 w-full rounded-lg border border-slate-200 bg-white px-3 py-2 font-mono text-sm dark:border-slate-700 dark:bg-slate-900 dark:text-slate-100">{{ isset($ep['request_body']) ? json_encode($ep['request_body'], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) : '{}' }}</textarea>
                                </div>
                            @endif
                            <button type="submit" class="rounded-lg bg-violet-600 px-4 py-2 text-sm font-semibold text-white hover:bg-violet-500">{{ $t($ui['send'] ?? 'Send') }}</button>
                            <div>
                                <div class="text-sm font-medium text-slate-700 dark:text-slate-300">{{ $t($ui['response'] ?? 'Response') }}</div>
                                <pre class="docs-try-output mt-2 max-h-80 overflow-auto rounded-lg border border-slate-200 bg-slate-900 p-4 font-mono text-xs text-slate-100 dark:border-slate-700">—</pre>
                            </div>
                        </form>
                    </div>
                </article>
            @endforeach
        </main>
    </div>

    <script>window.__API_DOCS__ = @json($payload);</script>
    <script src="{{ asset('js/api-docs.js') }}" defer></script>
</body>
</html>
