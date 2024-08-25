-- Check if columns title and description exist
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_name = 'user_feed' AND column_name = 'title'
    ) THEN
        RAISE EXCEPTION 'Column "title" does not exist in table "user_feed"';
    END IF;

    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_name = 'user_feed' AND column_name = 'description'
    ) THEN
        RAISE EXCEPTION 'Column "description" does not exist in table "user_feed"';
    END IF;
END $$;

-- Check if the unique constraint exists
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM pg_constraint 
        WHERE conname = 'unique_title_per_user'
    ) THEN
        RAISE EXCEPTION 'Unique constraint "unique_title_per_user" does not exist on table "user_feed"';
    END IF;
END $$;
