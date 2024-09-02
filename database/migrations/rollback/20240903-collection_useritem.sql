DO $$
BEGIN
    -- Step 1: Add the 'collection_id' column back to 'user_item' table.
    ALTER TABLE user_item
    ADD COLUMN collection_id INTEGER;

    -- Step 2: Restore the 'collection_id' values from 'collection_useritem'.
    UPDATE user_item ui
    SET collection_id = cu.collection_id
    FROM collection_useritem cu
    WHERE ui.item_id = cu.item_id;

    -- Step 3: Drop the 'collection_useritem' table as it is no longer needed.
    DROP TABLE IF EXISTS collection_useritem;

END $$;
