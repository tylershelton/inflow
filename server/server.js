// third-party/core library imports
const express        = require('express');
const app            = express();
const bodyParser     = require('body-parser');
const cookieParser   = require('cookie-parser');
const { isLoggedIn } = require('./controllers/authController');
const passport       = require('passport');
const path           = require('path');
const session        = require('express-session');

// internal imports
const conf           = require('./config');
const authRouter     = require('./routes/auth');
const categoryRouter = require('./routes/category');
const errorHandler   = require('./lib/error/globalHandler');
const feedRouter     = require('./routes/feed');
const feedItemRouter = require('./routes/feedItem');

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

// debug session activity
if (process.env.NODE_ENV === 'development') {
  app.use((req, res, next) => {
    if (req.session)
      console.log('Sesson Data:', req.session);
    return next();
  });
}

// api routes
app.use('/auth', authRouter);
app.use('/categories', isLoggedIn, categoryRouter);
app.use('/feeds', isLoggedIn, feedRouter);
app.use('/feeditems', isLoggedIn, feedItemRouter);

app.get('/', (req, res) => {
  res.status(200).sendFile('/index.html');
});

// Fallback route handler
app.use((req, res) => res.sendStatus(404));

// global error handler
app.use(errorHandler);

console.log('Express server listening on', conf.EXPRESS.PORT);
app.listen(conf.EXPRESS.PORT);
