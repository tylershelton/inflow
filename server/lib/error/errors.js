class AppError extends Error {
  constructor (message, statusCode, cause) {
    super(message);
    this.statusCode = statusCode;
    this.cause = cause;
    // capture the stack at this exact moment, and remove
    // this constructor function's frame from it
    Error.captureStackTrace(this, this.constructor);
  }
}

class ValidationError extends AppError {
  constructor(message = 'Validation Error') {
    super(message, 400);
  }
}

module.exports = { AppError };
