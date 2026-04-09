# Forum (Laravel)

A forum website built as a WEB semester project using **Laravel (PHP)** with **Blade**, **TailwindCSS**, **JavaScript/jQuery**, and a **MySQL/MariaDB** database.

## Stack

- **Backend:** Laravel 8 (`laravel/framework: ^8.40`)
- **Auth / UI scaffolding:** Jetstream + Livewire
- **Database:** MySQL / MariaDB
- **Frontend tooling:** TailwindCSS + Laravel Mix (Webpack)
- Other notable packages:
    - `cyrildewit/eloquent-viewable` (view counts)
    - `mews/purifier` (HTML sanitization)

## Features (high level)

- User accounts + authentication (Jetstream)
- Forum threads organized by categories (and tags)
- Replies on threads
- Likes (polymorphic likeable)
- Subscriptions / notifications
- Session storage in database (default `.env.example`: `SESSION_DRIVER=database`)
- View counting (via `eloquent-viewable`)

## Requirements

- PHP **7.3+** (or PHP 8.x)
- Composer
- Node.js + npm
- MySQL / MariaDB

## Local development setup

### Verified local setup

These are the exact steps that were used to run the project successfully on this machine.

1. Make sure these prerequisites are installed:
    - PHP 8.1 with `pdo_mysql` and `mysqli` enabled
    - Composer
    - Node.js + npm
    - MySQL or MariaDB

2. Install PHP dependencies without dev scripts:

    ```bash
    composer install --no-dev --no-scripts
    ```

3. Install frontend dependencies:

    ```bash
    npm install
    ```

4. Create your environment file if it does not already exist:

    ```bash
    cp .env.example .env
    ```

5. Configure the database in `.env`:
    - `DB_CONNECTION=mysql`
    - `DB_HOST=127.0.0.1`
    - `DB_PORT=3306`
    - `DB_DATABASE=forum`
    - `DB_USERNAME=root`
    - `DB_PASSWORD=root`

6. Start MySQL.
    - If you want the Docker setup from this repo, run `docker compose up -d mysql`.
    - Otherwise point `.env` at your local MySQL/MariaDB instance.

7. Create the application key:

    ```bash
    php artisan key:generate
    ```

8. Create the database if needed and run migrations:

    ```bash
    php artisan migrate --force
    ```

9. Seed the demo data:

    ```bash
    php artisan db:seed
    ```

10. Build the frontend assets.

    On modern Node versions, use the OpenSSL compatibility flag:

```bash
$env:NODE_OPTIONS='--openssl-legacy-provider'; npm run dev
```

11. Start the app:

```bash
php artisan serve --host=127.0.0.1 --port=8000
```

Open: `http://127.0.0.1:8000`

### Alternative install path

If you are on PHP 8.0 and want the standard Laravel install flow, you can try:

```bash
composer install
php artisan key:generate
php artisan migrate --force
php artisan db:seed
```

If Composer fails on your PHP version, fall back to the verified setup above.

### SQL dump option

This repo also includes `forum.sql` (phpMyAdmin export; generated **2022-01-18**, MariaDB **10.4.22**).

If you prefer to import the dump instead of migrating, create an empty `forum` database and run:

```bash
mysql -u root -p forum < forum.sql
```

If you import `forum.sql`, you typically do **not** need to run migrations or seeders.

## Deployment

Laravel apps can be deployed in multiple ways. Below are common production steps regardless of provider (VPS, shared hosting, Laravel Forge, PaaS).

### Production checklist

1. **Set production environment values**
    - `APP_ENV=production`
    - `APP_DEBUG=false`
    - `APP_URL=https://your-domain.com`

2. **Set `APP_KEY`**
    - Generate locally: `php artisan key:generate --show`
    - Or generate on the server: `php artisan key:generate`

3. **Database**
    - Provision a MySQL/MariaDB instance (or managed DB)
    - Set `DB_*` variables appropriately

4. **Run migrations**

    ```bash
    php artisan migrate --force
    ```

5. **Cache configuration/routes/views**

    ```bash
    php artisan config:cache
    php artisan route:cache
    php artisan view:cache
    ```

6. **Storage + uploads**

    ```bash
    php artisan storage:link
    ```

    Ensure `storage/` and `bootstrap/cache/` are writable by the web server user.

7. **Queue / scheduler (optional, if used)**
    - If you switch to real queues: set `QUEUE_CONNECTION=database|redis` and run a queue worker.
    - Scheduler: configure a cron job calling `php artisan schedule:run`.

### Web server notes

- The web root should point to: `public/`
- Ensure `.env` is not web-accessible and not committed.

## Security notes

- `.env.example` in this repo includes example mail credentials. **Do not commit real credentials**.
- Rotate any credentials that were ever committed, and prefer environment variables / secrets manager on deployment.

## License

This project is for educational purposes (semester project). Add a `LICENSE` file if you plan to open-source it.
