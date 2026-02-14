# Discogs DB API

A REST API built with Ruby on Rails that provides structured access to a local copy of the [Discogs](https://www.discogs.com/) music database. It exposes searchable, paginated endpoints for artists, master recordings, releases, and record labels.

## Features

- **Search** across artists, masters, releases, and labels with relevance-ranked results
- **Pagination** via [Pagy](https://github.com/ddnexus/pagy) on all list endpoints
- **Vinyl filter** — filter masters and artist discographies to vinyl-only records
- **Media format filter** — filter releases by media format (CD, Vinyl, Cassette, etc.)
- **Ingestion tracking** — flag artists and masters as ingested for sync workflows

## Tech Stack

- Ruby 3.3.5
- Rails 8.1 (API-only)
- PostgreSQL

## Local Development

```bash
bundle install
rails db:create db:migrate
rails server
```

The development database name is `discogs`. You'll need a local PostgreSQL instance running and the Discogs data loaded.

## Deployment (Docker)

The app is designed to run on a Raspberry Pi behind [Tailscale](https://tailscale.com/). Docker Compose handles both the Rails app and PostgreSQL — no external database setup needed.

### 1. Install prerequisites on the Pi

- [Docker](https://docs.docker.com/engine/install/debian/)
- [Tailscale](https://tailscale.com/download/linux)

### 2. Configure environment

```bash
cp .env.example .env
```

Edit `.env` and set your values:

```
POSTGRES_USER=discogs
POSTGRES_PASSWORD=pick_a_password
POSTGRES_DB=discogs
SECRET_KEY_BASE=run_openssl_rand_hex_64_to_generate
```

Generate `SECRET_KEY_BASE` with:

```bash
openssl rand -hex 64
```

### 3. Build and start

```bash
docker compose up -d --build
```

This will:
- Pull Postgres 17 and build the Rails image on the Pi
- Create the database and run migrations automatically on first boot
- Start the API on port 3030

The API will be available at `http://<your-tailscale-hostname>:3030`.

### Managing the app

```bash
docker compose logs -f        # view logs
docker compose restart web    # restart the app
docker compose down           # stop everything
docker compose up -d --build  # rebuild after pulling changes
```

## API Endpoints

### Artists

| Method | Path | Description |
|--------|------|-------------|
| GET | `/artists` | List artists (paginated, `?query=` to search) |
| GET | `/artists/:id` | Artist details with aliases, images, name variations, and group memberships |
| PUT | `/artists/:id/ingest` | Mark an artist as ingested |
| GET | `/artists/:id/discography` | Paginated masters for an artist (`?vinyl` to filter vinyl-only) |

### Masters

| Method | Path | Description |
|--------|------|-------------|
| GET | `/masters` | List masters (paginated, `?query=` to search, `?vinyl` to filter) |
| GET | `/masters/:id` | Master details with artists, genres, styles, images, and videos |
| PUT | `/masters/:id/ingest` | Mark a master as ingested |
| GET | `/masters/:id/releases` | Paginated releases for a master |
| GET | `/masters/:id/releases/:media` | Releases for a master filtered by media format |

### Releases

| Method | Path | Description |
|--------|------|-------------|
| GET | `/releases` | List releases (paginated, `?query=` to search, `?format=` to filter) |
| GET | `/releases/:id` | Release details with tracks, artists, labels, formats, and more |

### Labels

| Method | Path | Description |
|--------|------|-------------|
| GET | `/labels` | List labels (paginated, `?query=` to search) |
| GET | `/labels/:id` | Label details with images, URLs, and sublabels |

### Health

| Method | Path | Description |
|--------|------|-------------|
| GET | `/up` | Health check |

## Response Format

List endpoints return paginated responses:

```json
{
  "pagy": { "count": 1000, "page": 1, "pages": 50, "limit": 20 },
  "data": [ ... ]
}
