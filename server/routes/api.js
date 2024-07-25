const express = require('express');
const router  = express.Router();

const { isLoggedIn } = require('../controllers/authController');
const authRouter     = require('./auth');
const categoryRouter = require('./category');
const feedRouter     = require('./feed');
const feedItemRouter = require('./feedItem');

// api routes
router.use('/auth', authRouter);
router.use('/categories', isLoggedIn, categoryRouter);
router.use('/feeds', isLoggedIn, feedRouter);
router.use('/feeditems', isLoggedIn, feedItemRouter);

module.exports = router;
