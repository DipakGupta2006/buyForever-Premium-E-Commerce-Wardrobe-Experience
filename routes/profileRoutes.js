const express = require("express");
const router = express.Router();

const pool = require("../db");
const isAuthenticated = require("../middleware/auth");



// Profile Page

router.get("/profile",isAuthenticated, async(req,res)=>{


    try{


        const user_id = req.session.user_id;


        if(!user_id){

            return res.redirect("/login");

        }



        const [users] = await pool.query(

            "SELECT * FROM users WHERE id=?",

            [user_id]

        );



        const [address] = await pool.query(

            "SELECT * FROM user_addresses WHERE user_id=?",

            [user_id]

        );



        res.render("profile",{

            user:users[0],

            address:address[0]

        });



    }


    catch(error){

        console.log(error);

        res.send("Server Error");

    }


});





// Save Address


router.post("/profile/address",isAuthenticated, async(req,res)=>{


    const user_id=req.session.user_id;


    const {
        full_name,
        phone,
        house_no,
        street,
        city,
        state,
        pincode,
        landmark
    }=req.body;



    try{


        await pool.query(

        `
        INSERT INTO user_addresses
        (user_id,full_name,phone,house_no,street,city,state,pincode,landmark)

        VALUES(?,?,?,?,?,?,?,?,?)

        `,

        [
            user_id,
            full_name,
            phone,
            house_no,
            street,
            city,
            state,
            pincode,
            landmark
        ]

        );



        res.redirect("/profile");



    }


    catch(error){

        console.log(error);

        res.send("Server Error");

    }



});

router.post("/delete-account",isAuthenticated, async(req,res)=>{


const user_id=req.session.user_id;


await pool.query(
"DELETE FROM users WHERE id=?",
[user_id]
);


req.session.destroy();


res.redirect("/register");


});

module.exports=router;