DO $$
BEGIN
    -- move the category_id field in the `feed` table to the
    -- `user_feed` table, and bring it in line with the new
    -- 'collection' nomenclature.
    ALTER TABLE user_feed
        ADD COLUMN IF NOT EXISTS collection_id INTEGER;

    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'user_feed_collection_id_fkey'
    ) THEN
        ALTER TABLE user_feed
            ADD CONSTRAINT user_feed_collection_id_fkey FOREIGN KEY (collection_id)
                REFERENCES collection(id) ON DELETE SET NULL;
    END IF;

    IF EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_name = 'feed' AND column_name = 'category_id'
    ) THEN
        UPDATE user_feed
            SET collection_id = (
                SELECT feed.category_id
                FROM feed
                WHERE feed.id = user_feed.feed_id
            );

        ALTER TABLE feed
            DROP COLUMN category_id;
    END IF;

END $$;
