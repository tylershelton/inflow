-- add `title` and `description` columns to user_feed, which will allow users
-- to customize/individualize feed metadata. The feed's original title and
-- description values are kept intact as fields in the `feed` table, so we can
-- always revert back to default values.

DO $$
BEGIN

    ALTER TABLE user_feed
    ADD COLUMN IF NOT EXISTS title varchar(255);

    ALTER TABLE user_feed
    ADD COLUMN IF NOT EXISTS description text;

    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'unique_title_per_user'
    ) THEN
        ALTER TABLE user_feed
        ADD CONSTRAINT unique_title_per_user UNIQUE (user_id, title);
    END IF;

END $$;
