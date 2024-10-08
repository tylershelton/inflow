const Item = require('../models/item');

module.exports = {
  deleteItem: async (req, res, next) => {
    try {
      res.locals.success = await Item.delete(req.user.id, req.params.id);
      return next();
    } catch (err) {
      return next(err);
    }
  },

  getItem: async (req, res, next) => {
    res.locals.item = await Item.get(req.user.id, req.params.itemId);
    return next();
  },

  getItemsByCollection: async (req, res, next) => {
    try {
      res.locals.items = await Item.getByCollection(req.user.id, req.params.id, req.query.all);
      return next();
    }
    catch (err) {
      return next(err);
    }
  },

  getItemsByFeed: async (req, res, next) => {
    try {
      res.locals.items = await Item.getByFeed(req.user.id, req.params.id, req.query.all);
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
        req.user.id,
        req.params.id, {
          archived: !current.archived,
          collection_ids: current.collection_ids,
        }
      );
      res.locals.item = await Item.get(req.user.id, req.params.id);
      return next();
    }
    catch (err) {
      return next(err);
    }
  },
};
