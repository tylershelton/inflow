class AppError extends Error {
  constructor ({ message, statusCode, cause }) {
    super(message);
    this.statusCode = statusCode;
    this.cause = cause;
    // capture the stack at this exact moment, and remove
    // this constructor function's frame from it
    Error.captureStackTrace(this, this.constructor);
  }

  serverError () {
    console.error(this.stack);
  }
}

class DatabaseError extends AppError {
  constructor ({ message = 'Database Error', cause }) {
    super({
      message: `${message}: ${cause.message} at ${cause.where}`,
      statusCode: 500,
      cause
    });
  }
}

class ValidationError extends AppError {
  constructor ({ message = 'Validation Error', cause }) {
    super(message, 400, cause);
  }
}

module.exports = { AppError, DatabaseError, ValidationError };
