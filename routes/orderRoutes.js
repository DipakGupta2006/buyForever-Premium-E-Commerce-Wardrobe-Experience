const express = require("express");
const router = express.Router();

const pool = require("../db");
const isAuthenticated = require("../middleware/auth");



router.post("/place-order",isAuthenticated, async(req,res)=>{


    try{


        const user_id = req.session.user_id;


        if(!user_id){

            return res.redirect("/login");

        }



        // Get address

        const [address] = await pool.query(

            "SELECT * FROM user_addresses WHERE user_id=? LIMIT 1",

            [user_id]

        );



        if(address.length === 0){

            return res.send("Please add address first");

        }




        // Get cart products


        const [cart] = await pool.query(

        `
        SELECT 
        cart.product_id,
        cart.quantity,
        latest_collection.price

        FROM cart


        JOIN latest_collection

        ON cart.product_id = latest_collection.id


        WHERE cart.user_id=?

        `,

        [user_id]

        );




        if(cart.length === 0){

            return res.send("Cart is empty");

        }





        // Calculate total


        let total = 0;


        cart.forEach(item=>{


            total += Number(
                item.price.replace("₹","")
            ) * item.quantity;


        });






        // Create Order


        const [orderResult] = await pool.query(

        `
        INSERT INTO orders
        (user_id,address_id,total_amount,payment_method)

        VALUES(?,?,?,?)

        `,

        [

        user_id,

        address[0].id,

        total,

        "Cash On Delivery"

        ]

        );




        const order_id = orderResult.insertId;





        // Insert order items


        for(let item of cart){


            await pool.query(

            `
            INSERT INTO order_items
            (order_id,product_id,quantity,price)

            VALUES(?,?,?,?)

            `,


            [

            order_id,

            item.product_id,

            item.quantity,

            item.price

            ]

            );


        }





        // Empty Cart


        await pool.query(

            "DELETE FROM cart WHERE user_id=?",

            [user_id]

        );





        res.redirect("/order-success");



    }



    catch(error){


        console.log(error);

        res.send("Server Error");


    }



});

router.get("/order-success",isAuthenticated, (req, res)=>{

    res.render("order-success");

}); 


router.get("/orders",isAuthenticated, async(req,res)=>{


    try{


        const user_id = req.session.user_id;


        if(!user_id){

            return res.redirect("/login");

        }



        const [orders] = await pool.query(

        `
        SELECT 
        orders.id AS order_id,
        orders.total_amount,
        orders.payment_method,
        orders.order_status,
        orders.created_at

        FROM orders

        WHERE orders.user_id=?

        ORDER BY orders.created_at DESC

        `,

        [user_id]

        );



        res.render("orders",{

            orders:orders

        });



    }


    catch(error){

        console.log(error);

        res.send("Server Error");

    }


});


module.exports = router;