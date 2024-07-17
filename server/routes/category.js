const express = require('express');
const router = express.Router();

const asyncHandler       = require('../lib/error/asyncHandler');
const categoryController = require('../controllers/categoryController');
const feedItemController = require('../controllers/feedItemController');

// get category list
router.get('/',
  asyncHandler(categoryController.getCategories),
  (req, res) => res.status(200).json(res.locals.categories),
);

// get specific category
router.get('/:id',
  asyncHandler(categoryController.getCategory),
  (req, res) => res.status(200).json(res.locals.category),
);

// get contents for a given category (feeds, individually saved pages)
router.get('/:id/contents',
  asyncHandler(categoryController.getContents),
  (req, res) => res.status(200).json(res.locals.contents),
);

router.get('/:id/sync',
  asyncHandler(categoryController.sync),
  (req, res) => res.sendStatus(200),
);

router.get('/:id/item/:itemId',
  asyncHandler(feedItemController.getFeedItem),
  (req, res) => res.status(200).json(res.locals.feeditem),
);

// create new category
router.post('/',
  asyncHandler(categoryController.createCategory),
  (req, res) => res.status(200).json(res.locals.category),
);

// rename category
router.put('/:id',
  asyncHandler(categoryController.renameCategory),
  (req, res) => res.status(200).json(res.locals.category),
);

// delete category
router.delete('/:id',
  asyncHandler(categoryController.deleteCategory),
  (req, res) => res.status(200).send({ success: true }),
);

module.exports = router;
