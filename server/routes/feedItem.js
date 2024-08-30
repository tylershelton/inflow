const express = require('express');
const router  = express.Router();

const feedItemController = require('../controllers/feedItemController');

router.get('/:id', feedItemController.getFeedItem, (req, res) => {
  return res.status(200).json(res.locals.feeditem);
});

// get all items in a given category
router.get('/category/:id', feedItemController.getItemsByCategory, (req, res) => {
  // TODO: support all vs unread only
  return res.status(200).json(res.locals.feeditems);
});

// get all items from a given feed
router.get('/feed/:id', feedItemController.getItemsByFeed, (req, res) => {
  // TODO: support all vs unread only
  return res.status(200).json(res.locals.feeditems);
});

// mark a item as read or unread
router.put('/:id', feedItemController.toggleArchived, (req, res) => {
  return res.status(200).json(res.locals.feeditem);
});

router.delete('/:id', feedItemController.deleteFeedItem, (req, res) => {
  if (res.locals.success) return res.sendStatus(204); // "No content"
  else return res.sendStatus(404);
});

module.exports = router;
