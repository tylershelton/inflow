const express = require('express');
const router  = express.Router();

const { isLoggedIn } = require('../controllers/authController');
const authRouter     = require('./auth');
const categoryRouter = require('./category');
const feedRouter     = require('./feed');
const itemRouter = require('./item');

// api routes
router.use('/auth', authRouter);
router.use('/categories', isLoggedIn, categoryRouter);
router.use('/feeds', isLoggedIn, feedRouter);
router.use('/feeditems', isLoggedIn, itemRouter);

module.exports = router;
