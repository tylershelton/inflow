const crypto = require('crypto');

const { DatabaseError } = require('../lib/error/errors');
const pool   = require('../lib/db');

module.exports = {
  create: async (username, password) => {
    try {
      const salt = crypto.randomBytes(16);
      return await pool.query(`
        INSERT INTO user_account
          (username, password_hash, password_salt)
        VALUES ($1, $2, $3)
      `, [
        username,
        crypto.pbkdf2Sync(password, salt, 310000, 32, 'sha256'),
        salt,
      ]);
    } catch (err) {
      throw new DatabaseError({ cause: err });
    }
  },

  get: async username => {
    try {
      const result = await pool.query(`
        SELECT * FROM user_account
        WHERE username = $1
      `, [username]);
      return result.rows[0];
    } catch (err) {
      throw new DatabaseError({ cause: err });
    }
  },
};
