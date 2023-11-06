// routes/web.js
const express = require('express');
const productController = require('../controllers/productController');

const router = express.Router();

// Route to render the list of products
router.get('/', async (req, res) => {
  const products = await Product.find();
  res.render('index', { products });
});

// Route to handle the form submission for adding a new product
router.post('/add-product', async (req, res) => {
  try {
    const product = await productController.addProduct(req.body);
    res.redirect('/');
  } catch (error) {
    res.status(500).json({ error: 'Failed to add product' });
  }
});

// Route to handle the form submission for deleting a product
router.post('/delete-product/:id', async (req, res) => {
  try {
    const productId = req.params.id;
    await productController.deleteProduct(productId);
    res.redirect('/');
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete product' });
  }
});

module.exports = router;
