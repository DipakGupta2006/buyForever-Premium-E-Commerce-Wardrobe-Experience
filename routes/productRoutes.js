const express = require("express");
const router = express.Router();
const pool = require("../db");
const isAuthenticated = require("../middleware/auth");
// Product Details Page

router.get("/product/:id",isAuthenticated, async (req, res) => {
    try {
        const productId = req.params.id;
        const [rows] = await pool.query(
            "SELECT * FROM latest_collection WHERE id = ?",
            [productId]
        );
        if (rows.length === 0) {
            return res.send("Product not found");
        }
        res.render("product-details", {
            product: rows[0]
        });
    } 
    catch(error) {
        console.log(error);
        res.send("Server Error");
    }
});
module.exports = router;    