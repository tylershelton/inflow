const pool = require('../lib/db');

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
  
    get: id => {
      return pool.query(`
        SELECT * FROM category WHERE id = $1
      `, [id]);
    },

  getAll: () => {
    return pool.query('SELECT * FROM category');
  },

  getByName: async name => {
    try {
      const result = await pool.query(`
        SELECT * FROM category WHERE name = $1
      `, [name]);
      return result.rows[0];
    }
    catch (err) {
      return err;
    }
  },

  getItems: async (categoryId, includeArchived) => {
    try {
      const params = [categoryId];
      let addendum = '';
      if (!includeArchived) {
        addendum = ' AND archived = $2';
        params.push(includeArchived);
      }
      const result = await pool.query(`
        SELECT * FROM feeditem
        WHERE category_id = $1
      ` + addendum, params);
      return result.rows;
    }
    catch (err) {
      return err;
    }
  },

  update: (id, changes) => {
    return pool.query(`
      UPDATE category
      SET name = $2
      WHERE id = $1
    `, [id, changes.name]);
  },
};
