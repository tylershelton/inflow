-- Check if user_feed table exists
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'user_feed') THEN
        RAISE EXCEPTION 'Table "user_feed" does not exist';
    END IF;
END $$;

-- Check if there are no orphan feeds
DO $$
BEGIN
    IF EXISTS (
        SELECT feed.id
        FROM feed
        LEFT JOIN user_feed ON feed.id = user_feed.feed_id
        WHERE user_feed.feed_id IS NULL
    ) THEN
        RAISE EXCEPTION 'There are orphan feeds without user assignment';
    END IF;
END $$;
