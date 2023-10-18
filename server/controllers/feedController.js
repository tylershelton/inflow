const Feed = require('../models/feed');

module.exports = {
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
  
  getFeed: async (req, res, next) => {
    try {
      const result = await Feed.getById(req.params.id);
      if (result.rows.length) res.locals.feed = result.rows[0];
      // TODO: handle when no item found in db
      next();
    }
    catch (err) {
      next(err);
    }
  },
  
  subscribe: async (req, res, next) => {
    try {
      const rss  = await import('@extractus/feed-extractor');
      const feed = await rss.extract(req.body.feedURL);
      await Feed.create(req.body.feedURL, feed.title, feed.description);
      next();
    }
    catch (err) {
      next(err);
    }
  },

  unsubscribe: async (req, res, next) => {
    try {
      await Feed.deleteById(req.params.id);
      next();
    }
    catch (err) {
      next(err);
    }
  },

  updateFeed: async (req, res, next) => {
    try {
      let current = await Feed.getById(req.params.id);
      current = current.rows[0];
      // TODO: handle when no item found in db
      const changes = {
        title: req.body.title || current.title,
        description: req.body.description || current.description,
      };
      await Feed.update(req.params.id, changes);
      next();
    }
    catch (err) {
      next(err);
    }
  },
};
