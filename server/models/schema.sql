CREATE TABLE IF NOT EXISTS category (
    id                          SERIAL PRIMARY KEY,
    title        varchar(80)    NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS feed (
    id                          SERIAL PRIMARY KEY,
    url         varchar(255)    NOT NULL UNIQUE,
    title       varchar(255)    NOT NULL,
    description varchar(255),
    category_id integer         REFERENCES category(id)
);

CREATE TABLE IF NOT EXISTS feeditem (
    id                          SERIAL PRIMARY KEY,
    title       varchar(255),
    description varchar(255),
    url         varchar(255)    UNIQUE,
    pubDate     timestamp,
    archived    boolean         DEFAULT false,
    feed_id     integer         REFERENCES feed(id),
    category_id integer         REFERENCES category(id),
    
    CONSTRAINT title_or_description CHECK (title IS NOT NULL OR description IS NOT NULL)
);
