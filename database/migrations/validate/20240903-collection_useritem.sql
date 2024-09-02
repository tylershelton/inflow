-- Verify the existence of the new table and its structure
SELECT * FROM information_schema.tables
WHERE table_name = 'collection_useritem';

-- Verify the foreign key constraints in the new table
SELECT
    tc.constraint_name, tc.table_name, kcu.column_name, 
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name 
FROM 
    information_schema.table_constraints AS tc 
    JOIN information_schema.key_column_usage AS kcu
      ON tc.constraint_name = kcu.constraint_name
    JOIN information_schema.constraint_column_usage AS ccu
      ON ccu.constraint_name = tc.constraint_name
WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='collection_useritem';

-- Verify that the collection_useritem table is correctly populated
SELECT * FROM collection_useritem;

-- Ensure 'collection_id' column has been removed from 'user_item'
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'user_item' AND column_name = 'collection_id';
