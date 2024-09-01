DO $$
BEGIN
    -- Step 1: Ensure 'collection_id' exists in 'user_item'
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_name = 'user_item' AND column_name = 'collection_id'
    ) THEN
        RAISE EXCEPTION 'Column "collection_id" does not exist in "user_item". Migration may have failed.';
    END IF;

    -- Step 2: Ensure foreign key constraint is in place
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'user_item_collection_id_fkey'
    ) THEN
        RAISE EXCEPTION 'Foreign key constraint "user_item_collection_id_fkey" does not exist. Migration may have failed.';
    END IF;

    -- Step 3: Ensure 'category_id' no longer exists in 'item'
    IF EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_name = 'item' AND column_name = 'category_id'
    ) THEN
        RAISE EXCEPTION 'Column "category_id" still exists in "item". Migration may have failed.';
    END IF;

    -- Step 4: Check if 'view_user_item' has been updated correctly
    IF EXISTS (
        SELECT 1
        FROM information_schema.views
        WHERE table_name = 'view_user_item'
    ) THEN
        PERFORM 1;  -- Do nothing, view exists
    ELSE
        RAISE EXCEPTION 'View "view_user_item" does not exist. Migration may have failed.';
    END IF;
END $$;
