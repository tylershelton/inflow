const Category = require('../models/category');
const Feed     = require('../models/feed');

module.exports = {
  getCategories: async (req, res, next) => {
    const categories = await Category.getAll();
    res.locals.categories = categories.rows;
    return next();
  },

  getCategory: async (req, res, next) => {
    const result = await Category.get(req.params.id);
    if (result) res.locals.category = result;
    // TODO: handle when no item found in db
    return next();
  },

  getContents: async (req, res, next) => {
    res.locals.contents = await Feed.getAllByCategory(req.user.id, req.params.id);
    return next();
  },

  createCategory: async (req, res, next) => {
    await Category.create(req.body.title);
    res.locals.category = await Category.getByTitle(req.body.title);
    return next();
  },

  renameCategory: async (req, res, next) => {
    const current = await Category.get(req.params.id);
    await Category.update(req.params.id, {
      title: req.body.title || current.title
    });
    const result = await Category.get(req.params.id);
    res.locals.category = result;
    return next();
  },

  sync: async (req, res, next) => {
    await Category.sync(req.params.id);
    return next();
  },

  deleteCategory: async (req, res, next) => {
    await Category.delete(req.params.id);
    return next();
  },
};
