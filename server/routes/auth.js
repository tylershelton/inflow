const crypto        = require('crypto');
const express       = require('express');
const passport      = require('passport');
const LocalStrategy = require('passport-local');
const router        = express.Router();

const asyncHandler  = require('../lib/error/asyncHandler');
const User = require('../models/user');
const userAccountController = require('../controllers/userAccountController');

// authenticate login attempts
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

// persist user info in the login session
passport.serializeUser(function (user, callback) {
  process.nextTick(function () {
    callback(null, { id: user.id, username: user.name });
  });
});

passport.deserializeUser(function (user, callback) {
  process.nextTick(function () {
    return callback(null, user);
  });
});

router.post('/login', passport.authenticate('local', {
  failureMessage: true,
}), (req, res) => res.end());

router.post('/logout', (req, res, next) => {
  req.logout( (err) => {
    if (err) return next(err);
    res.redirect('/');
  });
});

router.post('/signup',
  asyncHandler(userAccountController.createUser),
  (req, res) => res.sendStatus(201),
);

module.exports = router;
