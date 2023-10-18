const conf     = require('../../config');
const { Pool } = require('pg');

const pool = new Pool({
  connectionString: conf.DB.URI,
});

module.exports = {
  create: (url, title, desc) => {
    return pool.query(`
      INSERT INTO feed (url, title, description)
      VALUES ($1, $2, $3)
    `, [url, title, desc]);
  },

  deleteById: id => {
    return pool.query(`
      DELETE FROM feed WHERE id = $1
    `, [id]);
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
      SET title = $2, description = $3 
      WHERE id = $1
    `, [id, changes.title, changes.description]);
  }
};
