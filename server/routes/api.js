const express = require('express');
const router  = express.Router();

const { isLoggedIn } = require('../controllers/authController');

const authRouter       = require('./auth');
const collectionRouter = require('./collection');
const feedRouter       = require('./feed');
const itemRouter       = require('./item');

// api routes
router.use('/auth', authRouter);
router.use('/collections', isLoggedIn, collectionRouter);
router.use('/feeds', isLoggedIn, feedRouter);
router.use('/items', isLoggedIn, itemRouter);

module.exports = router;
