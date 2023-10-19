const express = require('express');
const router  = express.Router();

const feedItemController = require('../controllers/feedItemController');

// get all feeditems in a given category
router.get('/category/:id', (req, res) => {
  // support all vs unread only
  return res.status(200).json(res.locals.feeditems);
});

// get all feeditems from a given feed
router.get('/feed/:id', (req, res) => {
  // support all vs unread only
  return res.status(200).json(res.locals.feeditems);
});

// mark a feeditem as read or unread
router.put('/:id', (req, res) => {
  return res.status(200).json(res.locals.feeditem);
});

module.exports = router;
