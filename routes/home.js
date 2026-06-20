const express = require("express");
const router = express.Router();
const pool = require("../db");
const isAuthenticated = require("../middleware/auth");

router.get("/home", isAuthenticated, async (req, res) => {
    try {
        // Banner fetch
        const [bannerRows] = await pool.query("SELECT * FROM banners LIMIT 1");
        // Latest Collection products fetch
        const [products] = await pool.query("SELECT * FROM latest_collection WHERE status=true");
        res.render("home", {
            banner: bannerRows[0],
            products: products
        });
    }
    catch (error) {
        console.log(error);
        res.send("Server Error");
    }
});

module.exports = router;
