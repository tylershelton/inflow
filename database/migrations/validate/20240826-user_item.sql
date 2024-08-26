-- Check if `user_item` table exists
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.tables 
        WHERE table_name = 'user_item'
    ) THEN
        RAISE EXCEPTION 'Table "user_item" does not exist';
    END IF;
END $$;

-- Check if the `archived` column does not exist in `feeditem`
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_name = 'feeditem' AND column_name = 'archived'
    ) THEN
        RAISE EXCEPTION 'Column "archived" still exists in table "feeditem"';
    END IF;
END $$;
