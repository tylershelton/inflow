const { AppError } = require('../lib/error/errors');
const Category = require('../models/category');
const Feed = require('../models/feed');
const FeedItem = require('../models/feedItem');

module.exports = {
  getFeed: async (req, res, next) => {
    try {
      res.locals.feed = await Feed.get(req.user.id, req.params.id);
      // TODO: handle when no item found in db
      next();
    }
    catch (err) {
      next(err);
    }
  },
  
  getFeeds: async (req, res, next) => {
    try {
      const result = await Feed.getAll(req.user.id);
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
      let category = await Category.getByTitle(req.body.category);
      if (!category) category = Category.create(req.body.category);
      
      const rss  = await import('@extractus/feed-extractor');
      const feed = await rss.extract(req.body.url);
      await Feed.create(
        req.user.id,
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
      await Feed.sync(req.user.id, req.params.id);
      next();
    }
    catch (err) {
      next(err);
    }
  },

  unsubscribe: async (req, res, next) => {
    try {
      await Feed.delete(req.user.id, req.params.id);
      next();
    }
    catch (err) {
      next(err);
    }
  },

  updateMetadata: async (req, res, next) => {
    try {
      // update category metadata
      let category = {id: undefined};
      if (req.body.category) {
        category = await Category.getByTitle(req.body.category);
        if (!category) category = Category.create(req.body.category);
      }

      // update feed metadata
      const current = await Feed.get(req.user.id, req.params.id);
      if (!current) throw new AppError({
        message: `User ${req.user.id} tried to update feed ${req.params.id}, which they are not subscribed to.`,
        statusCode: 500
      });
      const changes = {
        title: req.body.title || current.title,
        description: req.body.description || current.description,
        category_id: category.id || current.category_id,
      };
      await Feed.update(req.user.id, req.params.id, changes);
      res.locals.feed = await Feed.get(req.user.id, req.params.id);
      next();
    }
    catch (err) {
      next(err);
    }
  },
};
