DO $$
BEGIN
    -- Check if the table 'item' exists and 'feeditem' does not already exist
    IF EXISTS (
        SELECT 1
        FROM information_schema.tables 
        WHERE table_name = 'item'
    ) AND NOT EXISTS (
        SELECT 1
        FROM information_schema.tables 
        WHERE table_name = 'feeditem'
    ) THEN
        -- Rename the table back to 'feeditem'
        ALTER TABLE item
            RENAME TO feeditem;
    END IF;
END $$;
