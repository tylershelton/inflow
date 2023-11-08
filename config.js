require('dotenv').config({path: `.env.${process.env.NODE_ENV}`});

module.exports = {
  DB: {
    URI: process.env.INFLOW_DB_URI,
    CONNECTIONS: process.env.INFLOW_DB_CONNECTIONS || 5,
  },
  EXPRESS: {
    PORT: process.env.INFLOW_EXPRESS_PORT || 3000,
  },
};
