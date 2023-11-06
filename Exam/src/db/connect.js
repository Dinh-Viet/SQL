const mongoose = require('mongoose');
const db_name = 'exam';

mongoose.connect('mongodb://localhost:27017', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

module.exports = mongoose;