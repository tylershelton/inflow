const Collection = require('../models/collection');
const Feed       = require('../models/feed');

module.exports = {
  getCollections: async (req, res, next) => {
    const collections = await Collection.getAll(req.user.id);
    res.locals.categories = collections.rows;
    return next();
  },

  getCollection: async (req, res, next) => {
    const result = await Collection.get(req.user.id, req.params.id);
    if (result) res.locals.category = result;
    // TODO: handle when no item found in db
    return next();
  },

  getContents: async (req, res, next) => {
    res.locals.contents = await Feed.getAllByCollection(req.user.id, req.params.id);
    return next();
  },

  createCollection: async (req, res, next) => {
    res.locals.category = await Collection.create(req.user.id, req.body.title);
    return next();
  },

  renameCollection: async (req, res, next) => {
    const current = await Collection.get(req.user.id, req.params.id);
    await Collection.update(req.user.id, req.params.id, {
      title: req.body.title || current.title
    });
    const result = await Collection.get(req.user.id, req.params.id);
    res.locals.category = result;
    return next();
  },

  sync: async (req, res, next) => {
    await Collection.sync(req.user.id, req.params.id);
    return next();
  },

  deleteCollection: async (req, res, next) => {
    await Collection.delete(req.user.id, req.params.id);
    return next();
  },
};
