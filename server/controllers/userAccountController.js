const User = require('../models/user');

module.exports = {
  createUser: async (req, res, next) => {
    try {
      const {username, password} = req.body;
      if (Buffer.from(username, 'utf8').toString('utf8') !== username || Buffer.from(password, 'utf8').toString('utf8') !== password) {
        throw new Error('Invalid UTF-8 encoding detected');
      }

      console.log(req.body);
      const result = await User.create(req.body.username, req.body.password);
      console.log(result);
      next();
    }
    catch (err) {
      next(err);
    }
  },
};
