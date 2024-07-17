// asyncHandler.js
// exports a middleware function that wraps another async 
// middleware function, and handles its error routing. This
// removes the need to repetitively write try/catch blocks
// throughout controller functions, and the like.
module.exports = fn => (req, res, next) => {
  Promise.resolve(fn(req, res, next)).catch(next);
};
