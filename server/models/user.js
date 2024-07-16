const pool   = require('../lib/db');
const crypto = require('crypto');

module.exports = {
  create: (username, password) => {
    const salt = crypto.randomBytes(16);
    console.log(salt);
    return pool.query(`
      INSERT INTO user_account
        (username, password_hash, password_salt)
      VALUES ($1, $2, $3)
    `, [
      username,
      crypto.pbkdf2Sync(password, salt, 310000, 32, 'sha256'),
      salt
    ]);
  },

  get: async username => {
    const result = await pool.query(`
      SELECT * FROM user_account
      WHERE username = $1
    `, [username]);
    return result.rows[0];
  },
};
