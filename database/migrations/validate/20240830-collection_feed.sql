DO $$
BEGIN
    -- Step 1: Ensure 'collection_id' exists in 'user_feed'
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_name = 'user_feed' AND column_name = 'collection_id'
    ) THEN
        RAISE EXCEPTION 'Column "collection_id" does not exist in "user_feed". Migration may have failed.';
    END IF;

    -- Step 2: Ensure foreign key constraint is in place
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'user_feed_collection_id_fkey'
    ) THEN
        RAISE EXCEPTION 'Foreign key constraint "user_feed_collection_id_fkey" does not exist. Migration may have failed.';
    END IF;

    -- Step 3: Ensure 'category_id' no longer exists in 'feed'
    IF EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_name = 'feed' AND column_name = 'category_id'
    ) THEN
        RAISE EXCEPTION 'Column "category_id" still exists in "feed". Migration may have failed.';
    END IF;
END $$;
