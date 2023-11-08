module.exports = {
  DB: {
    URI: process.env.INFLOW_DB_URI,
    CONNECTIONS: process.env.INFLOW_DB_CONNECTIONS || 5,
  },
  EXPRESS: {
    PORT: 3000,
  },
};
