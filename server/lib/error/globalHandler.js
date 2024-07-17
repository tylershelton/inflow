module.exports = (err, req, res, next) => {
  // server-side detailed error logging
  console.error(err.stack);

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
