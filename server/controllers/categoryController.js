const Category = require('../models/category');

module.exports = {
  getCategories: async (req, res, next) => {
    try {
      const categories = await Category.getAll();
      res.locals.categories = categories.rows;
      next();
    }
    catch (err) {
      next(err);
    }
  },

  getCategory: async (req, res, next) => {
    try {
      const result = await Category.get(req.params.id);
      if (result.rows.length) res.locals.category = result.rows[0];
      // TODO: handle when no item found in db
      next();
    }
    catch (err) {
      next(err);
    }
  },

  createCategory: async (req, res, next) => {
    try {
      await Category.create(req.body.name);
      const result = await Category.get(req.body.name);
      res.locals.category = result.rows[0];
      next();
    }
    catch (err) {
      next(err);
    }
  },

  renameCategory: async (req, res, next) => {
    try {
      let current = await Category.get(req.params.id);
      current = current.rows[0];
      await Category.update(req.params.id, {
        name: req.body.name || current.name
      });
      const result = await Category.get(req.params.id);
      res.locals.category = result.rows[0];
      next();
    }
    catch (err) {
      next(err);
    }
  },

  deleteCategory: async (req, res, next) => {
    try {
      await Category.delete(req.params.id);
      next();
    }
    catch (err) {
      next(err);
    }
  },
};
