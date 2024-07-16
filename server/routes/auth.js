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
    if (!user) return callback(null, false, { message: 'Incorrect username or password.' });

    crypto.pbkdf2(password, user.password_salt, 310000, 32, 'sha256', function (err, hashedPassword) {
      if (err) return callback(err);
      if (!crypto.timingSafeEqual(user.password_hash, hashedPassword)) {
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

router.post('/signup', userAccountController.createUser, (req, res) => {
  return res.sendStatus(201);
});

module.exports = router;
