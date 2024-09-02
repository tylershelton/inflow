-- make collections user-specific

DO $$
DECLARE
    r RECORD;
    new_id INTEGER;
BEGIN

    -- add user_id to collection table, so users can 'own' collections
    ALTER TABLE collection
    ADD COLUMN IF NOT EXISTS user_id INTEGER;

    -- remove old unique constraint on title, which would restrict a given collection
    -- name to only being used by a single user
    IF EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'public'
          AND table_name = 'collection'
          AND constraint_name = 'category_title_key'
    ) THEN
        ALTER TABLE collection
        DROP CONSTRAINT category_title_key;
    END IF;

    -- add new UNIQUE constraint to the combo of user_id and title: titles will still
    -- be enforced as unique, but on a per-user basis.
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'unique_collection_per_user'
    ) THEN
        ALTER TABLE collection
        ADD CONSTRAINT unique_collection_per_user UNIQUE (user_id, title);
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'collection_user_id_fkey'
    ) THEN
        ALTER TABLE collection
        ADD CONSTRAINT collection_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_account(id) ON DELETE CASCADE;
    END IF;

    -- re-create collection foreign keys to the new user-specific entries
    -- 1) create a temp table to map old ids to new ids
    CREATE TEMP TABLE user_specific_collections AS
    SELECT
        c.id AS old_collection_id,
        c.title AS collection_title,
        uf.user_id,
        NULL::integer AS new_collection_id
    FROM collection c
    JOIN user_feed uf ON uf.collection_id = c.id
    GROUP BY c.id, c.title, uf.user_id;

    for r IN
        SELECT usc.old_collection_id, usc.collection_title, usc.user_id
        FROM user_specific_collections usc
    LOOP
        -- create new collection records
        INSERT INTO collection (title, user_id)
        VALUES (r.collection_title, r.user_id)
        RETURNING id INTO new_id;

        -- map new id to old id
        UPDATE user_specific_collections
        SET new_collection_id = new_id
        WHERE old_collection_id = r.old_collection_id
          AND user_id = r.user_id;
    END LOOP;

    -- update foreign key references to point to new per-user collections
    UPDATE user_feed
    SET collection_id = usc.new_collection_id
    FROM user_specific_collections usc
    WHERE user_feed.collection_id = usc.old_collection_id
      AND user_feed.user_id = usc.user_id;
    
    UPDATE user_item
    SET collection_id = usc.new_collection_id
    FROM user_specific_collections usc
    WHERE user_item.collection_id = usc.old_collection_id
      AND user_item.user_id = usc.user_id;

    -- clean up old collection data
    DROP TABLE user_specific_collections;

    DELETE FROM collection
        WHERE user_id IS NULL;
    
    -- enforce a user_id value being present on all collections going forward
    ALTER TABLE collection
        ALTER COLUMN user_id SET NOT NULL;

END $$;
