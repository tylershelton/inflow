-- rename `feeditem` to `item`, as it will eventually track any individual page
-- resource from the internet, whether it came from an RSS feed or not

ALTER TABLE IF EXISTS feeditem
    RENAME TO item;
