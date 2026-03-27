@php
    /** @var \Closure $t */
    $ui = $docs['ui'] ?? [];
    $appName = config('app.name', 'API');
    $logoMark = strtoupper(\Illuminate\Support\Str::substr((string) $appName, 0, 1));
    $codePickerPrimary = [
        ['id' => 'curl', 'label' => 'Shell', 'icon' => 'shell'],
        ['id' => 'node', 'label' => 'Node', 'icon' => 'node'],
        ['id' => 'php', 'label' => 'PHP', 'icon' => 'php'],
        ['id' => 'python', 'label' => 'Python', 'icon' => 'python'],
    ];
    $codePickerMore = [
        ['id' => 'fetch', 'label' => 'JavaScript (fetch)', 'icon' => 'js'],
        ['id' => 'axios', 'label' => 'JavaScript (axios)', 'icon' => 'js'],
    ];
@endphp
<!DOCTYPE html>
<html lang="{{ $locale }}" class="h-full scroll-smooth">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#ffffff" media="(prefers-color-scheme: light)">
    <meta name="theme-color" content="#09090b" media="(prefers-color-scheme: dark)">
    <title>{{ $t($docs['meta']['title'] ?? 'API') }} — {{ $appName }}</title>
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
                    colors: {
                        docs: {
                            canvas: '#eceef2',
                            brand: '#0066ff',
                            'brand-dark': '#0052cc',
                        },
                    },
                    boxShadow: {
                        'docs-card': '0 1px 2px 0 rgb(0 0 0 / 0.04), 0 1px 3px 0 rgb(0 0 0 / 0.06)',
                    },
                },
            },
        };
    </script>
    <style>
        [id] { scroll-margin-top: 4.5rem; }
        @media print {
            #docs-backdrop, #docs-open-sidebar, #docs-close-sidebar, #docs-sidebar { display: none !important; }
            header { position: static !important; border: none !important; box-shadow: none !important; }
            .docs-print-hide { display: none !important; }
            .docs-print-main { max-width: none !important; padding-left: 1rem !important; padding-right: 1rem !important; }
            pre, code { white-space: pre-wrap !important; word-break: break-word !important; }
        .docs-endpoint-card { box-shadow: none !important; border: 1px solid #e4e4e7 !important; }
    }
    .docs-lang-btn-active {
        background: #fff;
        color: #2563eb;
        box-shadow: 0 0 0 1px rgb(228 228 231), 0 1px 2px rgb(0 0 0 / 0.06);
    }
    .dark .docs-lang-btn-active {
        background: rgb(24 24 27);
        color: rgb(96 165 250);
        box-shadow: 0 0 0 1px rgb(63 63 70), 0 1px 2px rgb(0 0 0 / 0.25);
    }
    .docs-lang-more-toggle-active {
        color: #2563eb;
        background: rgb(239 246 255 / 0.9);
    }
    .dark .docs-lang-more-toggle-active {
        color: rgb(96 165 250);
        background: rgb(30 58 138 / 0.25);
    }
    </style>
</head>
<body class="h-full min-h-screen bg-docs-canvas font-sans text-zinc-900 antialiased dark:bg-zinc-950 dark:text-zinc-100">
    <div id="docs-backdrop" class="fixed inset-0 z-40 hidden bg-zinc-900/40 backdrop-blur-sm lg:hidden" aria-hidden="true"></div>

    <header class="sticky top-0 z-30 border-b border-zinc-200/90 bg-white shadow-sm dark:border-zinc-800 dark:bg-zinc-950">
        <div class="mx-auto flex h-14 max-w-[100rem] items-center gap-3 px-4 lg:px-5">
            <button type="button" id="docs-open-sidebar" class="docs-print-hide -ml-1 rounded-lg p-2 text-zinc-600 hover:bg-zinc-100 dark:text-zinc-300 dark:hover:bg-zinc-800 lg:hidden" aria-label="{{ $t($ui['open_menu'] ?? 'Menu') }}">
                <svg class="h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/></svg>
            </button>
            <a href="{{ url('/docs') }}" class="docs-print-hide flex shrink-0 items-center gap-2.5 no-underline">
                <span class="flex h-8 w-8 items-center justify-center rounded-lg bg-gradient-to-br from-blue-600 to-blue-700 text-xs font-bold text-white shadow-sm ring-1 ring-blue-600/20">{{ $logoMark }}</span>
                <span class="hidden flex-col sm:flex">
                    <span class="text-sm font-semibold leading-tight text-zinc-900 dark:text-white">{{ $appName }}</span>
                    <span class="text-[11px] font-medium uppercase tracking-wider text-zinc-500 dark:text-zinc-400">{{ $t($ui['docs_title'] ?? 'API Reference') }}</span>
                </span>
            </a>
            <span class="docs-print-hide hidden rounded-full border border-zinc-200 bg-zinc-50 px-2.5 py-0.5 font-mono text-[11px] font-semibold text-zinc-600 dark:border-zinc-700 dark:bg-zinc-800 dark:text-zinc-300 sm:inline-block">v{{ $docs['meta']['version'] ?? '1.0' }}</span>
            <div class="mx-2 hidden h-6 w-px bg-zinc-200 dark:bg-zinc-700 sm:block"></div>
            <p class="hidden min-w-0 flex-1 truncate text-sm text-zinc-500 dark:text-zinc-400 md:block">{{ $t($docs['meta']['description'] ?? '') }}</p>
            <div class="ml-auto flex flex-wrap items-center justify-end gap-2">
                <a href="{{ url('/docs/openapi.json') }}" download="openapi.json" class="docs-print-hide hidden rounded-md border border-zinc-200 bg-white px-2.5 py-1.5 text-xs font-medium text-zinc-700 hover:bg-zinc-50 dark:border-zinc-600 dark:bg-zinc-900 dark:text-zinc-200 dark:hover:bg-zinc-800 sm:inline-block no-underline">{{ $t($ui['openapi_spec'] ?? ['en' => 'OpenAPI (Postman)']) }}</a>
                <button type="button" onclick="window.print()" class="docs-print-hide hidden rounded-md border border-zinc-200 bg-white px-2.5 py-1.5 text-xs font-medium text-zinc-700 hover:bg-zinc-50 dark:border-zinc-600 dark:bg-zinc-900 dark:text-zinc-200 dark:hover:bg-zinc-800 sm:inline-block">{{ $t($ui['print_save_pdf'] ?? ['en' => 'Print / Save as PDF']) }}</button>
                <div class="docs-print-hide flex flex-wrap items-center gap-1.5 border-l border-zinc-200 pl-2 dark:border-zinc-700 sm:pl-3">
                    <label class="sr-only" for="docs-bearer-token">{{ $t($ui['bearer_token'] ?? 'Bearer token') }}</label>
                    <input id="docs-bearer-token" type="password" autocomplete="off" placeholder="{{ $t($ui['bearer_token'] ?? 'Token') }}"
                        class="w-36 rounded-md border border-zinc-200 bg-zinc-50 px-2.5 py-1.5 font-mono text-xs text-zinc-900 placeholder:text-zinc-400 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20 dark:border-zinc-600 dark:bg-zinc-900 dark:text-zinc-100 sm:w-44"
                        title="{{ $t($ui['bearer_hint'] ?? '') }}">
                    @foreach ($docs['locales'] ?? [] as $code => $label)
                        <a href="{{ request()->fullUrlWithQuery(['lang' => $code]) }}"
                            class="rounded-md px-2 py-1 text-xs font-medium {{ $locale === $code ? 'bg-blue-600 text-white shadow-sm' : 'text-zinc-600 hover:bg-zinc-100 dark:text-zinc-400 dark:hover:bg-zinc-800' }}">{{ $label }}</a>
                    @endforeach
                    <button type="button" class="docs-theme-toggle rounded-md border border-zinc-200 p-1.5 text-zinc-600 hover:bg-zinc-50 dark:border-zinc-600 dark:text-zinc-300 dark:hover:bg-zinc-800" title="{{ $t($ui['theme_dark'] ?? '') }}">
                        <span class="dark:hidden"><svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"/></svg></span>
                        <span class="hidden dark:inline"><svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"/></svg></span>
                    </button>
                </div>
            </div>
        </div>
    </header>

    <div class="mx-auto flex min-h-[calc(100vh-3.5rem)] max-w-[100rem]">
        <aside id="docs-sidebar"
            class="fixed inset-y-0 left-0 z-50 flex w-[min(100%,18rem)] -translate-x-full flex-col border-r border-zinc-200 bg-white pt-14 transition-transform dark:border-zinc-800 dark:bg-zinc-950 lg:static lg:z-0 lg:w-72 lg:translate-x-0 lg:pt-0 lg:top-auto lg:min-h-[calc(100vh-3.5rem)] lg:sticky lg:top-14 lg:self-start">
            <div class="flex items-center justify-between border-b border-zinc-100 px-4 py-3 dark:border-zinc-800 lg:hidden">
                <span class="text-sm font-semibold text-zinc-800 dark:text-zinc-200">{{ $t($ui['docs_title'] ?? 'API') }}</span>
                <button type="button" id="docs-close-sidebar" class="rounded-lg p-2 text-zinc-600 hover:bg-zinc-100 dark:hover:bg-zinc-800">
                    <svg class="h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/></svg>
                </button>
            </div>
            <div class="border-b border-zinc-100 p-3 dark:border-zinc-800">
                <div class="relative">
                    <svg class="pointer-events-none absolute left-2.5 top-1/2 h-4 w-4 -translate-y-1/2 text-zinc-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                    <input type="search" id="docs-search" placeholder="{{ $t($ui['search_placeholder'] ?? 'Search…') }}"
                        class="w-full rounded-lg border border-zinc-200 bg-zinc-50 py-2 pl-9 pr-3 text-sm text-zinc-900 placeholder:text-zinc-400 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/15 dark:border-zinc-700 dark:bg-zinc-900 dark:text-zinc-100">
                </div>
            </div>
            <nav class="flex-1 overflow-y-auto px-2 py-3 text-[13px] leading-snug" aria-label="API sections">
                @foreach ($docs['categories'] ?? [] as $cat)
                    @if (($cat['id'] ?? '') === 'overview')
                        <div class="docs-nav-category mb-5 px-1" data-category="overview">
                            <a href="#overview" class="block rounded-md px-2 py-2 font-semibold text-zinc-900 hover:bg-zinc-100 dark:text-white dark:hover:bg-zinc-800">{{ $t($cat['label'] ?? '') }}</a>
                            @foreach ($docs['overview_sections'] ?? [] as $osec)
                                @if (!empty($osec['anchor']))
                                    <a href="#{{ $osec['anchor'] }}" class="ml-2 mt-0.5 block rounded-md border-l-2 border-transparent py-1.5 pl-3 pr-2 text-zinc-600 hover:border-blue-200 hover:bg-zinc-50 hover:text-zinc-900 dark:text-zinc-400 dark:hover:border-blue-900 dark:hover:bg-zinc-800/80 dark:hover:text-zinc-100">{{ $t($osec['title'] ?? '') }}</a>
                                @endif
                            @endforeach
                        </div>
                    @else
                        @php $catEps = $endpointsByCategory->get($cat['id'], collect()); @endphp
                        @if ($catEps->isNotEmpty())
                            <div class="docs-nav-category mb-5 px-1" data-category="{{ $cat['id'] }}">
                                <div class="mb-1.5 px-2 text-[10px] font-bold uppercase tracking-widest text-zinc-400 dark:text-zinc-500">{{ $t($cat['label'] ?? '') }}</div>
                                <ul class="space-y-0.5">
                                    @foreach ($catEps as $navEp)
                                        <li>
                                            <a href="#ep-{{ $navEp['id'] }}" class="docs-nav-endpoint group flex items-start gap-2 rounded-md px-2 py-1.5 text-zinc-600 hover:bg-zinc-100 dark:text-zinc-400 dark:hover:bg-zinc-800 dark:hover:text-zinc-100"
                                                data-search="{{ strtolower($t($navEp['title'] ?? '')) }} {{ strtolower($navEp['method']) }} {{ $navEp['path'] }}">
                                                @php $nm = strtoupper($navEp['method'] ?? 'GET'); @endphp
                                                <span class="mt-0.5 shrink-0 rounded px-1.5 py-0.5 font-mono text-[9px] font-bold uppercase leading-none
                                                    {{ $nm === 'GET' ? 'bg-emerald-100 text-emerald-800 dark:bg-emerald-900/50 dark:text-emerald-300' : '' }}
                                                    {{ $nm === 'POST' ? 'bg-blue-100 text-blue-800 dark:bg-blue-900/50 dark:text-blue-300' : '' }}
                                                    {{ $nm === 'PUT' ? 'bg-amber-100 text-amber-900 dark:bg-amber-900/40 dark:text-amber-200' : '' }}
                                                    {{ $nm === 'PATCH' ? 'bg-orange-100 text-orange-900 dark:bg-orange-900/40 dark:text-orange-200' : '' }}
                                                    {{ $nm === 'DELETE' ? 'bg-rose-100 text-rose-800 dark:bg-rose-900/50 dark:text-rose-300' : '' }}
                                                    {{ !in_array($nm, ['GET','POST','PUT','PATCH','DELETE'], true) ? 'bg-zinc-200 text-zinc-800 dark:bg-zinc-700 dark:text-zinc-200' : '' }}">{{ $nm }}</span>
                                                <span class="min-w-0 flex-1">{{ $t($navEp['title'] ?? $navEp['path']) }}</span>
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

        <main class="docs-print-main min-w-0 flex-1 px-4 py-8 lg:px-10 lg:py-12">
            <div class="mx-auto mb-12 max-w-3xl md:hidden">
                <p class="text-sm text-zinc-600 dark:text-zinc-400">{{ $t($docs['meta']['description'] ?? '') }}</p>
            </div>

            <div class="mx-auto mb-10 max-w-3xl rounded-xl border border-zinc-200/80 bg-white p-5 shadow-docs-card dark:border-zinc-800 dark:bg-zinc-900/40">
                <div class="text-[10px] font-bold uppercase tracking-widest text-zinc-400 dark:text-zinc-500">{{ $t($ui['endpoint'] ?? 'Base URL') }}</div>
                <p class="mt-2 break-all font-mono text-sm font-medium text-blue-600 dark:text-blue-400">{{ $apiBase }}</p>
            </div>

            @php $overviewCat = collect($docs['categories'] ?? [])->firstWhere('id', 'overview'); @endphp
            <section id="overview" class="mx-auto mb-16 max-w-3xl scroll-mt-20">
                <div class="docs-endpoint-card rounded-2xl border border-zinc-200/90 bg-white p-6 shadow-docs-card dark:border-zinc-800 dark:bg-zinc-900/50 md:p-8">
                    <h2 class="text-2xl font-bold tracking-tight text-zinc-900 dark:text-white">{{ $t($overviewCat['label'] ?? ['en' => 'Overview']) }}</h2>
                    <p class="mt-2 text-sm text-zinc-500 dark:text-zinc-400">{{ $t($docs['meta']['description'] ?? '') }}</p>
                    <div class="mt-8 space-y-8 border-t border-zinc-100 pt-8 dark:border-zinc-800">
                        @foreach ($docs['overview_sections'] ?? [] as $section)
                            <div
                                @if (!empty($section['anchor'])) id="{{ $section['anchor'] }}" @endif
                                @class(['scroll-mt-24' => !empty($section['anchor'])])
                            >
                                <h3 class="text-base font-semibold text-zinc-900 dark:text-white">{{ $t($section['title'] ?? '') }}</h3>
                                <div class="prose-docs mt-2 text-sm leading-relaxed text-zinc-600 dark:text-zinc-400 [&_a]:font-medium [&_a]:text-blue-600 [&_a]:underline [&_a]:decoration-blue-600/30 [&_a]:underline-offset-2 hover:[&_a]:decoration-blue-600 dark:[&_a]:text-blue-400">{!! $t($section['body'] ?? '') !!}</div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </section>

            @foreach ($endpoints as $ep)
                @php
                    $method = strtoupper($ep['method'] ?? 'GET');
                    $methodClass = match ($method) {
                        'GET' => 'bg-emerald-500 text-white shadow-sm ring-1 ring-emerald-600/30',
                        'POST' => 'bg-blue-600 text-white shadow-sm ring-1 ring-blue-700/30',
                        'PUT' => 'bg-amber-500 text-white shadow-sm ring-1 ring-amber-600/30',
                        'PATCH' => 'bg-orange-500 text-white shadow-sm ring-1 ring-orange-600/30',
                        'DELETE' => 'bg-rose-600 text-white shadow-sm ring-1 ring-rose-700/30',
                        default => 'bg-zinc-600 text-white shadow-sm',
                    };
                    $tryDefaultPath = preg_replace('/\{[^}]+\??\}/', '', $ep['path'] ?? '');
                    $tryDefaultPath = trim(preg_replace('#/+#', '/', $tryDefaultPath), '/');
                @endphp
                <article id="ep-{{ $ep['id'] }}" class="docs-endpoint-card mx-auto mb-12 max-w-3xl scroll-mt-20 rounded-2xl border border-zinc-200/90 bg-white p-6 shadow-docs-card dark:border-zinc-800 dark:bg-zinc-900/50 md:p-8">
                    <div class="flex flex-wrap items-center gap-3">
                        <span class="inline-flex min-w-[3.25rem] justify-center rounded-md px-2.5 py-1 font-mono text-xs font-bold {{ $methodClass }}">{{ $method }}</span>
                        <code class="break-all font-mono text-sm text-zinc-800 dark:text-zinc-200">{{ $ep['full_url'] }}</code>
                    </div>
                    <h2 class="mt-5 text-2xl font-bold tracking-tight text-zinc-900 dark:text-white">{{ $t($ep['title'] ?? '') }}</h2>
                    <p class="mt-2 text-sm leading-relaxed text-zinc-600 dark:text-zinc-400">{{ $t($ep['description'] ?? '') }}</p>

                    <div class="mt-6 overflow-hidden rounded-xl border border-zinc-200 dark:border-zinc-700/80">
                        <table class="w-full text-left text-sm">
                            <tbody class="divide-y divide-zinc-100 dark:divide-zinc-800">
                                <tr class="bg-zinc-50/80 dark:bg-zinc-800/40">
                                    <th class="w-32 px-4 py-2.5 text-xs font-semibold uppercase tracking-wide text-zinc-500 dark:text-zinc-400">{{ $t($ui['endpoint'] ?? 'Endpoint') }}</th>
                                    <td class="px-4 py-2.5 font-mono text-xs text-zinc-900 dark:text-zinc-100">{{ $ep['full_url'] }}</td>
                                </tr>
                                <tr>
                                    <th class="px-4 py-2.5 text-xs font-semibold uppercase tracking-wide text-zinc-500 dark:text-zinc-400">{{ $t($ui['method'] ?? 'Method') }}</th>
                                    <td class="px-4 py-2.5 font-mono text-xs font-semibold">{{ $method }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <h3 class="mt-8 text-xs font-bold uppercase tracking-widest text-zinc-400 dark:text-zinc-500">{{ $t($ui['headers'] ?? 'Headers') }}</h3>
                    <div class="mt-2 overflow-x-auto rounded-xl border border-zinc-200 dark:border-zinc-700/80">
                        @if (!empty($ep['headers']))
                            <table class="w-full min-w-[480px] text-left text-sm">
                                <thead class="bg-zinc-50/80 dark:bg-zinc-800/40">
                                    <tr>
                                        <th class="px-4 py-2 text-xs font-semibold uppercase tracking-wide text-zinc-500 dark:text-zinc-400">{{ $t($ui['name'] ?? 'Name') }}</th>
                                        <th class="px-4 py-2 text-xs font-semibold uppercase tracking-wide text-zinc-500 dark:text-zinc-400">{{ $t($ui['value'] ?? 'Value') }}</th>
                                        <th class="px-4 py-2 text-xs font-semibold uppercase tracking-wide text-zinc-500 dark:text-zinc-400">{{ $t($ui['required'] ?? 'Required') }}</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-zinc-100 dark:divide-zinc-800">
                                    @foreach ($ep['headers'] as $h)
                                        <tr>
                                            <td class="px-4 py-2 font-mono text-xs text-blue-700 dark:text-blue-400">{{ $h['name'] ?? '' }}</td>
                                            <td class="px-4 py-2 font-mono text-xs text-zinc-700 dark:text-zinc-300">{{ $h['value'] ?? '' }}</td>
                                            <td class="px-4 py-2 text-xs">{{ !empty($h['required']) ? $t($ui['yes'] ?? 'Yes') : $t($ui['no'] ?? 'No') }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        @else
                            <p class="px-4 py-3 text-sm text-zinc-500">{{ $t($ui['no_headers_extra'] ?? '') }}</p>
                        @endif
                    </div>

                    <h3 class="mt-8 text-xs font-bold uppercase tracking-widest text-zinc-400 dark:text-zinc-500">{{ $t($ui['parameters'] ?? 'Parameters') }}</h3>
                    <div class="mt-2 overflow-x-auto rounded-xl border border-zinc-200 dark:border-zinc-700/80">
                        @if (!empty($ep['parameters']))
                            <table class="w-full min-w-[560px] text-left text-sm">
                                <thead class="bg-zinc-50/80 dark:bg-zinc-800/40">
                                    <tr>
                                        <th class="px-4 py-2 text-xs font-semibold uppercase tracking-wide text-zinc-500 dark:text-zinc-400">{{ $t($ui['name'] ?? 'Name') }}</th>
                                        <th class="px-4 py-2 text-xs font-semibold uppercase tracking-wide text-zinc-500 dark:text-zinc-400">{{ $t($ui['in'] ?? 'In') }}</th>
                                        <th class="px-4 py-2 text-xs font-semibold uppercase tracking-wide text-zinc-500 dark:text-zinc-400">{{ $t($ui['type'] ?? 'Type') }}</th>
                                        <th class="px-4 py-2 text-xs font-semibold uppercase tracking-wide text-zinc-500 dark:text-zinc-400">{{ $t($ui['required'] ?? 'Required') }}</th>
                                        <th class="px-4 py-2 text-xs font-semibold uppercase tracking-wide text-zinc-500 dark:text-zinc-400">{{ $t($ui['description'] ?? 'Description') }}</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-zinc-100 dark:divide-zinc-800">
                                    @foreach ($ep['parameters'] as $p)
                                        <tr>
                                            <td class="px-4 py-2 font-mono text-xs text-zinc-900 dark:text-zinc-100">{{ $p['name'] ?? '' }}</td>
                                            <td class="px-4 py-2 text-xs">{{ $p['in'] ?? '' }}</td>
                                            <td class="px-4 py-2 font-mono text-[11px] text-zinc-600 dark:text-zinc-400">{{ $p['type'] ?? '' }}</td>
                                            <td class="px-4 py-2 text-xs">{{ !empty($p['required']) ? $t($ui['yes'] ?? 'Yes') : $t($ui['no'] ?? 'No') }}</td>
                                            <td class="px-4 py-2 text-xs text-zinc-600 dark:text-zinc-400">{{ $t($p['description'] ?? '') }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        @else
                            <p class="px-4 py-3 text-sm text-zinc-500">{{ $t($ui['no_params'] ?? '') }}</p>
                        @endif
                    </div>

                    @if (!empty($ep['request_body']))
                        <h3 class="mt-8 text-xs font-bold uppercase tracking-widest text-zinc-400 dark:text-zinc-500">{{ $t($ui['request_example'] ?? 'Request body') }}</h3>
                        <div class="docs-snippet-wrap relative mt-2">
                            <pre class="overflow-x-auto rounded-xl border border-zinc-700 bg-[#1e293b] p-4 text-sm text-zinc-100 shadow-inner"><code id="json-req-{{ $ep['id'] }}">{{ json_encode($ep['request_body'], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) }}</code></pre>
                            <button type="button" data-copy-target="json-req-{{ $ep['id'] }}" data-copied-label="{{ $t($ui['copied'] ?? 'Copied') }}"
                                class="absolute right-2 top-2 rounded-md bg-white/10 px-2 py-1 text-xs font-medium text-white backdrop-blur hover:bg-white/20">{{ $t($ui['copy'] ?? 'Copy') }}</button>
                        </div>
                    @endif

                    <h3 class="mt-8 text-xs font-bold uppercase tracking-widest text-zinc-400 dark:text-zinc-500">{{ $t($ui['response_success'] ?? 'Success') }}</h3>
                    <p class="mt-1 text-xs font-medium text-zinc-500">HTTP {{ $ep['response_success']['status'] ?? 200 }}</p>
                    <div class="docs-snippet-wrap relative mt-2">
                        <pre class="overflow-x-auto rounded-xl border border-zinc-700 bg-[#1e293b] p-4 text-sm text-zinc-100 shadow-inner"><code id="json-ok-{{ $ep['id'] }}">{{ json_encode($ep['response_success']['body'] ?? [], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) }}</code></pre>
                        <button type="button" data-copy-target="json-ok-{{ $ep['id'] }}" data-copied-label="{{ $t($ui['copied'] ?? 'Copied') }}"
                            class="absolute right-2 top-2 rounded-md bg-white/10 px-2 py-1 text-xs font-medium text-white backdrop-blur hover:bg-white/20">{{ $t($ui['copy'] ?? 'Copy') }}</button>
                    </div>

                    <h3 class="mt-8 text-xs font-bold uppercase tracking-widest text-zinc-400 dark:text-zinc-500">{{ $t($ui['response_error'] ?? 'Error') }}</h3>
                    <p class="mt-1 text-xs font-medium text-zinc-500">HTTP {{ $ep['response_error']['status'] ?? '4xx/5xx' }}</p>
                    <div class="docs-snippet-wrap relative mt-2">
                        <pre class="overflow-x-auto rounded-xl border border-zinc-700 bg-[#1e293b] p-4 text-sm text-zinc-100 shadow-inner"><code id="json-err-{{ $ep['id'] }}">{{ json_encode($ep['response_error']['body'] ?? [], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) }}</code></pre>
                        <button type="button" data-copy-target="json-err-{{ $ep['id'] }}" data-copied-label="{{ $t($ui['copied'] ?? 'Copied') }}"
                            class="absolute right-2 top-2 rounded-md bg-white/10 px-2 py-1 text-xs font-medium text-white backdrop-blur hover:bg-white/20">{{ $t($ui['copy'] ?? 'Copy') }}</button>
                    </div>

                    <h3 class="mt-8 text-xs font-bold uppercase tracking-widest text-zinc-400 dark:text-zinc-500">{{ $t($ui['status_codes'] ?? 'Status codes') }}</h3>
                    <div class="mt-2 overflow-x-auto rounded-xl border border-zinc-200 dark:border-zinc-700/80">
                        <table class="w-full text-left text-sm">
                            <thead class="bg-zinc-50/80 dark:bg-zinc-800/40">
                                <tr>
                                    <th class="px-4 py-2 text-xs font-semibold uppercase tracking-wide text-zinc-500 dark:text-zinc-400">HTTP</th>
                                    <th class="px-4 py-2 text-xs font-semibold uppercase tracking-wide text-zinc-500 dark:text-zinc-400">{{ $t($ui['description'] ?? 'Description') }}</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-zinc-100 dark:divide-zinc-800">
                                @foreach ($ep['status_codes'] ?? [] as $sc)
                                    <tr>
                                        <td class="px-4 py-2 font-mono text-xs font-semibold">{{ $sc['code'] ?? '' }}</td>
                                        <td class="px-4 py-2 text-xs text-zinc-600 dark:text-zinc-400">{{ $t($sc['description'] ?? '') }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>

                    @if (!empty($ep['notes']))
                        <h3 class="mt-8 text-xs font-bold uppercase tracking-widest text-zinc-400 dark:text-zinc-500">{{ $t($ui['notes'] ?? 'Notes') }}</h3>
                        <ul class="mt-2 list-disc space-y-1.5 pl-5 text-sm text-zinc-600 dark:text-zinc-400">
                            @foreach ($ep['notes'] as $note)
                                <li>{{ $t($note) }}</li>
                            @endforeach
                        </ul>
                    @endif

                    <h3 class="mt-8 text-xs font-bold uppercase tracking-widest text-zinc-400 dark:text-zinc-500">{{ $t($ui['code_examples'] ?? 'Code examples') }}</h3>
                    <p class="mt-1 text-xs text-zinc-500 dark:text-zinc-500">{{ $t($ui['bearer_hint'] ?? '') }}</p>
                    <div class="docs-code-tab-group mt-3" data-endpoint-id="{{ $ep['id'] }}">
                        <div class="docs-lang-picker flex flex-wrap items-center gap-1 rounded-xl border border-zinc-200 bg-zinc-50/90 p-1 dark:border-zinc-700 dark:bg-zinc-800/60">
                            @foreach ($codePickerPrimary as $lang)
                                <button type="button"
                                    class="docs-lang-btn inline-flex items-center gap-1.5 rounded-lg px-2.5 py-2 text-xs font-semibold text-zinc-600 transition hover:bg-zinc-100 hover:text-zinc-900 dark:text-zinc-400 dark:hover:bg-zinc-700/80 dark:hover:text-zinc-100 {{ $loop->first ? 'docs-lang-btn-active' : '' }}"
                                    data-lang="{{ $lang['id'] }}"
                                    aria-pressed="{{ $loop->first ? 'true' : 'false' }}">
                                    @include('api-docs.partials.code-lang-icon', ['icon' => $lang['icon']])
                                    {{ $lang['label'] }}
                                </button>
                            @endforeach
                            <div class="docs-lang-more-wrap relative">
                                <button type="button"
                                    class="docs-lang-more-toggle inline-flex h-9 w-9 items-center justify-center rounded-lg text-zinc-500 hover:bg-zinc-100 hover:text-zinc-800 dark:text-zinc-400 dark:hover:bg-zinc-700 dark:hover:text-zinc-200"
                                    aria-label="{{ $t($ui['more_languages'] ?? ['en' => 'More languages', 'es' => 'Más lenguajes']) }}"
                                    aria-expanded="false"
                                    aria-haspopup="true">
                                    <svg class="h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"/></svg>
                                </button>
                                <div class="docs-lang-more-menu absolute right-0 top-full z-20 mt-1 hidden min-w-[12.5rem] rounded-lg border border-zinc-200 bg-white py-1 shadow-lg dark:border-zinc-600 dark:bg-zinc-900" role="menu">
                                    @foreach ($codePickerMore as $lang)
                                        <button type="button"
                                            class="docs-lang-btn flex w-full items-center gap-2 px-3 py-2 text-left text-xs font-medium text-zinc-700 hover:bg-zinc-50 dark:text-zinc-300 dark:hover:bg-zinc-800"
                                            data-lang="{{ $lang['id'] }}"
                                            aria-pressed="false"
                                            role="menuitem">
                                            @include('api-docs.partials.code-lang-icon', ['icon' => $lang['icon']])
                                            {{ $lang['label'] }}
                                        </button>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        @foreach (['curl', 'fetch', 'axios', 'php', 'python', 'node'] as $idx => $tab)
                            <div class="docs-code-panel docs-snippet-wrap relative mt-3 {{ $tab !== 'curl' ? 'hidden' : '' }}" data-lang="{{ $tab }}">
                                <pre class="overflow-x-auto rounded-xl border border-zinc-700 bg-[#1e293b] p-4 text-sm text-zinc-100 shadow-inner"><code class="font-mono text-xs leading-relaxed" id="snippet-{{ $ep['id'] }}-{{ $tab }}"></code></pre>
                                <button type="button" data-copy-target="snippet-{{ $ep['id'] }}-{{ $tab }}" data-copied-label="{{ $t($ui['copied'] ?? 'Copied') }}"
                                    class="absolute right-2 top-2 rounded-md bg-white/10 px-2 py-1 text-xs font-medium text-white backdrop-blur hover:bg-white/20">{{ $t($ui['copy'] ?? 'Copy') }}</button>
                            </div>
                        @endforeach
                    </div>

                    <div class="mt-8 rounded-xl border border-blue-200/80 bg-gradient-to-br from-blue-50/90 to-white p-5 dark:border-blue-900/50 dark:from-blue-950/40 dark:to-zinc-900/80 md:p-6">
                        <h3 class="text-sm font-bold text-zinc-900 dark:text-white">{{ $t($ui['try_api'] ?? 'Try API') }}</h3>
                        <p class="mt-0.5 text-xs text-zinc-500 dark:text-zinc-400">{{ $t($ui['try_api_hint'] ?? []) }}</p>
                        <form class="docs-try-form mt-4 space-y-4" data-endpoint-id="{{ $ep['id'] }}">
                            <div>
                                <label class="block text-xs font-semibold uppercase tracking-wide text-zinc-600 dark:text-zinc-400">{{ $t($ui['try_path'] ?? 'Path') }}</label>
                                <input type="text" name="path" value="{{ $tryDefaultPath }}"
                                    class="mt-1.5 w-full rounded-lg border border-zinc-200 bg-white px-3 py-2 font-mono text-sm text-zinc-900 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/15 dark:border-zinc-600 dark:bg-zinc-950 dark:text-zinc-100">
                            </div>
                            @if (in_array($method, ['POST', 'PUT', 'PATCH', 'DELETE'], true))
                                <div>
                                    <label class="block text-xs font-semibold uppercase tracking-wide text-zinc-600 dark:text-zinc-400">{{ $t($ui['try_body'] ?? 'Body') }}</label>
                                    <textarea name="body" rows="6" class="mt-1.5 w-full rounded-lg border border-zinc-200 bg-white px-3 py-2 font-mono text-sm text-zinc-900 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/15 dark:border-zinc-600 dark:bg-zinc-950 dark:text-zinc-100">{{ isset($ep['request_body']) ? json_encode($ep['request_body'], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) : '{}' }}</textarea>
                                </div>
                            @endif
                            <button type="submit" class="rounded-lg bg-blue-600 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 dark:focus:ring-offset-zinc-900">{{ $t($ui['send'] ?? 'Send') }}</button>
                            <div>
                                <div class="text-xs font-semibold uppercase tracking-wide text-zinc-600 dark:text-zinc-400">{{ $t($ui['response'] ?? 'Response') }}</div>
                                <pre class="docs-try-output mt-2 max-h-80 overflow-auto rounded-lg border border-zinc-200 bg-[#1e293b] p-4 font-mono text-xs text-zinc-100 dark:border-zinc-700">—</pre>
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
