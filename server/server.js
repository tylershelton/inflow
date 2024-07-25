// third-party/core library imports
const express        = require('express');
const app            = express();
const bodyParser     = require('body-parser');
const cookieParser   = require('cookie-parser');
const passport       = require('passport');
const path           = require('path');
const session        = require('express-session');

// internal imports
const conf         = require('./config');
const apiRouter    = require('./routes/api');
const errorHandler = require('./lib/error/globalHandler');

// set up global middleware
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(session({
  secret: 'such a secret',
  resave: false,
  saveUninitialized: false,
  store: new session.MemoryStore(),
  // cookie: { secure: true },
}));
app.use(passport.authenticate('session'));

// handle requests for static files
app.use(express.static(path.join(__dirname, '../build')));

app.use('/api', apiRouter);

// Catch-all route handler for serving up the client
app.get('*', (req, res) => {
  return res.status(200).sendFile(path.join(__dirname, '../build', 'index.html'));
});

// global error handler
app.use(errorHandler);

console.log('Express server listening on', conf.EXPRESS.PORT);
app.listen(conf.EXPRESS.PORT);
