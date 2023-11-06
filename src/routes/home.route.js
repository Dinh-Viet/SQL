const express = require("express");
const router = express.Router();
const Product = require('../models/product.model'); // Import model

router.get("/", async function(req, res) {
    try {
        // Truy vấn tất cả sản phẩm từ cơ sở dữ liệu
        const products = await Product.find();

        res.render("home/home", { products: products });
    } catch (error) {
        console.error("Lỗi truy vấn sản phẩm:", error);
        res.status(500).send("Lỗi truy vấn sản phẩm");
    }
});

module.exports = router;
