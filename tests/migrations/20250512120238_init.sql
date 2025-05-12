-- +goose Up
-- +goose StatementBegin
CREATE TABLE users (
  id VARCHAR NOT NULL,
  name VARCHAR NOT NULL
);

ALTER TABLE users ADD PRIMARY KEY (id);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE users;
-- +goose StatementEnd
