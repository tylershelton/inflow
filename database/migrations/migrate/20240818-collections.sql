-- use a view to create an 'alias' for the Categories
-- table, as we begin the process of renaming it to
-- Collections.
CREATE VIEW collection AS
SELECT *
FROM category;
