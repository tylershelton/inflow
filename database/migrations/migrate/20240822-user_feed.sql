BEGIN;

-- add a lookup table relating users to feeds
CREATE TABLE IF NOT EXISTS user_feed (
    user_id     integer     NOT NULL,
    feed_id     integer     NOT NULL,

    PRIMARY KEY (user_id, feed_id),
    FOREIGN KEY (user_id) REFERENCES user_account (id) ON DELETE CASCADE,
    FOREIGN KEY (feed_id) REFERENCES feed (id) ON DELETE CASCADE
);

-- assign any "orphan" feeds to the first user in the db
INSERT INTO user_feed (user_id, feed_id)
    SELECT MIN(user_account.id), feed.id
    FROM user_account CROSS JOIN feed
    WHERE NOT EXISTS (
        SELECT 1
        FROM user_feed
        WHERE user_feed.feed_id = feed.id
    )
    GROUP BY feed.id
    ORDER BY feed.id ASC;

COMMIT;
