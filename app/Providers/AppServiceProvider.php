<?php

namespace App\Providers;

use App\Models\ContentDetails;
use App\Models\Language;
use App\Services\SidebarDataService;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Mail;
use Symfony\Component\Mailer\Bridge\Mailchimp\Transport\MandrillTransportFactory;
use Symfony\Component\Mailer\Bridge\Sendgrid\Transport\SendgridTransportFactory;
use Symfony\Component\Mailer\Bridge\Sendinblue\Transport\SendinblueTransportFactory;
use Symfony\Component\Mailer\Transport\Dsn;

class AppServiceProvider extends ServiceProvider
{

    public function register(): void
    {

    }

    public function boot(): void
    {
        try{
            DB::connection()->getPdo();

            Blade::directive('active', function ($route) {
                return "<?php echo request()->routeIs($route) ? 'active' : ''; ?>";
            });
            Blade::directive('serial', function () {
                return '<?= $loop->iteration; ?>';
            });

            $data['basicControl'] = basicControl();
            $data['theme'] = template();
            $data['themeTrue'] = template(true);
            View::share($data);

            view()->composer([
                $data['theme'] . 'partials.header',
                $data['theme'] . 'sections.footer',
                $data['theme'] . 'page',
            ], function ($view) {

                $contentSections = Cache::remember('content_sections_footer_cookies', now()->addHour(), function () {
                    return ContentDetails::with('content')
                        ->whereRelation('content', 'name', 'cookies')
                        ->orWhereRelation('content', 'name', 'footer')
                        ->get()
                        ->groupBy('content.name');
                });

                /*$languages = Cache::remember('active_languages', now()->addHour(), function () {
                    return Language::query()->orderBy('default_status', 'desc')->where('status', 1)->get();
                });*/

                $languages =Language::query()->orderBy('default_status', 'desc')->where('status', 1)->get();

                $footer = $contentSections->get('footer') ?? collect([]);
                $singleContent = $footer->where('content.type', 'single')->first();
                $multipleContents = $footer->where('content.type', 'multiple')->values()->map(function ($multipleContentData) {
                    return collect($multipleContentData->description)
                        ->merge($multipleContentData->content->only('media'));
                });
                $data = [
                    'single' => $singleContent
                        ? collect($singleContent->description ?? [])->merge($singleContent->content->only('media'))
                        : [],
                    'multiple' => $multipleContents,
                    'languages' => $languages
                ];
                $view->with('footer', $data);
            });

            view()->composer([
                'admin.layouts.sidebar',
            ], function ($view) {
                $sidebarCounts = Cache::remember('sidebar_counts', now()->addMinutes(10), function () {
                    return SidebarDataService::getSidebarCounts();
                });
                $view->with('sidebarCounts', $sidebarCounts);
            });


            if (basicControl()->is_force_ssl == 1) {
                if ($this->app->environment('production') || $this->app->environment('local')) {
                    \URL::forceScheme('https');
                }
            }

            Mail::extend('sendinblue', function () {
                return (new SendinblueTransportFactory)->create(
                    new Dsn(
                        'sendinblue+api',
                        'default',
                        config('services.sendinblue.key')
                    )
                );
            });

            Mail::extend('sendgrid', function () {
                return (new SendgridTransportFactory)->create(
                    new Dsn(
                        'sendgrid+api',
                        'default',
                        config('services.sendgrid.key')
                    )
                );
            });

            Mail::extend('mandrill', function () {
                return (new MandrillTransportFactory)->create(
                    new Dsn(
                        'mandrill+api',
                        'default',
                        config('services.mandrill.key')
                    )
                );
            });
        } catch (\Exception $e){

        }

    }
}
