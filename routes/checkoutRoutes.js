const express = require("express");
const router = express.Router();

const pool = require("../db");
const isAuthenticated = require("../middleware/auth");



router.get("/checkout",isAuthenticated, async(req,res)=>{


    try{


        const user_id = req.session.user_id;


        if(!user_id){

            return res.redirect("/login");

        }



        // Fetch Address

        const [address] = await pool.query(

            "SELECT * FROM user_addresses WHERE user_id=? LIMIT 1",

            [user_id]

        );




        // Fetch Cart Products


        const [products] = await pool.query(

        `
        SELECT 
        latest_collection.*,
        cart.quantity

        FROM cart


        JOIN latest_collection

        ON cart.product_id = latest_collection.id


        WHERE cart.user_id=?

        `,

        [user_id]

        );



        res.render("checkout",{

            address:address[0],

            products:products

        });



    }


    catch(error){

        console.log(error);

        res.send("Server Error");

    }



});



module.exports = router;