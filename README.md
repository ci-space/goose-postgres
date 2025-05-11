# goose-postgres

goose-postgres - is lightweight image for [goose](https://github.com/pressly/goose?tab=readme-ov-file) with PostgreSQL

Usage with Docker Compose
```yaml
services:
  migrations:
    image: cispace/goose-postgres
    environment:
      GOOSE_DBSTRING: "host=postgres user=root password=root dbname=users sslmode=disable"
```
