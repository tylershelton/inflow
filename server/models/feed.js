const conf     = require('../../config');
const { Pool } = require('pg');

const pool = new Pool({
  connectionString: conf.DB.URI,
});

module.exports = {
  create: (url, title, desc) => {
    return pool.query(`
      INSERT INTO feed (url, title, description, category_id)
      VALUES ($1, $2, $3, $4)
    `, [url, title, desc, category_id]);
  },

  deleteById: id => {
    return pool.query(`
      DELETE FROM feed WHERE id = $1
    `, [id]);
  },

  get: async id => {
    try {
      const result = await pool.query(`
        SELECT * FROM feed WHERE id = $1
      `, [id]);
      return result.rows[0];
    }
    catch (err) {
      return err;
    }
  },

  getAll: () => {
    return pool.query('SELECT * FROM feed');
  },

  getById: id => {
    return pool.query(`
      SELECT * FROM feed WHERE id = $1
    `, [id]);
  },

  update: (id, changes) => {
    return pool.query(`
      UPDATE feed
      SET title = $2, description = $3, category_id = $4
      WHERE id = $1
    `, [id, changes.title, changes.description, changes.category_id]);
  }
};
