const Item = require('../models/item');

module.exports = {
  deleteFeedItem: async (req, res, next) => {
    try {
      res.locals.success = await Item.delete(req.user.id, req.params.id);
      return next();
    } catch (err) {
      return next(err);
    }
  },

  getFeedItem: async (req, res, next) => {
    res.locals.feeditem = await Item.get(req.user.id, req.params.itemId);
    return next();
  },

  getItemsByCategory: async (req, res, next) => {
    try {
      res.locals.feeditems = await Item.getByCategory(req.user.id, req.params.id, req.query.all);
      return next();
    }
    catch (err) {
      return next(err);
    }
  },

  getItemsByFeed: async (req, res, next) => {
    try {
      res.locals.feeditems = await Item.getByFeed(req.user.id, req.params.id, req.query.all);
      return next();
    }
    catch (err) {
      return next(err);
    }
  },

  toggleArchived: async (req, res, next) => {
    try {
      const current = await Item.get(req.user.id, req.params.id);
      await Item.update(
        req.params.id, {
          archived: req.query.archived || current.archived,
          category_id: current.category_id,
        }
      );
      res.locals.feeditem = await Item.get(req.user.id, req.params.id);
      return next();
    }
    catch (err) {
      return next(err);
    }
  },
};
