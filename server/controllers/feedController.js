const Feed = require('../models/feed');

module.exports = {
  subscribe: (req, res, next) => {
    import('@extractus/feed-extractor')
      .then(rss => {
        rss.extract(req.body.feedURL)
          .then(feed => {
            Feed.create(req.body.feedURL, feed.title, feed.description)
              .then(dbResult => {
                console.log(dbResult);
                next();
              })
              .catch(err => next(err));
          })
          .catch(err => next(err));
      }).catch(err => next(err));
  },

  unsubscribe: (req, res, next) => {

  },

  getFeeds: (req, res, next) => {

  },

  getFeed: (req, res, next) => {

  },
};
