const express = require('express');
const router  = express.Router();

const feedController = require('../controllers/feedController');

router.get('/', (req, res) => {
  return res.status(200).send('Here are all your feeds!');
});

router.post('/subscribe', feedController.subscribe, (req, res) => {
  return res.status(200).send();
});

module.exports = router;
