# syntax=docker/dockerfile:1

FROM golang:1.23.0-alpine AS builder

ARG APP_VERSION="undefined"
ARG BUILD_TIME="undefined"
ARG GOOSE_VERSION="v3.24.0"

WORKDIR /go/src/github.com/pressly/goose

RUN apk add git

RUN git clone https://github.com/pressly/goose --branch $GOOSE_VERSION --single-branch .

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -trimpath \
    -ldflags="-s -w" \
    -tags="no_clickhouse no_libsql no_mssql no_mysql no_sqlite3 no_vertica no_ydb" \
    -o /go/bin/goose \
    ./cmd/goose

######################################################

FROM scratch

WORKDIR /migrations

COPY --from=builder /go/bin/goose /go/bin/goose

EXPOSE 8000

ENV GOOSE_DRIVER=postgres

ENTRYPOINT ["/go/bin/goose"]
