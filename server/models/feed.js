const pool     = require('../lib/db');
const FeedItem = require('./feedItem');
const { AppError, DatabaseError } = require('../lib/error/errors');

module.exports = {
  create: async (user_id, url, title, desc, category_id) => {
    const client = await pool.connect();
    try {
      await client.query('BEGIN');

      const feed_result = await client.query(`
        INSERT INTO feed (url, title, description, category_id)
        VALUES ($1, $2, $3, $4)
        ON CONFLICT (url) DO UPDATE
        SET url = EXCLUDED.url
        RETURNING id;
      `, [url, title, desc, category_id]);

      await client.query(`
        INSERT INTO user_feed (user_id, feed_id)
        VALUES ($1, $2)
        ON CONFLICT DO NOTHING
      `, [user_id, feed_result.rows[0].id]);

      await client.query('COMMIT');
    }
    catch (err) {
      await client.query('ROLLBACK');
      throw new DatabaseError({ cause: err });
    }
    finally {
      client.release();
    }
  },

  delete: (user_id, feed_id) => {
    return pool.query(`
      DELETE FROM user_feed
      WHERE user_id = $1 AND feed_id = $2
    `, [user_id, feed_id]);
  },

  get: async (user_id, feed_id) => {
    const client = await pool.connect();
    let result;

    try {
      result = (await client.query(`
        SELECT
          f.id,
          f.url,
          COALESCE(uf.title, f.title) AS title,
          COALESCE(uf.description, f.description) AS description,
          f.category_id
        FROM feed f
        INNER JOIN user_feed uf ON f.id = uf.feed_id
        WHERE uf.user_id = $1 AND uf.feed_id = $2
      `, [user_id, feed_id])).rows[0];
    }
    catch (err) {
      throw new DatabaseError({ cause: err });
    }
    finally {
      client.release();
    }

    return result;
  },

  getAll: user_id => {
    return pool.query(`
      SELECT
          f.id,
          f.url,
          COALESCE(uf.title, f.title) AS title,
          COALESCE(uf.description, f.description) AS description,
          f.category_id
      FROM feed f
      INNER JOIN user_feed uf ON f.id = uf.feed_id
      WHERE uf.user_id = $1
    `, [user_id]);
  },

  getAllByCategory: async (user_id, category_id) => {
    const result = await pool.query(`
      SELECT
        f.id,
        f.url,
        COALESCE(uf.title, f.title) AS title,
        COALESCE(uf.description, f.description) AS description,
        f.category_id
      FROM feed f
      INNER JOIN user_feed uf ON f.id = uf.feed_id
      WHERE uf.user_id = $1 AND f.id IN (
        -- only present feeds that have items
        SELECT DISTINCT feeditem.feed_id
        FROM feeditem
        WHERE feeditem.category_id = $2
      )
    `, [user_id, category_id]);
    return result.rows;
  },

  getByURL: async url => {
    const result = await pool.query(`
      SELECT * FROM feed WHERE url = $1
    `, [url]);  
    return result.rows[0]; 
  },

  subscribers: async (feed_id) => {
    try {
      const result = await pool.query(`
        SELECT user_id FROM user_feed
        WHERE feed_id = $1
      `, [feed_id]);
      return result.rows;
    }
    catch (err) {
      throw new DatabaseError({ cause: err });
    }
  },

  sync: async (user_id, feed_id) => {
    try {
      const feed = await module.exports.get(user_id, feed_id);
      const rss  = await import('@extractus/feed-extractor');
      const { entries } = await rss.extract(feed.url);
      const users = await module.exports.subscribers(feed_id);
      return await FeedItem.createMany(feed, users, entries);
    }
    catch (err) {
      throw new AppError({ cause: err });
    }
  },

  update: async (user_id, feed_id, changes) => {
    const client = await pool.connect();
    try {
      const userfeed = await client.query(`
        SELECT 1 FROM user_feed uf
        WHERE uf.user_id = $1 AND uf.feed_id = $2
      `, [user_id, feed_id]);

      if (!userfeed.rows[0]) {
        client.release();
        throw new AppError({
          message: `User ${user_id} tried to update feed ${feed_id}, which they are not subscribed to.`,
          statusCode: 500
        });
      }

      const defaults = (await client.query(`
          SELECT feed.title, feed.description
          FROM feed
          WHERE id = $1
        `, [feed_id])
      ).rows[0];
      
      // if user-set metadata is identical to the feed's default value, simply erase the customized
      // record so that we stop masking the default
      const title = (changes.title === defaults.title || changes.title === '') ? null : changes.title;
      const description = (changes.description === defaults.description || changes.description === '') ? null : changes.description;

      await client.query('BEGIN');
      await client.query(`
        UPDATE feed
        SET category_id = $2
        WHERE id = $1
      `, [feed_id, changes.category_id]);

      await client.query(`
        UPDATE user_feed
        SET title = $3, description = $4
        WHERE user_id = $1 AND feed_id = $2
      `, [user_id, feed_id, title, description]);
      await client.query('COMMIT');
    }
    catch (err) {
      await client.query('ROLLBACK');
      throw new DatabaseError({ cause: err });
    }
    finally {
      client.release();
    }

    return;
  }
};
