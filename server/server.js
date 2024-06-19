const express = require('express');
const app     = express();
const path    = require('path');
const conf    = require('./config');

const categoryRouter = require('./routes/category');
const feedRouter     = require('./routes/feed');
const feedItemRouter = require('./routes/feedItem');

// set up global middleware
app.use(express.json());

// handle requests for static files
app.use(express.static(path.join(__dirname, '../build')));

// api routes
app.use('/categories', categoryRouter);
app.use('/feeds', feedRouter);
app.use('/feeditems', feedItemRouter);

app.get('/', (req, res) => {
  res.status(200).sendFile('/index.html');
});

// Fallback route handler
app.use((req, res) => res.sendStatus(404));

console.log('Express server listening on', conf.EXPRESS.PORT);
app.listen(conf.EXPRESS.PORT);
