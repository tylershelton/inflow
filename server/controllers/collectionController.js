const Collection = require('../models/collection');
const Feed       = require('../models/feed');

module.exports = {
  getCategories: async (req, res, next) => {
    const categories = await Collection.getAll();
    res.locals.categories = categories.rows;
    return next();
  },

  getCategory: async (req, res, next) => {
    const result = await Collection.get(req.params.id);
    if (result) res.locals.category = result;
    // TODO: handle when no item found in db
    return next();
  },

  getContents: async (req, res, next) => {
    res.locals.contents = await Feed.getAllByCollection(req.user.id, req.params.id);
    return next();
  },

  createCategory: async (req, res, next) => {
    await Collection.create(req.body.title);
    res.locals.category = await Collection.getByTitle(req.body.title);
    return next();
  },

  renameCategory: async (req, res, next) => {
    const current = await Collection.get(req.params.id);
    await Collection.update(req.params.id, {
      title: req.body.title || current.title
    });
    const result = await Collection.get(req.params.id);
    res.locals.category = result;
    return next();
  },

  sync: async (req, res, next) => {
    await Collection.sync(req.params.id);
    return next();
  },

  deleteCategory: async (req, res, next) => {
    await Collection.delete(req.params.id);
    return next();
  },
};
