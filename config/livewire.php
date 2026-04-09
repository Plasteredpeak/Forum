<?php

$runningOnVercel = filter_var(env('VERCEL', false), FILTER_VALIDATE_BOOLEAN)
    || !empty(env('VERCEL_ENV'));

return [
    'manifest_path' => $runningOnVercel
        ? sys_get_temp_dir() . '/laravel/bootstrap/cache/livewire-components.php'
        : null,
];
