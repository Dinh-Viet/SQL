const Product = require('../models/product.model'); // Import model


exports.renderAllView = (req, res) => {
  res.render("");
};
// Thêm sản phẩm
const addProduct = async (req, res) => {
  try {
    const newProduct = new Product(req.body);
    await newProduct.save();
    res.status(201).json(newProduct);
  } catch (error) {
    res.status(500).json({ error: 'Failed to add product' });
  }
};

// Xóa sản phẩm
const deleteProduct = async (req, res) => {
  try {
    const productCode = req.params.productCode;
    const deletedProduct = await Product.findOneAndDelete({ ProductCode: productCode });

    if (deletedProduct) {
      res.json(deletedProduct);
    } else {
      res.status(404).json({ error: 'Product not found' });
    }
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete product' });
  }
};
const updateProduct = async (req, res) => {
    try {
      const productCode = req.params.productCode;
      const updatedProduct = await Product.findOneAndUpdate(
        { ProductCode: productCode },
        req.body,
        { new: true }
      );
  
      if (updatedProduct) {
        res.json(updatedProduct);
      } else {
        res.status(404).json({ error: 'Product not found' });
      }
    } catch (error) {
      res.status(500).json({ error: 'Failed to update product' });
    }
  };

module.exports = { addProduct, deleteProduct, updateProduct };
