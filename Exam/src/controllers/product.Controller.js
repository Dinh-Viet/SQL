// controllers/productController.js
const Product = require('../models/productModel');

// Function to add a new product
exports.addProduct = async (productData) => {
  const product = new Product(productData);
  return await product.save();
};

// Function to delete a product by ID
exports.deleteProduct = async (productId) => {
  return await Product.findByIdAndRemove(productId);
};
