const pool   = require('../lib/db');
const format = require('pg-format');
const { DatabaseError } = require('../lib/error/errors');

module.exports = {
  // create: async (user_id, data) => {
  //   const client = await pool.connect();
  //   let useritem_result, feeditem_result;
    
  //   try {
  //     await client.query('BEGIN');
  //     feeditem_result = (await pool.query(`
  //       INSERT INTO feeditem
  //         (title, description, url, pubdate, feed_id, category_id)
  //       VALUES ($1, $2, $3, $4, $5, $6, $7)
  //     `, [
  //       data.title,
  //       data.description,
  //       data.url,
  //       data.pubdate,
  //       data.feed_id,
  //       data.category_id
  //     ])).rows[0];

  //     const archived_at = data.archived ? new Date() : null;
  //     useritem_result = (await pool.query(`
  //       INSERT INTO user_item
  //         (user_id, item_id, archived, archived_at)
  //       VALUES ($1, $2, $3, $4)
  //     `, [
  //       user_id,
  //       feeditem_result.id,
  //       data.archived,
  //       archived_at
  //     ])).rows[0];
  //     await client.query('COMMIT');
  //   }
  //   catch (err) {
  //     await client.query('ROLLBACK');
  //     throw new DatabaseError({ cause: err });
  //   }
  //   finally {
  //     client.release();
  //   }

  //   return ({
  //     ...feeditem_result,
  //     ...useritem_result
  //   });
  // },

  createMany: async (feed, users, items) => {
    const client = await pool.connect();

    try {
      await client.query('BEGIN');

      for (const item of items) {
        // insert item data shared by all users
        const feeditem = (await client.query(`
    INSERT INTO feeditem
          (title, description, url, pubdate, feed_id, category_id)
          VALUES
          ($1, $2, $3, $4, $5, $6)
          ON CONFLICT DO NOTHING
          RETURNING id
        `, [
          item.title,
          item.description,
          item.link,
          item.published,
          feed.id,
          feed.category_id
        ])).rows[0];
        
        if (!feeditem) continue;

        const useritems = [];
        for (const u of users) {
          useritems.push([u.user_id, feeditem.id]);
        }

        // insert per-user metadata records for each item
        // being created
        await client.query(format(`
          INSERT INTO user_item
            (user_id, item_id)
    VALUES %L
    ON CONFLICT DO NOTHING
        `, useritems));
      }

      await client.query('COMMIT');
    }
    catch (err) {
      await client.query('ROLLBACK');
      throw new DatabaseError({ cause: err });
    }
    finally {
      client.release();
    }
  },

  delete: async id => {
    const { rowCount } = await pool.query(`
      DELETE FROM feeditem
      WHERE id = $1
    `, [id]);
    return rowCount > 0 ? true : false;
  },

  get: async (user_id, item_id) => {
    try {
      const result = await pool.query(`
        SELECT * FROM view_user_item
        WHERE user_id = $1 AND id = $2
      `, [user_id, item_id]);
      return result.rows[0];
    }
    catch (err) {
      throw new DatabaseError({ cause: err });
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
      throw new DatabaseError({ cause: err });
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
      throw new DatabaseError({ cause: err });
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
