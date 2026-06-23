const express = require("express");
const router = express.Router();

const pool = require("../db");



// Cart Page

router.get("/cart", async (req, res) => {


    try {


        const user_id = req.session.user_id;


        if (!user_id) {

            return res.redirect("/login");

        }



        const [products] = await pool.query(

            `
            SELECT 
            latest_collection.*,
            cart.quantity

            FROM latest_collection

            JOIN cart

            ON latest_collection.id = cart.product_id

            WHERE cart.user_id=?

            `,

            [user_id]

        );



        res.render("cart", {

            products: products

        });



    }


    catch (error) {

        console.log(error);

        res.send("Server Error");

    }


});

router.post("/cart/add", async (req, res) => {


    try {


        const user_id = req.session.user_id;

        const { product_id } = req.body;



        if (!user_id) {

            return res.redirect("/login");

        }



        // check product already in cart

        const [existing] = await pool.query(

            "SELECT * FROM cart WHERE user_id=? AND product_id=?",

            [user_id, product_id]

        );



        if (existing.length > 0) {


            // quantity increase

            await pool.query(

                `
            UPDATE cart 
            SET quantity = quantity + 1
            WHERE user_id=? 
            AND product_id=?
            `,

                [user_id, product_id]

            );


        }

        else {


            // new product add

            await pool.query(

                `
            INSERT INTO cart(user_id,product_id,quantity)
            VALUES(?,?,1)
            `,

                [user_id, product_id]

            );


        }



        res.redirect("/cart");


    }


    catch (error) {

        console.log(error);

        res.send("Server Error");

    }


});

router.post("/cart/remove", async (req, res) => {


    try {


        const user_id = req.session.user_id;

        const { product_id } = req.body;



        if (!user_id) {

            return res.redirect("/login");

        }



        await pool.query(

            `
            DELETE FROM cart
            WHERE user_id=? 
            AND product_id=?
            `,

            [user_id, product_id]

        );



        res.redirect("/cart");


    }


    catch (error) {


        console.log(error);

        res.send("Server Error");


    }


});

module.exports = router;