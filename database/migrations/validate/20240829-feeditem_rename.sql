DO $$
BEGIN
    -- Check if the table 'item' exists
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.tables 
        WHERE table_name = 'item'
    ) THEN
        RAISE EXCEPTION 'Table "item" does not exist. Migration may have failed.';
    END IF;

    -- Ensure 'feeditem' no longer exists
    IF EXISTS (
        SELECT 1 
        FROM information_schema.tables 
        WHERE table_name = 'feeditem'
    ) THEN
        RAISE EXCEPTION 'Table "feeditem" still exists. Migration may have failed.';
    END IF;
END $$;
