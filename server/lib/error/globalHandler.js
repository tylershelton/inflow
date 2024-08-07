const { AppError } = require('./errors');

module.exports = (err, req, res, next) => {
  // server-side detailed error logging
  if (err instanceof AppError) err.serverError();
  else console.error(err.stack);

  // client-side error messaging
  const statusCode = err.statusCode || 500;
  const message = err.message || 'Internal Server Error';

  res.status(statusCode).json({
    error: {
      message: statusCode === 500
        ? 'Something went wrong'
        : message,
      code: statusCode,
    }
  });
};
