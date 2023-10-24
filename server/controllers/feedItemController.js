const Category = require('../models/category');
const Feed = require('../models/feed');
const FeedItem = require('../models/feedItem');

module.exports = {
  getFeedItem: async (req, res, next) => {
    try {
      res.locals.feeditem = await FeedItem.get(req.params.id);
      next();
    }
    catch (err) {
      next(err);
    }
  },

  getItemsByCategory: async (req, res, next) => {
    try {
      res.locals.feeditems = await FeedItem.getByCategory(req.params.id, req.query.all);
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
      const current = await FeedItem.get(req.params.id);
      await FeedItem.update(
        req.params.id, {
          archived: req.query.archived || current.category_id,
          category_id: current.category_id,
        }
      );
      res.locals.feeditem = await FeedItem.get(req.params.id);
      next();
    }
    catch (err) {
      next(err);
    }
  },
};
