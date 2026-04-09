param()

$ErrorActionPreference = 'Stop'

if (-not (Test-Path '.env')) {
    Copy-Item '.env.example' '.env'
}

if (Select-String -Path '.env' -Pattern '^APP_KEY=$' -Quiet) {
    php artisan key:generate
}

composer install --no-dev --no-scripts
npm install
php artisan migrate --force
php artisan db:seed
$env:NODE_OPTIONS = '--openssl-legacy-provider'
npm run dev
php artisan serve --host=127.0.0.1 --port=8000
