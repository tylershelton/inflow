const pool   = require('../lib/db');
const format = require('pg-format');
const { DatabaseError } = require('../lib/error/errors');

const vui_columns = `
  vui.id, vui.title, vui.description, vui.url, vui.pubdate, vui.feed_id,
  vui.collection_ids, vui.read, vui.archived, vui.read_at, vui.archived_at
`;

module.exports = {
  // create: async (user_id, data) => {
  //   const client = await pool.connect();
  //   let useritem_result, item_result;
    
  //   try {
  //     await client.query('BEGIN');
  //     item_result = (await pool.query(`
  //       INSERT INTO item
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
  //       item_result.id,
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
  //     ...item_result,
  //     ...useritem_result
  //   });
  // },

  createMany: async (feed, users, items) => {
    const client = await pool.connect();

    try {
      await client.query('BEGIN');

      for (const item of items) {
        // insert item data shared by all users
        const dbitem = (await client.query(`
          INSERT INTO item
          (title, description, url, pubdate, feed_id)
          VALUES
          ($1, $2, $3, $4, $5)
          ON CONFLICT DO NOTHING
          RETURNING id
        `, [
          item.title,
          item.description,
          item.link,
          item.published,
          feed.id,
        ])).rows[0];
        
        if (!dbitem) continue;

        
        // insert per-user metadata records for each item
        // being created
        const useritems = [];
        for (const u of users) {
          useritems.push([u.user_id, dbitem.id]);
        }

        await client.query(format(`
          INSERT INTO user_item
          (user_id, item_id)
          VALUES %L
          ON CONFLICT DO NOTHING
          `, useritems));

        for (const item of useritems) {
          item.push(feed.collection_id);
        }

        await client.query(format(`
          INSERT INTO collection_useritem
            (user_id, item_id, collection_id)
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

  delete: async (user_id, item_id) => {
    const { rowCount } = await pool.query(`
      DELETE FROM user_item
      WHERE user_id = $1 AND item_id = $2
    `, [user_id, item_id]);
    return rowCount > 0 ? true : false;
  },

  get: async (user_id, item_id) => {
    try {
      const result = await pool.query(`
        SELECT ${vui_columns}
        FROM view_user_item vui
        WHERE user_id = $1 AND id = $2
      `, [user_id, item_id]);
      return result.rows[0];
    }
    catch (err) {
      throw new DatabaseError({ cause: err });
    }
  },

  getByCollection: async (user_id, collection_id, includeArchived) => {
    try {
      const params = [user_id, collection_id];
      let addendum = '';
      if (!includeArchived) {
        addendum = ' AND archived = $3';
        params.push(includeArchived);
      }
      const result = await pool.query(`
        SELECT ${vui_columns}, f.title AS feed_title 
        FROM view_user_item vui
        INNER JOIN feed f ON vui.feed_id = f.id
        WHERE vui.user_id = $1
          AND $2 = ANY(vui.collection_ids) ${addendum}
        ORDER BY vui.pubdate DESC
      `, params);
      return result.rows;
    }
    catch (err) {
      throw new DatabaseError({ cause: err });
    }
  },

  getByFeed: async (user_id, feedId, includeArchived) => {
    try {
      const params = [user_id, feedId];
      let addendum = '';
      if (!includeArchived) {
        addendum = ' AND archived = $3';
        params.push(includeArchived);
      }
      const result = await pool.query(`
        SELECT ${vui_columns}
        FROM view_user_item vui
        WHERE user_id = $1 AND feed_id = $2 ${addendum}
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
      UPDATE user_item
      SET
        archived = $2,
        collection_id = $3
      WHERE id = $1
    `, [id, changes.archived, changes.collection_id]);
  }
};
