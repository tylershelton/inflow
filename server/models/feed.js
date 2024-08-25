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
      SELECT feed.* FROM feed
      INNER JOIN user_feed ON feed.id = user_feed.feed_id
      WHERE user_feed.user_id = $1 AND category_id = $2
    `, [user_id, category_id]);
    return result.rows;
  },

  getByURL: async url => {
    const result = await pool.query(`
      SELECT * FROM feed WHERE url = $1
    `, [url]);  
    return result.rows[0]; 
  },

  sync: async (user_id, feed_id) => {
    try {
      const feed = await module.exports.get(user_id, feed_id);
      console.log('feed:', feed);
      const rss  = await import('@extractus/feed-extractor');
      let { entries } = await rss.extract(feed.url);
      entries = entries.map(entry => {
        return [
          entry.title,
          entry.description,
          entry.link,
          entry.published,
          false, // is the item archived?
          feed.id,
          feed.category_id,
        ];
      });
      return await FeedItem.createMany(entries);
    }
    catch (err) {
      throw new AppError({ cause: err });
    }
  },

  update: async (user_id, feed_id, changes) => {
    try {
      const client = await pool.connect();
      const feed = await client.query(`
        SELECT 1 FROM user_feed uf
        WHERE uf.user_id = $1 AND uf.feed_id = $2
      `, [user_id, feed_id]);

      if (!feed.rows[0]) {
        client.release();
        throw new AppError({
          message: `User ${user_id} tried to update feed ${feed_id}, which they are not subscribed to.`,
          statusCode: 500
        });
      }

      const result = client.query(`
        UPDATE feed
        SET title = $2, description = $3, category_id = $4
        WHERE id = $1
      `, [feed_id, changes.title, changes.description, changes.category_id]);

      client.release();
      return result;
    }
    catch (err) {
      throw new DatabaseError({ cause: err });
    }
  }
};
