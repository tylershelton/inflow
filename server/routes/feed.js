const express = require('express');

const router = express.Router();

router.get('/', (req, res) => {
  return res.status(200).send('Here are all your feeds!');
});

module.exports = router;
