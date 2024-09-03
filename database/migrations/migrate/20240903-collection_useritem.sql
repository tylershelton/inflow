-- create many-to-many lookup table relating collections to user items.
-- this is the foundation for enabling users to place a single item
-- in multiple collections.

DO $$
BEGIN

    CREATE TABLE IF NOT EXISTS collection_useritem (
        collection_id   INTEGER     NOT NULL,
        user_id         INTEGER     NOT NULL,
        item_id         INTEGER     NOT NULL,

        PRIMARY KEY (collection_id, user_id, item_id),
        FOREIGN KEY (collection_id) REFERENCES collection(id) ON DELETE CASCADE,
        FOREIGN KEY (user_id, item_id) REFERENCES user_item(user_id, item_id) ON DELETE CASCADE
    );

    -- populate lookup table for existing collections/user items
    INSERT INTO collection_useritem (collection_id, user_id, item_id)
        SELECT ui.collection_id, ui.user_id, ui.item_id
        FROM user_item ui
        WHERE ui.collection_id IS NOT NULL
        ON CONFLICT DO NOTHING;

    DROP VIEW IF EXISTS view_user_item;

    CREATE VIEW view_user_item AS
        SELECT
            i.id,
            i.title,
            i.description,
            i.url,
            i.pubdate,
            i.feed_id,
            COALESCE(
                array_agg(cu.collection_id) FILTER (
                    WHERE cu.collection_id IS NOT NULL
                ), '{}'
            ) AS collection_ids,
            ui.user_id,
            ui.read,
            ui.archived,
            ui.read_at,
            ui.archived_at
        FROM item i
        INNER JOIN user_item ui ON i.id = ui.item_id
        LEFT JOIN collection_useritem cu
            ON  ui.user_id = cu.user_id
            AND ui.item_id = cu.item_id
        GROUP BY
            i.id, i.title, i.description, i.url, i.pubdate, i.feed_id, ui.user_id,
            ui.read, ui.archived, ui.read_at, ui.archived_at;

    ALTER TABLE user_item
    DROP COLUMN IF EXISTS collection_id;

    -- add function to handle updating collection assignments for an item. this will
    -- allow client applications to pass in an array of collection IDs, and let the
    -- database take care of conforming the collection_ids array to the new state.
    CREATE OR REPLACE FUNCTION update_item_collections (
        p_user_id INTEGER,
        p_item_id INTEGER,
        p_collection_ids INTEGER[]
    ) RETURNS VOID AS $function_body$
    DECLARE
        v_collection_id INTEGER;
    BEGIN
        -- Delete any collection associations not present in the new array
        DELETE FROM collection_useritem
        WHERE item_id = p_item_id
            AND collection_id != ALL(p_collection_ids);
        
        -- Insert any new collection associations found in the new array
        FOREACH v_collection_id IN ARRAY p_collection_ids
        LOOP
            INSERT INTO collection_useritem (collection_id, user_id, item_id)
            VALUES (v_collection_id, p_user_id, p_item_id)
            ON CONFLICT (collection_id, user_id, item_id) DO NOTHING;
        END LOOP;
    END;
    $function_body$ LANGUAGE plpgsql;
END $$;
