CREATE TABLE IF NOT EXISTS category (
    id                              SERIAL PRIMARY KEY,
    title           varchar(80)     NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS feed (
    id                              SERIAL PRIMARY KEY,
    url             varchar(255)    NOT NULL UNIQUE,
    title           varchar(255)    NOT NULL,
    description     text,
    category_id     integer         REFERENCES category(id)
);

CREATE TABLE IF NOT EXISTS feeditem (
    id                              SERIAL PRIMARY KEY,
    title           varchar(255),
    description     text,
    url             varchar(255)    UNIQUE,
    pubDate         timestamp,
    archived        boolean         DEFAULT false,
    feed_id         integer         REFERENCES feed(id),
    category_id     integer         REFERENCES category(id),
    
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

-- table for persisting user sessions
CREATE TABLE IF NOT EXISTS user_session (
    sid             varchar         NOT NULL COLLATE "default",
    sess            json            NOT NULL,
    expire          timestamp(6)    NOT NULL
);

DO $$
BEGIN

    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'session_pkey') THEN
        ALTER TABLE "user_session" ADD CONSTRAINT "session_pkey" PRIMARY KEY ("sid") NOT DEFERRABLE;
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM pg_indexes
        WHERE tablename = 'user_session' AND indexname = 'IDX_session_expire'
    ) THEN
        CREATE INDEX "IDX_session_expire" ON "user_session" ("expire");
    END IF;

END $$;

