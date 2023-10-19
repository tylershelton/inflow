const conf     = require('../../config');
const { Pool } = require('pg');

module.exports = new Pool({
  connectionString: conf.DB.URI,
});
