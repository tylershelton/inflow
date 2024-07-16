const express      = require('express');
const app          = express();
const bodyParser   = require('body-parser');
const cookieParser = require('cookie-parser');
const passport     = require('passport');
const path         = require('path');
const session      = require('express-session');

const conf           = require('./config');
const authRouter     = require('./routes/auth');
const categoryRouter = require('./routes/category');
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

// api routes
app.use('/auth', authRouter);
app.use('/categories', categoryRouter);
app.use('/feeds', feedRouter);
app.use('/feeditems', feedItemRouter);

app.get('/', (req, res) => {
  res.status(200).sendFile('/index.html');
});

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};
  res.status(500).send(res.locals);
});

// Fallback route handler
app.use((req, res) => res.sendStatus(500));

console.log('Express server listening on', conf.EXPRESS.PORT);
app.listen(conf.EXPRESS.PORT);
