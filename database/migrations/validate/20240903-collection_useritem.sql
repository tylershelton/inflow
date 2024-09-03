DO $$
DECLARE
    v_count INTEGER;
    v_function_exists BOOLEAN;
    v_column_exists BOOLEAN;
BEGIN
    -- Validate Step 1: Check if the new table collection_useritem exists and is correctly populated
    SELECT COUNT(*) INTO v_count
    FROM collection_useritem;
    
    IF v_count = 0 THEN
        RAISE NOTICE 'Validation Failed: collection_useritem table is empty or does not exist.';
    ELSE
        RAISE NOTICE 'Validation Passed: collection_useritem table exists with % rows.', v_count;
    END IF;

    -- Validate Step 2: Check if the new view view_user_item exists
    PERFORM 1
    FROM information_schema.views
    WHERE table_schema = 'public'
      AND table_name = 'view_user_item';

    IF NOT FOUND THEN
        RAISE NOTICE 'Validation Failed: view_user_item does not exist.';
    ELSE
        RAISE NOTICE 'Validation Passed: view_user_item exists.';
    END IF;

    -- Validate Step 3: Check if the function update_item_collections exists
    SELECT EXISTS (
        SELECT 1
        FROM pg_proc
        WHERE proname = 'update_item_collections'
    ) INTO v_function_exists;

    IF NOT v_function_exists THEN
        RAISE NOTICE 'Validation Failed: Function update_item_collections does not exist.';
    ELSE
        RAISE NOTICE 'Validation Passed: Function update_item_collections exists.';
    END IF;

    -- Validate Step 4: Check if the user_item table no longer has collection_id column
    SELECT EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_name = 'user_item' AND column_name = 'collection_id'
    ) INTO v_column_exists;

    IF v_column_exists THEN
        RAISE NOTICE 'Validation Failed: collection_id column still exists in user_item table.';
    ELSE
        RAISE NOTICE 'Validation Passed: collection_id column was successfully dropped from user_item table.';
    END IF;

END $$;
