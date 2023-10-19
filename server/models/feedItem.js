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
    RETURNING *
    `, arr);
    return pool.query(sql);
  },
};
