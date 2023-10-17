const Feed = require('../models/feed');

module.exports = {
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

  unsubscribe: (req, res, next) => {

  },

  getFeeds: (req, res, next) => {

  },

  getFeed: (req, res, next) => {

  },
};
