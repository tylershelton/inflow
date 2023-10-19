const format = require('pg-format');
const pool     = require('../lib/db');
const FeedItem = require('./feedItem');

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

  getAllByCategory: async category_id => {
    const result = await pool.query(`
      SELECT * FROM feed WHERE category_id = $1
    `, [category_id]);
    return result.rows;
  },

  getByURL: async url => {
    const result = await pool.query(`
      SELECT * FROM feed WHERE url = $1
    `, [url]);  
    return result.rows[0]; 
  },

  getItems: async (feedId, includeArchived) => {
    try {
      const params = [feedId];
      let addendum = '';
      if (!includeArchived) {
        addendum = ' AND archived = $2';
        params.push(includeArchived);
      }  
      const result = await pool.query(`
        SELECT * FROM feeditem
        WHERE feed_id = $1
      ` + addendum, params);  
      return result.rows;
    }  
    catch (err) {
      return err;
    }  
  },  

  sync: async id => {
    try {
      const feed = await module.exports.get(id);
      const rss  = await import('@extractus/feed-extractor');
      let { entries } = await rss.extract(feed.url);
      entries = entries.map(entry => {
        return [
          entry.title,
          entry.description,
          entry.link,
          entry.published,
          false, // is the item archived?
          feed.id,
          feed.category_id,
        ];
      });
      const result = await FeedItem.createMany(entries);
      return result.rows;
    }
    catch (err) {
      return err;
    }
  },

  update: (id, changes) => {
    return pool.query(`
      UPDATE feed
      SET title = $2, description = $3, category_id = $4
      WHERE id = $1
    `, [id, changes.title, changes.description, changes.category_id]);
  }
};
