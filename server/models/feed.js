const conf     = require('../../config');
const { Pool } = require('pg');

const pool = new Pool({
  connectionString: conf.DB.URI
});

console.log('db uri:', conf.DB.URI);

module.exports = {
  query: (text, params, callback) => {
    return pool.query(text, params, callback);
  },

  create: (url, title, desc) => {
    return pool.query(`
      INSERT INTO feed (url, title, description)
      VALUES ($1, $2, $3)
    `, [url, title, desc]);
  },
};
