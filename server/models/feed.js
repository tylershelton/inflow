const pool = require('../lib/db');

module.exports = {
  create: (url, title, desc, category_id) => {
    return pool.query(`
      INSERT INTO feed (url, title, description, category_id)
      VALUES ($1, $2, $3, $4)
    `, [url, title, desc, category_id]);
  },

  delete: id => {
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

  getByURL: async url => {
    const result = await pool.query(`
      SELECT * FROM feed WHERE url = $1
    `, [url]);  
    return result.rows[0]; 
  },  

  update: (id, changes) => {
    return pool.query(`
      UPDATE feed
      SET title = $2, description = $3, category_id = $4
      WHERE id = $1
    `, [id, changes.title, changes.description, changes.category_id]);
  }
};
