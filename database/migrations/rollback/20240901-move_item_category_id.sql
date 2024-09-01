DO $$
BEGIN
    -- Step 1: Add 'category_id' back to 'item'
    ALTER TABLE item
        ADD COLUMN IF NOT EXISTS category_id INTEGER;

    -- Step 2: Repopulate 'category_id' in 'item' from 'user_item.collection_id'
    IF EXISTS (
        SELECT 1
        FROM information_schema.columns 
        WHERE table_name = 'user_item' AND column_name = 'collection_id'
    ) THEN
        UPDATE item
        SET category_id = (
            SELECT collection_id
            FROM user_item
            WHERE user_item.item_id = item.id
        );
    END IF;

    -- Step 3: Drop foreign key constraint from 'user_item'
    IF EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'user_item_collection_id_fkey'
    ) THEN
        ALTER TABLE user_item
            DROP CONSTRAINT user_item_collection_id_fkey;
    END IF;

    -- Step 4: Drop 'collection_id' column from 'user_item'
    ALTER TABLE user_item
        DROP COLUMN IF EXISTS collection_id;

    -- Step 5: Drop and recreate the original 'view_user_item'
    DROP VIEW IF EXISTS view_user_item;
    CREATE VIEW view_user_item AS
        SELECT
            i.id,
            i.title,
            i.description,
            i.url,
            i.pubdate,
            i.feed_id,
            i.category_id,
            ui.user_id,
            ui.read,
            ui.archived,
            ui.read_at,
            ui.archived_at
        FROM item i
        INNER JOIN user_item ui ON i.id = ui.item_id;
END $$;
