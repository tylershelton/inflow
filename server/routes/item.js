const express = require('express');
const router  = express.Router();

const itemController = require('../controllers/itemController');

router.get('/:id', itemController.getFeedItem, (req, res) => {
  if (res.locals.feeditem) return res.status(200).json(res.locals.feeditem);
  else return res.sendStatus(404);
});

// get all items in a given category
router.get('/category/:id', itemController.getItemsByCategory, (req, res) => {
  // TODO: support all vs unread only
  if (res.locals.feeditems) return res.status(200).json(res.locals.feeditems);
  else return res.status(404);
});

// get all items from a given feed
router.get('/feed/:id', itemController.getItemsByFeed, (req, res) => {
  // TODO: support all vs unread only
  return res.status(200).json(res.locals.feeditems);
});

// mark a item as read or unread
router.put('/:id', itemController.toggleArchived, (req, res) => {
  return res.status(200).json(res.locals.feeditem);
});

router.delete('/:id', itemController.deleteFeedItem, (req, res) => {
  if (res.locals.success) return res.sendStatus(204); // "No content"
  else return res.sendStatus(404);
});

module.exports = router;
