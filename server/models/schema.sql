CREATE TABLE IF NOT EXISTS feed (
    id                       SERIAL PRIMARY KEY,
    url         varchar(255) NOT NULL UNIQUE,
    title       varchar(255) NOT NULL,
    description varchar(255),
    category_id integer      REFERENCES category(id)
);

CREATE TABLE IF NOT EXISTS category (
    id                   SERIAL PRIMARY KEY,
    name    varchar(80)  NOT NULL
);