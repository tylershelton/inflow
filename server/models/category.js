const pool = require('../lib/db');
const Feed = require('./feed');

module.exports = {
  create: title => {
    return pool.query(`
      INSERT INTO category (title)
      VALUES ($1)
    `, [title]);
  },

  delete: id => {
    return pool.query(`
      DELETE FROM category WHERE id = $1
    `, [id]);
  },
  
  get: async id => {
    const result = await pool.query(`
      SELECT * FROM category WHERE id = $1
    `, [id]);
    return result.rows[0];
  },

  getAll: () => {
    return pool.query('SELECT * FROM category');
  },

  getByTitle: async title => {
    try {
      const result = await pool.query(`
        SELECT * FROM category WHERE title = $1
      `, [title]);
      return result.rows[0];
    }
    catch (err) {
      return err;
    }
  },

  sync: async id => {
    try {
      const feeds = await Feed.getAllByCategory(id);
      for (const feed of feeds) {
        await Feed.sync(feed.id);
      }
    } catch (err) {
      return err;
    }
  },

  update: (id, changes) => {
    return pool.query(`
      UPDATE category
      SET title = $2
      WHERE id = $1
    `, [id, changes.title]);
  },
};
