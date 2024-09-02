const express = require('express');
const router  = express.Router();

const asyncHandler = require('../lib/error/asyncHandler');

const collectionController = require('../controllers/collectionController');
const itemController       = require('../controllers/itemController');

// get collection list
router.get('/',
  asyncHandler(collectionController.getCollections),
  (req, res) => res.status(200).json(res.locals.categories),
);

// get specific collection
router.get('/:id',
  asyncHandler(collectionController.getCollection),
  (req, res) => res.status(200).json(res.locals.category),
);

// get contents for a given collection (feeds, individually saved pages)
router.get('/:id/contents',
  asyncHandler(collectionController.getContents),
  (req, res) => res.status(200).json(res.locals.contents),
);

router.get('/:id/sync',
  asyncHandler(collectionController.sync),
  (req, res) => res.sendStatus(200),
);

router.get('/:id/item/:itemId',
  asyncHandler(itemController.getFeedItem),
  (req, res) => res.status(200).json(res.locals.feeditem),
);

// create new collection
router.post('/',
  asyncHandler(collectionController.createCollection),
  (req, res) => res.status(200).json(res.locals.category),
);

// rename collection
router.put('/:id',
  asyncHandler(collectionController.renameCollection),
  (req, res) => res.status(200).json(res.locals.category),
);

// delete collection
router.delete('/:id',
  asyncHandler(collectionController.deleteCollection),
  (req, res) => res.status(200).send({ success: true }),
);

module.exports = router;
