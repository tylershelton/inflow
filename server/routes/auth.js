const crypto        = require('crypto');
const express       = require('express');
const passport      = require('passport');
const LocalStrategy = require('passport-local');
const router        = express.Router();

const User = require('../models/user');
const userAccountController = require('../controllers/userAccountController');

passport.use(new LocalStrategy(async function verify(username, password, callback) {
  try {
    const user = await User.get(username);
    console.log('found user in db:', user);
    if (!user) return callback(null, false, { message: 'Incorrect username or password.' });

    crypto.pbkdf2(password, user.salt, 31000, 32, 'sha256', function (err, hashedPassword) {
      if (err) return callback(err);
      if (!crypto.timingSafeEqual(user.hashed_password, hashedPassword)) {
          return callback(null, false, { message: 'Incorrect username or password.' });
        }
      return callback(null, user);
    });
  }
  catch (err) {
    return callback(err);
  }
}));

router.post('/login', passport.authenticate('local', {
  failureMessage: true,
}));

module.exports = router;
