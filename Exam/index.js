// server.js
const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
 const apiRoutes = require('./src/routes/api.route');
 const webRoutes = require('./src/routes/web.route');
const port = 2210;

const app = express();
app.set('view engine', 'ejs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

mongoose.connect('mongodb://localhost/product-management', {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

app.use('/api', apiRoutes);
app.use('/', webRoutes);


app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
