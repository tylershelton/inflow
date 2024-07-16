CREATE DATABASE inflow
    WITH ENCODING = 'UTF8'
         LC_COLLATE = 'en_US.UTF-8'
         LC_CTYPE = 'en_US.UTF-8';
-- WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'inflow');

CREATE TABLE IF NOT EXISTS category (
    id                         SERIAL PRIMARY KEY,
    title       varchar(80)    NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS feed (
    id                          SERIAL PRIMARY KEY,
    url         varchar(255)    NOT NULL UNIQUE,
    title       varchar(255)    NOT NULL,
    description text,
    category_id integer         REFERENCES category(id)
);

CREATE TABLE IF NOT EXISTS feeditem (
    id                          SERIAL PRIMARY KEY,
    title       varchar(255),
    description text,
    url         varchar(255)    UNIQUE,
    pubDate     timestamp,
    archived    boolean         DEFAULT false,
    feed_id     integer         REFERENCES feed(id),
    category_id integer         REFERENCES category(id),
    
    CONSTRAINT title_or_description CHECK (title IS NOT NULL OR description IS NOT NULL)
);

CREATE TABLE IF NOT EXISTS user_account (
    id                              SERIAL PRIMARY KEY,
    username        varchar(255)    UNIQUE NOT NULL,
    password_hash   BYTEA           NOT NULL,
    password_salt   BYTEA           NOT NULL,
    last_login      timestamp,
    created_at      timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP
);
