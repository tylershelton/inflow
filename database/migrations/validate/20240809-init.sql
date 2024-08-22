-- Check if all tables were created
DO $$ 
BEGIN

    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'category') THEN
        RAISE EXCEPTION 'Table "category" does not exist';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'feed') THEN
        RAISE EXCEPTION 'Table "feed" does not exist';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'feeditem') THEN
        RAISE EXCEPTION 'Table "feeditem" does not exist';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'user_account') THEN
        RAISE EXCEPTION 'Table "user_account" does not exist';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'user_session') THEN
        RAISE EXCEPTION 'Table "user_session" does not exist';
    END IF;

END $$;

-- Check if constraints and indexes are in place
DO $$
BEGIN

    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'session_pkey') THEN
        RAISE EXCEPTION 'Primary key constraint "session_pkey" on "user_session" is missing';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'IDX_session_expire') THEN
        RAISE EXCEPTION 'Index "IDX_session_expire" on "user_session" is missing';
    END IF;

END $$;
