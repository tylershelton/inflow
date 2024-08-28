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

    IF NOT EXISTS (
        SELECT 1
        FROM pg_views
        WHERE viewname = 'view_user_item'
    ) THEN
        CREATE VIEW view_user_item AS
            SELECT
                i.id,
                i.title,
                i.description,
                i.url,
                i.pubdate,
                i.feed_id,
                ui.user_id,
                ui.read,
                ui.archived,
                ui.read_at,
                ui.archived_at
            FROM feeditem i
            INNER JOIN user_item ui ON i.id = ui.item_id;
    END IF;

END $$;
