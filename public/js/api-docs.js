/**
 * API docs: theme, code tabs, copy, Try API, search.
 */
(function () {
    'use strict';

    const cfg = window.__API_DOCS__ || {};
    const STORAGE_TOKEN = 'apiDocsBearerToken';
    const STORAGE_THEME = 'apiDocsTheme';

    function $(sel, root) {
        return (root || document).querySelector(sel);
    }

    function $$(sel, root) {
        return Array.prototype.slice.call((root || document).querySelectorAll(sel));
    }

    function prettyJson(obj) {
        try {
            return JSON.stringify(obj, null, 2);
        } catch (e) {
            return String(obj);
        }
    }

    function getToken() {
        const input = $('#docs-bearer-token');
        return input ? input.value.trim() : '';
    }

    function buildHeaders(ep, token) {
        const h = { Accept: 'application/json' };
        const hasBody =
            ep.request_body &&
            typeof ep.request_body === 'object' &&
            ['POST', 'PUT', 'PATCH', 'DELETE'].includes(ep.method);
        if (hasBody) {
            h['Content-Type'] = 'application/json';
        }
        (ep.headers || []).forEach(function (row) {
            if (row.name && row.name.toLowerCase() === 'authorization' && token) {
                h['Authorization'] = 'Bearer ' + token;
            }
        });
        if (ep.requires_auth && token) {
            h['Authorization'] = 'Bearer ' + token;
        }
        return h;
    }

    function buildCurl(method, url, headers, bodyObj) {
        let s = "curl -X " + method + " '" + url.replace(/'/g, "'\\''") + "' \\\n";
        Object.keys(headers).forEach(function (k) {
            s += "  -H '" + k + ": " + String(headers[k]).replace(/'/g, "'\\''") + "' \\\n";
        });
        if (bodyObj && ['POST', 'PUT', 'PATCH', 'DELETE'].includes(method)) {
            const raw = JSON.stringify(bodyObj);
            s += "  -d '" + raw.replace(/'/g, "'\\''") + "'\n";
        } else {
            s = s.replace(/ \\\n$/, '\n');
        }
        return s.trimEnd();
    }

    function buildFetch(method, url, headers, bodyObj) {
        const hasBody = bodyObj && ['POST', 'PUT', 'PATCH', 'DELETE'].includes(method);
        let code =
            "const url = '" +
            url.replace(/\\/g, '\\\\').replace(/'/g, "\\'") +
            "';\n" +
            'const options = {\n' +
            "  method: '" +
            method +
            "',\n" +
            '  headers: ' +
            prettyJson(headers) +
            ',\n';
        if (hasBody) {
            code += '  body: JSON.stringify(' + prettyJson(bodyObj) + '),\n';
        }
        code += '};\n\nconst res = await fetch(url, options);\nconst data = await res.json();\nconsole.log(res.status, data);';
        return code;
    }

    function buildAxios(method, url, headers, bodyObj) {
        const hasBody = bodyObj && ['POST', 'PUT', 'PATCH', 'DELETE'].includes(method);
        let code = "const { data, status } = await axios({\n";
        code += "  method: '" + method.toLowerCase() + "',\n";
        code += "  url: '" + url.replace(/\\/g, '\\\\').replace(/'/g, "\\'") + "',\n";
        code += '  headers: ' + prettyJson(headers);
        if (hasBody) {
            code += ',\n  data: ' + prettyJson(bodyObj);
        }
        code += '\n});\nconsole.log(status, data);';
        return code;
    }

    function buildPhp(method, url, headers, bodyObj) {
        const hasBody = bodyObj && ['POST', 'PUT', 'PATCH', 'DELETE'].includes(method);
        let code = "<?php\n\nuse Illuminate\\Support\\Facades\\Http;\n\n";
        code += '$response = Http::withHeaders(' + prettyJson(headers) + ")\n    ->" + method.toLowerCase() + "('" + url.replace(/'/g, "\\'") + "'";
        if (hasBody) {
            code += ', ' + prettyJson(bodyObj);
        }
        code += ");\n\necho $response->body();\n";
        return code;
    }

    function buildPython(method, url, headers, bodyObj) {
        const hasBody = bodyObj && ['POST', 'PUT', 'PATCH', 'DELETE'].includes(method);
        let code = 'import requests\n\n';
        code += 'url = "' + url.replace(/"/g, '\\"') + '"\n';
        code += 'headers = ' + prettyJson(headers).replace(/true/g, 'True').replace(/false/g, 'False').replace(/null/g, 'None') + '\n';
        if (hasBody) {
            code += 'payload = ' + prettyJson(bodyObj) + '\n';
            code +=
                'r = requests.' +
                method.toLowerCase() +
                '(url, headers=headers, json=payload)\n';
        } else {
            code += 'r = requests.' + method.toLowerCase() + '(url, headers=headers)\n';
        }
        code += 'print(r.status_code, r.text)\n';
        return code;
    }

    function buildNode(method, url, headers, bodyObj) {
        const hasBody = bodyObj && ['POST', 'PUT', 'PATCH', 'DELETE'].includes(method);
        let code = "const fetch = (...args) => import('node-fetch').then(({ default: f }) => f(...args));\n\n";
        code += 'async function main() {\n';
        code += "  const url = '" + url.replace(/\\/g, '\\\\').replace(/'/g, "\\'") + "';\n";
        code += '  const options = { method: \'' + method + "', headers: " + prettyJson(headers);
        if (hasBody) {
            code += ', body: JSON.stringify(' + prettyJson(bodyObj) + ')';
        }
        code += ' };\n';
        code += '  const res = await fetch(url, options);\n';
        code += '  const text = await res.text();\n';
        code += '  console.log(res.status, text);\n';
        code += '}\n\nmain();\n';
        return code;
    }

    const generators = {
        curl: buildCurl,
        fetch: buildFetch,
        axios: buildAxios,
        php: buildPhp,
        python: buildPython,
        node: buildNode,
    };

    function resolveUrl(apiBase, pathAfterApi) {
        const p = String(pathAfterApi || '').replace(/^\/+/, '');
        return apiBase + '/' + p;
    }

    function fillSnippetBlocks() {
        const token = getToken();
        const endpoints = cfg.endpoints || [];
        endpoints.forEach(function (ep) {
            const url = ep.full_url;
            const headers = buildHeaders(ep, token);
            const body = ep.request_body || null;
            Object.keys(generators).forEach(function (lang) {
                const el = document.getElementById('snippet-' + ep.id + '-' + lang);
                if (!el) {
                    return;
                }
                try {
                    if (lang === 'curl') {
                        el.textContent = buildCurl(ep.method, url, headers, body);
                    } else {
                        el.textContent = generators[lang](ep.method, url, headers, body);
                    }
                } catch (e) {
                    el.textContent = '// Error building snippet';
                }
            });
        });
    }

    function initTheme() {
        const html = document.documentElement;
        const saved = localStorage.getItem(STORAGE_THEME);
        if (saved === 'dark' || (!saved && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
            html.classList.add('dark');
        }
        $$('.docs-theme-toggle').forEach(function (btn) {
            btn.addEventListener('click', function () {
                html.classList.toggle('dark');
                localStorage.setItem(STORAGE_THEME, html.classList.contains('dark') ? 'dark' : 'light');
            });
        });
    }

    function initToken() {
        const input = $('#docs-bearer-token');
        if (!input) {
            return;
        }
        const saved = localStorage.getItem(STORAGE_TOKEN);
        if (saved) {
            input.value = saved;
        }
        input.addEventListener('change', function () {
            localStorage.setItem(STORAGE_TOKEN, input.value.trim());
            fillSnippetBlocks();
        });
        input.addEventListener('input', function () {
            localStorage.setItem(STORAGE_TOKEN, input.value.trim());
            fillSnippetBlocks();
        });
    }

    function initCodeTabs() {
        $$('.docs-code-tab-group').forEach(function (group) {
            const epId = group.getAttribute('data-endpoint-id');
            const tabs = $$('.docs-code-tab', group);
            const panels = $$('.docs-code-panel', group);
            tabs.forEach(function (tab, i) {
                tab.addEventListener('click', function () {
                    tabs.forEach(function (t) {
                        t.classList.remove('border-violet-500', 'text-violet-600', 'dark:text-violet-400');
                        t.classList.add('border-transparent', 'text-slate-500');
                    });
                    tab.classList.add('border-violet-500', 'text-violet-600', 'dark:text-violet-400');
                    tab.classList.remove('border-transparent', 'text-slate-500');
                    panels.forEach(function (p, j) {
                        p.classList.toggle('hidden', j !== i);
                    });
                });
            });
        });
    }

    function initCopyButtons() {
        document.body.addEventListener('click', function (e) {
            const btn = e.target.closest('[data-copy-target]');
            if (!btn) {
                return;
            }
            const id = btn.getAttribute('data-copy-target');
            const el = document.getElementById(id);
            if (!el) {
                return;
            }
            const text = el.textContent || '';
            navigator.clipboard.writeText(text).then(function () {
                const orig = btn.textContent;
                btn.textContent = btn.getAttribute('data-copied-label') || 'Copied';
                setTimeout(function () {
                    btn.textContent = orig;
                }, 1600);
            });
        });
    }

    function initSearch() {
        const input = $('#docs-search');
        if (!input) {
            return;
        }
        input.addEventListener('input', function () {
            const q = input.value.trim().toLowerCase();
            $$('.docs-nav-endpoint').forEach(function (link) {
                const hay = (link.getAttribute('data-search') || '').toLowerCase();
                link.classList.toggle('hidden', q.length > 0 && hay.indexOf(q) === -1);
            });
            $$('.docs-nav-category').forEach(function (cat) {
                const visible = $$('.docs-nav-endpoint', cat).filter(function (l) {
                    return !l.classList.contains('hidden');
                }).length;
                const isOverview = cat.getAttribute('data-category') === 'overview';
                cat.classList.toggle('hidden', !isOverview && q.length > 0 && visible === 0);
            });
        });
    }

    function initTryApi() {
        document.body.addEventListener('submit', function (e) {
            const form = e.target.closest('.docs-try-form');
            if (!form) {
                return;
            }
            e.preventDefault();
            const epId = form.getAttribute('data-endpoint-id');
            const ep = (cfg.endpoints || []).find(function (x) {
                return x.id === epId;
            });
            if (!ep) {
                return;
            }
            const pathInput = form.querySelector('[name="path"]');
            const bodyInput = form.querySelector('[name="body"]');
            const out = form.querySelector('.docs-try-output');
            const path = (pathInput && pathInput.value) || ep.path.replace(/\{[^}]+\??\}/g, '');
            const url = resolveUrl(cfg.apiBase, path);
            let body = null;
            if (bodyInput && bodyInput.value.trim()) {
                try {
                    body = JSON.parse(bodyInput.value);
                } catch (err) {
                    out.textContent = 'Invalid JSON body: ' + err.message;
                    return;
                }
            } else if (ep.request_body && ['POST', 'PUT', 'PATCH', 'DELETE'].includes(ep.method)) {
                body = ep.request_body;
            }
            const token = getToken();
            const headers = buildHeaders(ep, token);
            const opts = { method: ep.method, headers: headers };
            if (body && ['POST', 'PUT', 'PATCH', 'DELETE'].includes(ep.method)) {
                opts.body = JSON.stringify(body);
            }
            out.textContent = 'Loading…';
            fetch(url, opts)
                .then(function (res) {
                    return res.text().then(function (text) {
                        let parsed = text;
                        try {
                            parsed = JSON.stringify(JSON.parse(text), null, 2);
                        } catch (x) {
                            /* keep text */
                        }
                        out.textContent = res.status + ' ' + res.statusText + '\n\n' + parsed;
                    });
                })
                .catch(function (err) {
                    out.textContent = 'Error: ' + err.message;
                });
        });
    }

    function initMobileNav() {
        const openBtn = $('#docs-open-sidebar');
        const closeBtn = $('#docs-close-sidebar');
        const sidebar = $('#docs-sidebar');
        const backdrop = $('#docs-backdrop');
        function open() {
            if (sidebar) {
                sidebar.classList.remove('-translate-x-full');
            }
            if (backdrop) {
                backdrop.classList.remove('hidden');
            }
        }
        function close() {
            if (sidebar) {
                sidebar.classList.add('-translate-x-full');
            }
            if (backdrop) {
                backdrop.classList.add('hidden');
            }
        }
        if (openBtn) {
            openBtn.addEventListener('click', open);
        }
        if (closeBtn) {
            closeBtn.addEventListener('click', close);
        }
        if (backdrop) {
            backdrop.addEventListener('click', close);
        }
        $$('.docs-nav-endpoint, a[href^="#overview"]').forEach(function (a) {
            a.addEventListener('click', function () {
                if (window.innerWidth < 1024) {
                    close();
                }
            });
        });
    }

    document.addEventListener('DOMContentLoaded', function () {
        initTheme();
        initToken();
        fillSnippetBlocks();
        initCodeTabs();
        initCopyButtons();
        initSearch();
        initTryApi();
        initMobileNav();
    });
})();
