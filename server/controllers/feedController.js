const Feed = require('../models/feed');

module.exports = {
  subscribe: (req, res, next) => {
    import('@extractus/feed-extractor')
      .then(rss => {
        rss.extract(req.body.feedURL)
          .then(feed => {
            delete feed.entries;
            console.log(feed);
            next();
          })
          .catch(err => next(err));
      }).catch(err => next(err));
  },
};
