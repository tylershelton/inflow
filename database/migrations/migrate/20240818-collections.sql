-- modify the category table, updating it to the new
-- data model for inflow, in which categories are most
-- analogous to collections.

DO $$
BEGIN

    IF EXISTS (
        SELECT 1
        FROM pg_tables
        WHERE tablename = 'category'
    ) THEN
        ALTER TABLE category
        RENAME TO collection;
    END IF;

END $$;
