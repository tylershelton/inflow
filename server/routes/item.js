const express = require('express');
const router  = express.Router();

const itemController = require('../controllers/itemController');

router.get('/:itemId', itemController.getItem, (req, res) => {
  if (res.locals.item) return res.status(200).json(res.locals.item);
  else return res.sendStatus(404);
});

// get all items in a given collection
router.get('/collection/:id', itemController.getItemsByCollection, (req, res) => {
  // TODO: support all vs unread only
  if (res.locals.items) return res.status(200).json(res.locals.items);
  else return res.status(404);
});

// get all items from a given feed
router.get('/feed/:id', itemController.getItemsByFeed, (req, res) => {
  // TODO: support all vs unread only
  return res.status(200).json(res.locals.items);
});

// mark a item as read or unread
router.put('/:id', itemController.toggleArchived, (req, res) => {
  return res.status(200).json(res.locals.item);
});

router.delete('/:id', itemController.deleteItem, (req, res) => {
  if (res.locals.success) return res.sendStatus(204); // "No content"
  else return res.sendStatus(404);
});

module.exports = router;
