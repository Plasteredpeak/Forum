<?php

namespace App\Providers;

use App\Models\User;
use App\Models\Reply;
use App\Models\Thread;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;
use Illuminate\Database\Eloquent\Relations\Relation;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $forwardedProto = request()->headers->get('x-forwarded-proto');
        $shouldForceHttps = app()->environment('production') || env('VERCEL') || $forwardedProto === 'https';

        if ($shouldForceHttps) {
            URL::forceScheme('https');

            $host = request()->getHost();

            if (!empty($host)) {
                URL::forceRootUrl('https://' . $host);
            }
        }

        $this->bootEloquentMorphsRelations();
    }
    public function bootEloquentMorphsRelations()
    {
        Relation::morphMap([
                Thread::TABLE => Thread::class,
                Reply::TABLE => Reply::class,
                User::TABLE => User::class,
        ]);
    }
}
