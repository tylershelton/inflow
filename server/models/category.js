const pool = require('../lib/db');
const Feed = require('./feed');

module.exports = {
  create: title => {
    return pool.query(`
      INSERT INTO collection (title)
      VALUES ($1)
    `, [title]);
  },

  delete: id => {
    return pool.query(`
      DELETE FROM collection WHERE id = $1
    `, [id]);
  },
  
  get: async id => {
    const result = await pool.query(`
      SELECT * FROM collection WHERE id = $1
    `, [id]);
    return result.rows[0];
  },

  getAll: () => {
    return pool.query('SELECT * FROM collection');
  },

  getByTitle: async title => {
    try {
      const result = await pool.query(`
        SELECT * FROM collection WHERE title = $1
      `, [title]);
      return result.rows[0];
    }
    catch (err) {
      return err;
    }
  },

  sync: async (user_id, id) => {
    try {
      const feeds = await Feed.getAllByCollection(user_id, id);
      for (const feed of feeds) {
        await Feed.sync(feed.id);
      }
    } catch (err) {
      return err;
    }
  },

  update: (id, changes) => {
    return pool.query(`
      UPDATE collection
      SET title = $2
      WHERE id = $1
    `, [id, changes.title]);
  },
};
