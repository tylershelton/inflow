const User = require('../models/user');

module.exports = {
  createUser: async (req, res, next) => {
    try {
      await User.create(req.body.username, req.body.password);
      return next();
    }
    catch (err) {
      return next(err);
    }
  },
};
