const express = require('express');
const router = express.Router();

const categoryController = require('../controllers/categoryController');
const feedItemController = require('../controllers/feedItemController');

// get category list
router.get('/', categoryController.getCategories, (req, res) => {
  return res.status(200).json(res.locals.categories);
});

// get specific category
router.get('/:id', categoryController.getCategory, (req, res) => {
  return res.status(200).json(res.locals.category);
});

// get contents for a given category (feeds, individually saved pages)
router.get('/:id/contents', categoryController.getContents, (req, res) => {
  return res.status(200).json(res.locals.contents);
});

router.get('/:id/sync', categoryController.sync, (req, res) => {
  return res.status(200);
});

router.get('/:id/item/:itemId', feedItemController.getFeedItem, (req, res) => {
  return res.status(200).json(res.locals.feeditem);
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
  return res.status(200).send({ success: true });
});

module.exports = router;
