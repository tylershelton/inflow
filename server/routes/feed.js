const express = require('express');
const router  = express.Router();

const feedController = require('../controllers/feedController');

// get all feeds
router.get('/', feedController.getFeeds, (req, res) => {
  return res.status(200).json(res.locals.feeds);
});

// get a specific feed
router.get('/:id', feedController.getFeed, (req, res) => {
  return res.status(200).json(res.locals.feed);
});

// subscribe to a new feed
router.post('/subscribe', feedController.subscribe, (req, res) => {
  return res.status(200).send(res.locals.feed);
});

// unsubscribe from a feed
router.delete('/:id', feedController.unsubscribe, (req, res) => {
  return res.status(200).send({ success: true });
});

// update info about a feed. updating the URL is not allowed
router.put('/:id', feedController.updateFeed, (req, res) => {
  return res.status(200).send(res.locals.feed);
});

module.exports = router;
