# goose-postgres

**goose-postgres** - is lightweight Docker image for [goose](https://github.com/pressly/goose?tab=readme-ov-file) with PostgreSQL

Usage with Docker Compose
```yaml
services:
  migrations:
    image: cispace/goose-postgres
    volumes:
      - ./migrations:/migrations
    environment:
      GOOSE_MIGRATION_DIR: '/migrations'
      GOOSE_DBSTRING: "host=postgres user=root password=root dbname=users sslmode=disable"
    command: up
```
