{{-- ReadMe-style language icons (compact, stroke) --}}
@php $c = 'h-3.5 w-3.5 shrink-0 opacity-90'; @endphp
@if ($icon === 'shell')
    <svg class="{{ $c }}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 9l2.25 3L8.25 15m4.5-3h6M5.25 4.5h13.5a1 1 0 011 1v13a1 1 0 01-1 1H5.25a1 1 0 01-1-1v-13a1 1 0 011-1z"/></svg>
@elseif ($icon === 'node')
    <svg class="{{ $c }}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/><path stroke-linecap="round" stroke-linejoin="round" d="M9 9.75V8.25m0 7.5v-1.5m3-4.5v-1.5m0 6v-1.5m3-1.5v-1.5m0 3v-1.5"/></svg>
@elseif ($icon === 'php')
    <svg class="{{ $c }}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M17.25 6.75L22 12l-4.75 5.25M6.75 17.25L2 12l4.75-5.25"/></svg>
@elseif ($icon === 'python')
    <svg class="{{ $c }}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M9.75 3.104v5.714a2.25 2.25 0 01-.659 1.591L5 14.5M9.75 3.104c-.251.023-.501.05-.75.082m.75-.082a24.301 24.301 0 014.5 0m0 0v5.714c0 .597.237 1.17.659 1.591L19.8 15.3M14.25 3.104c.251.023.501.05.75.082M19.8 15.3l-1.57.393A9.065 9.065 0 0112 15a9.065 9.065 0 00-6.23-.693L5 14.5m14.8.8l1.402 1.402c1.232 1.232 1.232 3.23 0 4.462s-3.23 1.232-4.462 0L14.25 19.5m0 0l-1.09-1.09a3 3 0 00-4.24 0L7.5 19.5"/></svg>
@else
    <svg class="{{ $c }}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M17.25 6.75L22 12l-4.75 5.25m-10.5 0L2 12l4.75-5.25"/></svg>
@endif
