DO $$
BEGIN

    IF EXISTS (
        SELECT 1 
        FROM pg_tables 
        WHERE tablename = 'collection'
    ) THEN
        ALTER TABLE collection
        RENAME TO 'category';
    END IF;
    
END $$;
