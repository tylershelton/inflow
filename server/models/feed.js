const conf     = require('../../config');
const { Pool } = require('pg');

const PG_URI = conf.DB.URI;

const pool = new Pool({
  connectionString: PG_URI
});

module.exports = {
  query: (text, params, callback) => {
    return pool.query(text, params, callback);
  }
};