CREATE TABLE IF NOT EXISTS feed (
    id                       SERIAL PRIMARY KEY,
    url         varchar(255) NOT NULL UNIQUE,
    title       varchar(255) NOT NULL,
    description varchar(255)
);
