<?php

$runningOnVercel = filter_var($_ENV['VERCEL'] ?? $_SERVER['VERCEL'] ?? false, FILTER_VALIDATE_BOOLEAN)
    || isset($_ENV['VERCEL_ENV'])
    || isset($_SERVER['VERCEL_ENV']);

$runtimeStoragePath = null;

if ($runningOnVercel) {
    $runtimeStoragePath = sys_get_temp_dir() . '/laravel';

    foreach ([
        $runtimeStoragePath,
        $runtimeStoragePath . '/bootstrap/cache',
        $runtimeStoragePath . '/framework/views',
        $runtimeStoragePath . '/framework/cache/data',
        $runtimeStoragePath . '/framework/sessions',
    ] as $dir) {
        if (!is_dir($dir)) {
            @mkdir($dir, 0777, true);
        }
    }

    $runtimeEnv = [
        'APP_SERVICES_CACHE' => $runtimeStoragePath . '/bootstrap/cache/services.php',
        'APP_PACKAGES_CACHE' => $runtimeStoragePath . '/bootstrap/cache/packages.php',
        'APP_CONFIG_CACHE' => $runtimeStoragePath . '/bootstrap/cache/config.php',
        'APP_ROUTES_CACHE' => $runtimeStoragePath . '/bootstrap/cache/routes.php',
        'APP_EVENTS_CACHE' => $runtimeStoragePath . '/bootstrap/cache/events.php',
        'LIVEWIRE_MANIFEST_PATH' => $runtimeStoragePath . '/bootstrap/cache/livewire-components.php',
        'VIEW_COMPILED_PATH' => $runtimeStoragePath . '/framework/views',
    ];

    foreach ($runtimeEnv as $key => $value) {
        putenv($key . '=' . $value);
        $_ENV[$key] = $value;
        $_SERVER[$key] = $value;
    }
}

/*
|--------------------------------------------------------------------------
| Create The Application
|--------------------------------------------------------------------------
|
| The first thing we will do is create a new Laravel application instance
| which serves as the "glue" for all the components of Laravel, and is
| the IoC container for the system binding all of the various parts.
|
*/

$app = new Illuminate\Foundation\Application(
    $_ENV['APP_BASE_PATH'] ?? dirname(__DIR__)
);

if ($runningOnVercel && $runtimeStoragePath !== null) {
    $app->useStoragePath($runtimeStoragePath);
}

/*
|--------------------------------------------------------------------------
| Bind Important Interfaces
|--------------------------------------------------------------------------
|
| Next, we need to bind some important interfaces into the container so
| we will be able to resolve them when needed. The kernels serve the
| incoming requests to this application from both the web and CLI.
|
*/

$app->singleton(
    Illuminate\Contracts\Http\Kernel::class,
    App\Http\Kernel::class
);

$app->singleton(
    Illuminate\Contracts\Console\Kernel::class,
    App\Console\Kernel::class
);

$app->singleton(
    Illuminate\Contracts\Debug\ExceptionHandler::class,
    App\Exceptions\Handler::class
);

/*
|--------------------------------------------------------------------------
| Return The Application
|--------------------------------------------------------------------------
|
| This script returns the application instance. The instance is given to
| the calling script so we can separate the building of the instances
| from the actual running of the application and sending responses.
|
*/

return $app;
