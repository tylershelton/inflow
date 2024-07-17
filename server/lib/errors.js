class AppError extends Error {
  constructor (message, statusCode) {
    super(message);
    this.statusCode = statusCode;
    // capture the stack at this exact moment, and remove
    // this constructor function's frame from it
    Error.captureStackTrace(this, this.constructor);
  }
}

module.exports = { AppError };
