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

### 1) Install PHP dependencies

```bash
composer install
```

### 2) Create your environment file

```bash
cp .env.example .env
php artisan key:generate
```

### 3) Configure the database

Update `.env`:

- `DB_CONNECTION=mysql`
- `DB_HOST=127.0.0.1`
- `DB_PORT=3306`
- `DB_DATABASE=forum`
- `DB_USERNAME=...`
- `DB_PASSWORD=...`

### 4) Initialize the database (choose one)

#### Option A — Run migrations + seed (recommended)
```bash
php artisan migrate
# if seeders exist and you want demo data:
# php artisan db:seed
```

#### Option B — Import the provided SQL dump (quick demo data)
This repo includes `forum.sql` (phpMyAdmin export; generated **2022-01-18**, MariaDB **10.4.22**).

Create an empty `forum` database, then import:

```bash
mysql -u root -p forum < forum.sql
```

> If you import `forum.sql`, you typically **do not** need to run migrations (the tables/data are already created).

### 5) Install frontend dependencies + build assets

```bash
npm install
npm run dev
# or production build:
# npm run prod
```

### 6) Run the app

```bash
php artisan serve
```

Open: `http://127.0.0.1:8000`

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
