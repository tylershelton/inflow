const conf     = require('../../config');
const { Pool } = require('pg');

module.exports = new Pool({
  // TODO: Handle no database endpoint being provided
  connectionString: conf.DB.URI,
  max: conf.DB.CONNECTIONS,
});
