const pool   = require('../lib/db');
const format = require('pg-format');

module.exports = {
  create: data => {
    return pool.query(`
      INSERT INTO feeditem
        (title, description, url, pubdate, archived, feed_id, category_id)
      VALUES ($1, $2, $3, $4, $5, $6, $7)
    `, [
      data.title,
      data.description,
      data.url,
      data.pubdate,
      data.archived,
      data.feed_id,
      data.category_id
    ]);
  },

  createMany: arr => {
    const sql = format(`
    INSERT INTO feeditem
      (title, description, url, pubdate, archived, feed_id, category_id)
    VALUES %L
    ON CONFLICT DO NOTHING
    `, arr);
    return pool.query(sql);
  },

  delete: async id => {
    const { rowCount } = await pool.query(`
      DELETE FROM feeditem
      WHERE id = $1
    `, [id]);
    return rowCount === 0 ? false : true;
  },

  get: async id => {
    try {
      const result = await pool.query(`
        SELECT * FROM feeditem WHERE id = $1
      `, [id]);
      return result.rows[0];
    }
    catch (err) {
      return err;
    }
  },

  getByCategory: async (categoryId, includeArchived) => {
    try {
      const params = [categoryId];
      let addendum = '';
      if (!includeArchived) {
        addendum = ' AND archived = $2';
        params.push(includeArchived);
      }
      const result = await pool.query(`
        SELECT fi.*, f.title AS feed_title 
        FROM feeditem fi INNER JOIN feed f ON fi.feed_id = f.id
        WHERE fi.category_id = $1 ${addendum}
        ORDER BY fi.pubdate DESC
      `, params);
      return result.rows;
    }
    catch (err) {
      return err;
    }
  },

  getByFeed: async (feedId, includeArchived) => {
    try {
      const params = [feedId];
      let addendum = '';
      if (!includeArchived) {
        addendum = ' AND archived = $2';
        params.push(includeArchived);
      }
      const result = await pool.query(`
        SELECT * FROM feeditem
        WHERE feed_id = $1 ${addendum}
        ORDER BY pubdate DESC
      `, params);
      return result.rows;
    }
    catch (err) {
      return err;
    }  
  },  

  update: (id, changes) => {
    return pool.query(`
      UPDATE feeditem
      SET archived = $2, category_id = $3
      WHERE id = $1
    `, [id, changes.archived, changes.category_id]);
  }
};
