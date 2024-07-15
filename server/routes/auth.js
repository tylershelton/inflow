const crypto = require('crypto');
const express = require('express');
const passport = require('passport');
const LocalStrategy = require('passport-local');
const router = express.Router();

const pool = require('../lib/db');

passport.use(new LocalStrategy(function verify(username, password, callback) {
  pool.query(
    'SELECT * FROM users WHERE username = ?',
    [ username ],
    function (err, row) {
      if (err) return callback(err);
      if (!row) return callback(null, false, { message: 'Incorrect username or password.' });

      crypto.pbkdf2(password, row.salt, 31000, 32, 'sha256', function (err, hashedPassword) {
        if (err) return callback(err);
        if (!crypto.timingSafeEqual(row.hashed_password, hashedPassword)) {
          return callback(null, false, { message: 'Incorrect username or password.' });
        }
        return callback(null, row);
      });
    });
}));

router.post('/login', passport.authenticate('local', {
  successRedirect: '/',
  failureRedirect: '/login',
}));

module.exports = router;
