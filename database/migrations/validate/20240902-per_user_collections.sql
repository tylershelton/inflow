-- Verify that the user_id column exists and is NOT NULL
SELECT column_name, is_nullable
FROM information_schema.columns
WHERE table_name = 'collection' AND column_name = 'user_id';

-- Verify that the unique constraint on (user_id, title) exists
SELECT conname
FROM pg_constraint
WHERE conname = 'unique_collection_per_user';

-- Verify that the foreign key constraint on 'user_id' exists
SELECT conname
FROM pg_constraint
WHERE conname = 'collection_user_id_fkey';

-- Verify that there are no collections without a user_id
SELECT *
FROM collection
WHERE user_id IS NULL;

-- Verify that all collections have unique (user_id, title) combinations
SELECT user_id, title, COUNT(*)
FROM collection
GROUP BY user_id, title
HAVING COUNT(*) > 1;

-- Verify that user_feed and user_item have updated collection_id references
SELECT *
FROM user_feed uf
JOIN collection c ON uf.collection_id = c.id;

SELECT *
FROM user_item ui
JOIN collection c ON ui.collection_id = c.id;
