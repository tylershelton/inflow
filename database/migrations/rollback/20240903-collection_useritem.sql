DO $$
BEGIN
    -- Step 1: Drop the new function
    DROP FUNCTION IF EXISTS update_item_collections(INTEGER, INTEGER, INTEGER[]);

    -- Step 2: Recreate the dropped column in the user_item table
    ALTER TABLE user_item
    ADD COLUMN IF NOT EXISTS collection_id INTEGER;

    -- Step 3: Repopulate the collection_id column from collection_useritem table
    UPDATE user_item ui
    SET collection_id = cu.collection_id
    FROM collection_useritem cu
    WHERE ui.user_id = cu.user_id AND ui.item_id = cu.item_id;

    -- Step 4: Drop the new many-to-many table
    DROP TABLE IF EXISTS collection_useritem;

    -- Step 5: Restore the previous view without the collection_ids array
    DROP VIEW IF EXISTS view_user_item;

    CREATE VIEW view_user_item AS
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
