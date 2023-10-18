const express = require('express');
const router  = express.Router();

const feedController = require('../controllers/feedController');

router.get('/', feedController.getFeeds, (req, res) => {
  return res.status(200).json(res.locals.feeds);
});

router.get('/:id', feedController.getFeed, (req, res) => {
  return res.status(200).json(res.locals.feed);
});

router.post('/subscribe', feedController.subscribe, (req, res) => {
  return res.status(200).send();
});

router.post('/unsubscribe', feedController.unsubscribe, (req, res) => {
  return res.status(200).send();
});

router.put('/:id', feedController.updateFeed, (req, res) => {
  return res.status(200).send();
});

module.exports = router;
