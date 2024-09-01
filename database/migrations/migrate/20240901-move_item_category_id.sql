DO $$
BEGIN
    -- move the category_id field in the `item` table to the
    -- `user_item` table, and bring it in line with the new
    -- 'collection' nomenclature.
    ALTER TABLE user_item
        ADD COLUMN IF NOT EXISTS collection_id INTEGER;

    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'user_item_collection_id_fkey'
    ) THEN
        ALTER TABLE user_item
            ADD CONSTRAINT user_item_collection_id_fkey FOREIGN KEY (collection_id)
                REFERENCES collection(id) ON DELETE SET NULL;
    END IF;

    IF EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_name = 'item' AND column_name = 'category_id'
    ) THEN
        UPDATE user_item
            SET collection_id = (
                SELECT item.category_id
                FROM item
                WHERE item.id = user_item.item_id
            );

        DROP VIEW IF EXISTS view_user_item;

        ALTER TABLE item
            DROP COLUMN category_id;
    END IF;

    CREATE OR REPLACE VIEW view_user_item AS
        SELECT
            i.id,
            i.title,
            i.description,
            i.url,
            i.pubdate,
            i.feed_id,
            ui.collection_id,
            ui.user_id,
            ui.read,
            ui.archived,
            ui.read_at,
            ui.archived_at
        FROM item i
        INNER JOIN user_item ui ON i.id = ui.item_id;

END $$;
