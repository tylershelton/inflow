ALTER TABLE user_feed
DROP CONSTRAINT IF EXISTS unique_title_per_user;

ALTER TABLE user_feed
DROP COLUMN IF EXISTS title;

ALTER TABLE user_feed
DROP COLUMN IF EXISTS description;
