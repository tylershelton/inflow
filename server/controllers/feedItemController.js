const Category = require('../models/category');
const Feed = require('../models/feed');
const FeedItem = require('../models/feedItem');

module.exports = {
  deleteFeedItem: async (req, res, next) => {
    try {
      res.locals.success = await FeedItem.delete(req.user.id, req.params.id);
      return next();
    } catch (err) {
      return next(err);
    }
  },

  getFeedItem: async (req, res, next) => {
    res.locals.feeditem = await FeedItem.get(req.user.id, req.params.itemId);
    return next();
  },

  getItemsByCategory: async (req, res, next) => {
    try {
      res.locals.feeditems = await FeedItem.getByCategory(req.user.id, req.params.id, req.query.all);
      return next();
    }
    catch (err) {
      return next(err);
    }
  },

  getItemsByFeed: async (req, res, next) => {
    try {
      res.locals.feeditems = await FeedItem.getByFeed(req.user.id, req.params.id, req.query.all);
      return next();
    }
    catch (err) {
      return next(err);
    }
  },

  toggleArchived: async (req, res, next) => {
    try {
      const current = await FeedItem.get(req.user.id, req.params.id);
      await FeedItem.update(
        req.params.id, {
          archived: req.query.archived || current.category_id,
          category_id: current.category_id,
        }
      );
      res.locals.feeditem = await FeedItem.get(req.user.id, req.params.id);
      return next();
    }
    catch (err) {
      return next(err);
    }
  },
};
