const conf     = require('../../config');
const { Pool } = require('pg');

module.exports = new Pool({
  // TODO: Handle no database endpoint being provided
  user: conf.DB.USER,
  password: conf.DB.PASSWORD,
  host: conf.DB.HOST,
  port: conf.DB.PORT,
  max: conf.DB.CONNECTIONS,
  database: conf.DB.DATABASE,
});
