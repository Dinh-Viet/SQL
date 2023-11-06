const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const productSchema = new Schema({
  ProductCode: {
    type: String,
    required: true,
    miLength:3,
    unique: true,
  },
  ProductName: {
    type: String,
    required: true,
  },
  ProductDate: {
    type: Date,
    required: true,
  },
  ProductOriginPrice: {
    type: Number,
    required: true,
  },
  Quantity: {
    type: Number,
    required: true,
  },
  ProductStoreCode: {
    type: String,
    required: true,
  },
});

const Product = mongoose.model('Product', productSchema);

module.exports = Product;
