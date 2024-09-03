const pool = require('../lib/db');
const { DatabaseError } = require('../lib/error/errors');
const Feed = require('./feed');

module.exports = {
  create: async (user_id, title) => {
    try {
      return (await pool.query(`
        INSERT INTO collection (title, user_id)
        VALUES ($1, $2)
        RETURNING id, title
      `, [title, user_id])).rows[0];
    }
    catch (err) {
      throw new DatabaseError({ cause: err });
    }
  },

  delete: (user_id, id) => {
    return pool.query(`
      DELETE FROM collection
      WHERE id = $1 AND user_id = $2
    `, [id, user_id]);
  },
  
  get: async (user_id, id) => {
    const result = await pool.query(`
      SELECT id, title FROM collection
      WHERE id = $1 AND user_id = $2
    `, [id, user_id]);
    return result.rows[0];
  },

  getAll: user_id => {
    return pool.query(`
      SELECT id, title FROM collection
      WHERE user_id = $1
    `, [user_id]);
  },

  getByTitle: async (user_id, title) => {
    const result = await pool.query(`
      SELECT id, title FROM collection
      WHERE user_id = $1 AND title = $2
    `, [user_id, title]);

    return result.rows[0] || null;
  },

  sync: async (user_id, id) => {
    try {
      const feeds = await Feed.getAllByCollection(user_id, id);
      for (const feed of feeds) {
        await Feed.sync(user_id, feed.id);
      }
    } catch (err) {
      return err;
    }
  },

  update: (user_id, collection_id, changes) => {
    return pool.query(`
      UPDATE collection
      SET title = $3
      WHERE id = $1 AND user_id = $2
    `, [collection_id, user_id, changes.title]);
  },
};
