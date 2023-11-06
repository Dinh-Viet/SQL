const express = require('express');
const router = express.Router();
const productController = require('../controllers/product.controller');

// Tuyến đường thêm sản phẩm
router.post('/add-product', productController.addProduct);

// Tuyến đường xóa sản phẩm
router.delete('/delete-product/:productCode', productController.deleteProduct);

// Tuyến đường sửa sản phẩm
router.put('/update-product/:productCode', productController.updateProduct);
module.exports = router;