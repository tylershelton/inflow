const { AppError } = require('../lib/error/errors');
const Collection = require('../models/collection');
const Feed = require('../models/feed');

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
      // if user specified a collection, get it from the db.
      // create the collection if it does not yet exist
      let collection = await Collection.getByTitle(req.user.id, req.body.collection);
      if (!collection) collection = await Collection.create(req.user.id, req.body.collection);
      
      const rss  = await import('@extractus/feed-extractor');
      const feed = await rss.extract(req.body.url);
      res.locals.feed = await Feed.create(
        req.user.id,
        req.body.url,
        feed.title,
        feed.description,
        collection.id
      );
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
    const processUpdate = (key, value, current) => {
      if (typeof value !== 'string') return current[key];
      return (value.length) ? value : null;
    };

    try {
      // update collection metadata
      let category = {id: undefined};
      if (req.body.category) {
        category = await Collection.getByTitle(req.body.category);
        if (!category) category = Collection.create(req.user.id, req.body.category);
      }

      // update feed metadata
      const current = await Feed.get(req.user.id, req.params.id);
      if (!current) throw new AppError({
        message: `User ${req.user.id} tried to update feed ${req.params.id}, which they are not subscribed to.`,
        statusCode: 500
      });

      const changes = {
        title: processUpdate('title', req.body?.title, current),
        description: processUpdate('description', req.body?.description, current),
        collection_id: category.id || current.category_id,
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
