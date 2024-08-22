DO $$ 
BEGIN

    IF NOT EXISTS (
        SELECT 1 
        FROM pg_tables 
        WHERE tablename = 'collection'
    ) THEN
        RAISE EXCEPTION 'Table "collection" does not exist';
    END IF;

    IF EXISTS (
        SELECT 1 
        FROM pg_tables 
        WHERE tablename = 'category'
    ) THEN
        RAISE EXCEPTION 'Table "category" still exists';
    END IF;

END $$;
