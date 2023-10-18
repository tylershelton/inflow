const express = require('express');
const router = express.Router();

const categoryController = require('../controllers/categoryController');

// get category list
router.get('/', categoryController.getCategories, (req, res) => {
  return res.status(200).json(res.locals.categories);
});

// get specific category
router.get('/:id', categoryController.getCategory, (req, res) => {
  return res.status(200).json(res.locals.category);
});

// create new category
router.post('/', categoryController.createCategory, (req, res) => {
  return res.status(200).json(res.locals.category);
});

// rename category
router.put('/:id', categoryController.renameCategory, (req, res) => {
  return res.status(200).json(res.locals.category);
});

// delete category
router.delete('/:id', categoryController.deleteCategory, (req, res) => {
  return res.status(200).send();
});

module.exports = router;
