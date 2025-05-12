GOOSE_VERSION = "v3.24.3"

.PHONY: build
build:
	@echo "-> Build image for goose ${GOOSE_VERSION}"

	docker \
		build \
		--build-arg GOOSE_VERSION=${GOOSE_VERSION} \
 		-t cispace/goose-postgres:local \
 		.

.PHONY: test
test: build
	docker rm goose_postgres_pg --force || true

	docker network create goose_postgres || true

	docker run --rm --name=goose_postgres_pg \
		--env POSTGRES_USER=root \
		--env POSTGRES_PASSWORD=root \
		--env POSTGRES_DB=test \
		--network goose_postgres \
		--detach \
		postgres:17.5-alpine

	sleep 2

	docker run --rm \
		-v ./tests/migrations:/migrations \
		--env GOOSE_DBSTRING='host=goose_postgres_pg user=root password=root dbname=test port=5432 sslmode=disable' \
		--network goose_postgres \
		cispace/goose-postgres:local \
		up

	docker rm goose_postgres_pg --force
