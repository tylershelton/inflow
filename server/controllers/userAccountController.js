const User = require('../models/user');
const { ValidationError } = require('../lib/error/errors');

module.exports = {
  createUser: async (req, res, next) => {
    const { username, password, passwordConfirm } = req.body;
    
    if (password !== passwordConfirm)
      throw new ValidationError('Passwords do not match.');

    await User.create(username, password);
    return next();
  },
};
