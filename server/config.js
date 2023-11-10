require('dotenv').config({path: `.env.${process.env.NODE_ENV}`});

module.exports = {
  DB: {
    USER: process.env.INFLOW_DB_USER || 'inflow',
    PASSWORD: process.env.INFLOW_DB_PASS || 'testpass',
    HOST: process.env.INFLOW_DB_HOST || 'localhost',
    PORT: process.env.INFLOW_DB_PORT || 5432,
    CONNECTIONS: process.env.INFLOW_DB_CONNECTIONS || 10,
    DATABASE: process.env.INFLOW_DB_NAME || 'inflow',
  },
  EXPRESS: {
    PORT: process.env.INFLOW_EXPRESS_PORT || 3000,
  },
};
