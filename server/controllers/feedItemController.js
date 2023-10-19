const Feed = require('../models/feed');
const FeedItem = require('../models/feedItem');

module.exports = {
  getItemsByCategory: async (req, res, next) => {
    try {
      next();
    }
    catch (err) {
      next(err);
    }
  },

  getItemsByFeed: async (req, res, next) => {
    try {
      res.locals.feeditems = await Feed.getItems(req.params.id, req.query.all);
      next();
    }
    catch (err) {
      next(err);
    }
  },

  toggleArchived: async (req, res, next) => {
    try {
      next();
    }
    catch (err) {
      next(err);
    }
  },
};
