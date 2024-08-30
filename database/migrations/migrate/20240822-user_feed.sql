BEGIN;

-- add a lookup table relating users to feeds
CREATE TABLE IF NOT EXISTS user_feed (
    user_id     integer     NOT NULL,
    feed_id     integer     NOT NULL,

    PRIMARY KEY (user_id, feed_id),
    FOREIGN KEY (user_id) REFERENCES user_account (id) ON DELETE CASCADE,
    FOREIGN KEY (feed_id) REFERENCES feed (id) ON DELETE RESTRICT
);

-- assign all feeds to everyone in the db, since they were shared before
INSERT INTO user_feed (user_id, feed_id)
    SELECT user_account.id, feed.id
    FROM user_account CROSS JOIN feed;

COMMIT;
