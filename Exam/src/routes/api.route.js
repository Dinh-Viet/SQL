// routes/api.js
const express = require('express');
const productController = require('../controllers/productController');

const router = express.Router();

// API endpoint to add a new product
router.post('/products', async (req, res) => {
  try {
    const product = await productController.addProduct(req.body);
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: 'Failed to add product' });
  }
});

// API endpoint to delete a product by ID
router.delete('/products/:id', async (req, res) => {
  try {
    const productId = req.params.id;
    await productController.deleteProduct(productId);
    res.json({ message: 'Product deleted' });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete product' });
  }
});

module.exports = router;
