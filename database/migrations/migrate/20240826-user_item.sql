-- break user-specific metadata about individual items into its own table.

DO $$
BEGIN

    CREATE TABLE IF NOT EXISTS user_item (
        user_id     INTEGER     NOT NULL,
        item_id     INTEGER     NOT NULL,
        read        BOOLEAN     NOT NULL DEFAULT FALSE,
        archived    BOOLEAN     NOT NULL DEFAULT FALSE,
        read_at     TIMESTAMP,
        archived_at TIMESTAMP,

        PRIMARY KEY (user_id, item_id),
        FOREIGN KEY (user_id) REFERENCES user_account(id) ON DELETE CASCADE,
        FOREIGN KEY (item_id) REFERENCES feeditem(id) ON DELETE RESTRICT
    );

    INSERT INTO user_item (user_id, item_id)
        SELECT uf.user_id, i.id
        FROM user_feed uf
        INNER JOIN feeditem i ON uf.feed_id = i.feed_id
        ON CONFLICT (user_id, item_id) DO NOTHING;

    ALTER TABLE feeditem
    DROP COLUMN IF EXISTS archived;

END $$;
