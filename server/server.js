const express = require('express');
const app     = express();
const path    = require('path');
const conf    = require(path.join('../config'));

const feedRouter     = require('./routes/feed');
const categoryRouter = require('./routes/category');

// set up global middleware
app.use(express.json());

// handle requests for static files
app.use(express.static(path.join(__dirname, '../build')));

// api routes
app.use('/feeds', feedRouter);
app.use('/categories', categoryRouter);

app.get('/', (req, res) => {
  res.status(200);
});

// Fallback route handler
app.use((req, res) => res.sendStatus(404));

console.log('Express server listening on', conf.EXPRESS.PORT);
app.listen(conf.EXPRESS.PORT);
