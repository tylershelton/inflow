DO $$
BEGIN
    -- Step 1: Add 'category_id' back to 'feed'
    ALTER TABLE feed
        ADD COLUMN IF NOT EXISTS category_id INTEGER;

    -- Step 2: Repopulate 'category_id' in 'feed' from 'user_feed.collection_id'
    IF EXISTS (
        SELECT 1
        FROM information_schema.columns 
        WHERE table_name = 'user_feed' AND column_name = 'collection_id'
    ) THEN
        UPDATE feed
        SET category_id = (
            SELECT collection_id
            FROM user_feed
            WHERE user_feed.feed_id = feed.id
        );
    END IF;

    -- Step 3: Drop foreign key constraint from 'user_feed'
    IF EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'user_feed_collection_id_fkey'
    ) THEN
        ALTER TABLE user_feed
            DROP CONSTRAINT user_feed_collection_id_fkey;
    END IF;

    -- Step 4: Drop 'collection_id' column from 'user_feed'
    ALTER TABLE user_feed
        DROP COLUMN IF EXISTS collection_id;
END $$;
