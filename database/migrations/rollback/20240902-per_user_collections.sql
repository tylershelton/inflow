DO $$
BEGIN
    -- Step 1: Drop foreign key constraint on 'user_id'
    IF EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'collection_user_id_fkey'
    ) THEN
        ALTER TABLE collection
        DROP CONSTRAINT collection_user_id_fkey;
    END IF;

    -- Step 2: Drop unique constraint on (user_id, title)
    IF EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'unique_collection_per_user'
    ) THEN
        ALTER TABLE collection
        DROP CONSTRAINT unique_collection_per_user;
    END IF;

    -- Step 3: Restore the old unique constraint on title (category_title_key)
    ALTER TABLE collection
        ADD CONSTRAINT category_title_key UNIQUE (title);

    -- Step 4: Remove user_id column from collection table
    ALTER TABLE collection
        DROP COLUMN IF EXISTS user_id;

    -- Step 5: Re-create the original collection entries and update foreign key references
    CREATE TEMP TABLE original_collections AS
    SELECT DISTINCT
        collection.title AS collection_title,
        MIN(collection.id) AS original_id
    FROM collection
    GROUP BY collection.title;

    -- Update user_feed to reference original collection ids
    UPDATE user_feed uf
    SET collection_id = oc.original_id
    FROM original_collections oc
    WHERE uf.collection_id = oc.original_id;

    -- Update user_item to reference original collection ids
    UPDATE user_item ui
    SET collection_id = oc.original_id
    FROM original_collections oc
    WHERE ui.collection_id = oc.original_id;

    -- Delete duplicate collection entries
    DELETE FROM collection
    WHERE id NOT IN (SELECT original_id FROM original_collections);

    -- Clean up temporary table
    DROP TABLE IF EXISTS original_collections;

END $$;
