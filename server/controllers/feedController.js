const Category = require('../models/category');
const Feed = require('../models/feed');

module.exports = {
  getFeed: async (req, res, next) => {
    try {
      res.locals.feed = await Feed.get(req.params.id);
      // TODO: handle when no item found in db
      next();
    }
    catch (err) {
      next(err);
    }
  },
  
  getFeeds: async (req, res, next) => {
    try {
      const result = await Feed.getAll();
      res.locals.feeds = result.rows;
      next();
    }
    catch (err) {
      next(err);
    }
  },
  
  subscribe: async (req, res, next) => {
    try {
      // if user specified a category, get it from the db.
      // create the category if it does not yet exist
      let category = await Category.getByName(req.body.category);
      if (!category) category = Category.create(req.body.category);
      
      const rss  = await import('@extractus/feed-extractor');
      const feed = await rss.extract(req.body.url);
      await Feed.create(
        req.body.url,
        feed.title,
        feed.description,
        category.id
      );
      res.locals.feed = await Feed.getByURL(req.body.url);
      next();
    }
    catch (err) {
      next(err);
    }
  },

  sync: async (req, res, next) => {
    try {
      res.locals.newItems = await Feed.sync(req.params.id);
      next();
    }
    catch (err) {
      next(err);
    }
  },

  unsubscribe: async (req, res, next) => {
    try {
      await Feed.delete(req.params.id);
      next();
    }
    catch (err) {
      next(err);
    }
  },

  updateMetadata: async (req, res, next) => {
    try {
      let category = {id: undefined};
      if (req.body.category) {
        category = await Category.getByName(req.body.category);
        if (!category) category = Category.create(req.body.category);
      }
      const current = await Feed.get(req.params.id);
      // TODO: handle when no item found in db
      const changes = {
        title: req.body.title || current.title,
        description: req.body.description || current.description,
        category_id: category.id || current.category_id,
      };
      await Feed.update(req.params.id, changes);
      res.locals.feed = await Feed.get(req.params.id);
      next();
    }
    catch (err) {
      next(err);
    }
  },
};
