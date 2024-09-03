const pool = require('../lib/db');
const Item = require('./item');
const { AppError, DatabaseError } = require('../lib/error/errors');

module.exports = {
  create: async (user_id, url, title, desc, collection_id) => {
    const client = await pool.connect();
    let result;
    try {
      await client.query('BEGIN');

      const feed = (await client.query(`
        INSERT INTO feed (url, title, description)
        VALUES ($1, $2, $3)
        ON CONFLICT (url) DO UPDATE
          SET url = EXCLUDED.url
        RETURNING id;
      `, [url, title, desc])).rows[0];

      await client.query(`
        INSERT INTO user_feed (user_id, feed_id, collection_id)
        VALUES ($1, $2, $3)
        ON CONFLICT DO NOTHING
      `, [user_id, feed.id, collection_id]);

      await client.query('COMMIT');

      result = await module.exports.get(user_id, feed.id);
    }
    catch (err) {
      await client.query('ROLLBACK');
      throw new DatabaseError({ cause: err });
    }
    finally {
      client.release();
    }

    return result;
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
          uf.collection_id
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
          uf.collection_id
      FROM feed f
      INNER JOIN user_feed uf ON f.id = uf.feed_id
      WHERE uf.user_id = $1
    `, [user_id]);
  },

  getAllByCollection: async (user_id, collection_id) => {
    const result = await pool.query(`
      SELECT
        f.id,
        f.url,
        COALESCE(uf.title, f.title) AS title,
        COALESCE(uf.description, f.description) AS description,
        uf.collection_id
      FROM feed f
      INNER JOIN user_feed uf ON f.id = uf.feed_id
      WHERE uf.user_id = $1 AND uf.collection_id = $2
    `, [user_id, collection_id]);
    return result.rows;
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
      return await Item.createMany(feed, users, entries);
    }
    catch (err) {
      throw new AppError({ cause: err });
    }
  },

  update: async (user_id, feed_id, changes) => {
    const client = await pool.connect();
    try {
      await client.query('BEGIN');
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

      await client.query(`
        UPDATE user_feed
        SET title = $3, description = $4, collection_id = $5
        WHERE user_id = $1 AND feed_id = $2
      `, [user_id, feed_id, title, description, changes.collection_id]);
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
