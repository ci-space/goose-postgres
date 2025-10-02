# goose-postgres

![Docker Image Version](https://img.shields.io/docker/v/cispace/goose-postgres?style=for-the-badge&logo=docker&label=Image%20Version&link=https%3A%2F%2Fhub.docker.com%2Fr%2Fcispace%2Fgoose-postgres)
![Docker Image Size](https://img.shields.io/docker/image-size/cispace/goose-postgres?style=for-the-badge&logo=docker&label=Image%20Size&link=https%3A%2F%2Fhub.docker.com%2Fr%2Fcispace%2Fgoose-postgres)


**goose-postgres** - is lightweight Docker image for [goose](https://github.com/pressly/goose?tab=readme-ov-file) with PostgreSQL

Usage with Docker Compose
```yaml
services:
  migrations:
    image: cispace/goose-postgres
    volumes:
      - ./migrations:/migrations
    environment:
      GOOSE_DBSTRING: "host=postgres user=root password=root dbname=users sslmode=disable"
    command: up
```
