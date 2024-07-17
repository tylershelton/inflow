const User = require('../models/user');

module.exports = {
  createUser: async (req, res, next) => {
    await User.create(req.body.username, req.body.password);
    return next();
  },
};
