const conf     = require('../../config');
const { Pool } = require('pg');

const pool = new Pool({
  connectionString: conf.DB.URI,
});

module.exports = {
  create: name => {
    return pool.query(`
      INSERT INTO category (name)
      VALUES ($1)
    `, [name]);
  },

  delete: id => {
    return pool.query(`
      DELETE FROM category WHERE id = $1
    `, [id]);
  },

  getAll: () => {
    return pool.query('SELECT * FROM category');
  },

  get: id => {
    return pool.query(`
      SELECT * FROM category WHERE id = $1
    `, [id]);
  },

  update: (id, changes) => {
    return pool.query(`
      UPDATE category
      SET name = $2
      WHERE id = $1
    `, [id, changes.name]);
  },
};
