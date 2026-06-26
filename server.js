require("dotenv").config();
const express = require("express");
const app = express();
const session = require("express-session");
const pool = require("./db");
const path = require('path');
const crypto = require('crypto');
const port = process.env.PORT || 3000;
const bcrypt = require("bcrypt");


app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));
app.set("view engine", "ejs");
app.use(express.json());
app.use(session({
    secret: process.env.SESSION_SECRET || "keyboard cat",
    resave: false,
    saveUninitialized: false,
    cookie: { maxAge: 1000 * 60 * 60 }
}));

app.use((req, res, next) => {

    res.setHeader(
        "Cache-Control",
        "no-store, no-cache, must-revalidate, private"
    );

    res.setHeader(
        "Pragma",
        "no-cache"
    );

    res.setHeader(
        "Expires",
        "0"
    );

    next();

});

const isAuthenticated = require("./middleware/auth");

const home = require("./routes/home");
const productRoutes = require("./routes/productRoutes");
const collection = require("./routes/collection");
const wishlistRoutes = require("./routes/wishlistRoutes");
const cartRoutes = require("./routes/cartRoutes");
const profileRoutes = require("./routes/profileRoutes");
const checkoutRoutes = require("./routes/checkoutRoutes");
const orderRoutes = require("./routes/orderRoutes");
// const order_success = ")

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.get('/login', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'login.html'));
});

app.get('/register', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'register.html'));
});

app.get('/tnc', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'tnc.html'));
});

app.post("/register", async (req, res) => {
    const { username, email, password, confirm_password, terms } = req.body;

    if (!username || !email || !password || !confirm_password) {
        return res.status(400).send("Please fill all fields.");
    }
    if (password !== confirm_password) {
        return res.status(400).send("Passwords do not match.");
    }

    if (!terms) {
        return res.status(400).send("Please accept Terms & Conditions.");
    }

    try {
        const hashedPassword = await bcrypt.hash(password, 10);
        await pool.query("INSERT INTO users (username, email, password, terms_accepted) VALUES (?, ?, ?, ?)", [username, email, hashedPassword, true]);
        return res.redirect("/login");
    } catch (error) {
        if (error.code === "ER_DUP_ENTRY") {
            return res.status(400).send("Email already registered.");
        }
        console.error(error);
        return res.status(500).send("Server error while registering.");
    }
});

app.post("/login", async (req, res) => {
    const { username, password } = req.body;
    if (!username || !password) {
        return res.status(400).send("Please enter username and password.");
    }
    try {
        const [rows] = await pool.query(
            "SELECT * FROM users WHERE username = ? LIMIT 1",
            [username]
        );
        if (rows.length === 0) {
            return res.status(401).send("Invalid username or password.");
        }
        const user = rows[0];
        const isMatch = await bcrypt.compare(
            password,
            user.password
        );
        if (!isMatch) {
            return res.status(401).send("Invalid username or password.");
        }
        req.session.username = user.username;
        req.session.user_id = user.id;
        return res.redirect("/home");
    }
    catch (error) {
        console.error(error);
        return res.status(500).send("Server error while logging in.");
    }
});

app.get("/logout", (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            console.log(err);
            return res.status(500).send("Logout failed");
        }
        res.clearCookie("connect.sid");
        res.redirect("/login");
    });
});

app.use(home);

app.use(productRoutes);

app.use(collection);

app.use(wishlistRoutes);

app.use(cartRoutes);

app.use(profileRoutes);

app.use(checkoutRoutes);

app.use(orderRoutes);

app.get("/about", isAuthenticated, (req, res) => {
    res.render("about");
});

app.get("/contact", isAuthenticated, (req, res) => {
    res.render("contact");
});

app.get("/order-success", isAuthenticated, (req, res) => {
    res.render("order-success")
})


// admin code
const adminAuth = require("./middleware/adminAuth");


app.get("/admin/login", (req, res) => {
    res.render("admin/login");
});

app.post("/admin/login", async (req, res) => {
    try {
        const { email, password } = req.body;
        const [result] = await pool.query(
            "SELECT * FROM admins WHERE email=?",
            [email]
        );
        if (result.length === 0) {
            return res.send("Admin Email Not Found");
        }
        const admin = result[0];
        if (admin.password !== password) {
            return res.send("Wrong Password");
        }

        req.session.admin = {
            id: admin.id,
            email: admin.email
        };
        res.redirect("/admin/dashboard");
    }
    catch (err) {
        console.log(err);
        res.send("Database Error");
    }
});

app.get("/admin/logout", (req, res) => {
    delete req.session.admin;
    res.redirect("/admin/login");
});

app.get("/admin/dashboard", adminAuth, async (req, res) => {
    try {
        const [users] = await pool.query(
            "SELECT COUNT(*) AS totalUsers FROM users"
        );

        const [products] = await pool.query(
            "SELECT COUNT(*) AS totalProducts FROM latest_collection"
        );

        const [orders] = await pool.query(
            "SELECT COUNT(*) AS totalOrders FROM orders"
        );

        const [revenue] = await pool.query(`
            SELECT 
            SUM(
                CAST(REPLACE(total_amount,'₹','') AS DECIMAL(10,2))
            ) AS totalRevenue
            FROM orders
        `);
        res.render("admin/dashboard", {
            totalUsers: users[0].totalUsers,
            totalProducts: products[0].totalProducts,
            totalOrders: orders[0].totalOrders,
            totalRevenue: revenue[0].totalRevenue || 0
        });
    }
    catch (err) {
        console.log(err);
        res.send("Dashboard Error");
    }
});


app.get("/admin/products", adminAuth, async (req, res) => {

    try {


        const [products] = await pool.query(
            "SELECT * FROM latest_collection ORDER BY id DESC"
        );


        res.render("admin/products", {

            products: products

        });


    } catch (err) {


        console.log(err);

        res.send("Products Fetch Error");


    }


});

app.post("/admin/products/add", adminAuth, async (req, res) => {

    try {


        const {
            product_name,
            brand,
            category,
            price,
            size,
            image,
            image_1,
            image_2,
            image_3,
            image_4,
            description
        } = req.body;



        const sql = `
        INSERT INTO latest_collection
        (
            product_name,
            price,
            image,
            description,
            brand,
            category,
            size,
            image_1,
            image_2,
            image_3,
            image_4
        )

        VALUES (?,?,?,?,?,?,?,?,?,?,?)
        `;



        await pool.query(sql, [

            product_name,
            price,
            image,
            description,
            brand,
            category,
            size,
            image_1,
            image_2,
            image_3,
            image_4

        ]);



        res.redirect("/admin/products");



    } catch(err) {


        console.log(err);

        res.send("Product Add Error");


    }


});


app.get("/admin/products/delete/:id", adminAuth, async (req, res) => {
    try {
        const { id } = req.params;
        const sql = `
            DELETE FROM latest_collection
            WHERE id = ?
        `;
        await pool.query(sql, [id]);
        res.redirect("/admin/products");
    } catch (err) {
        console.log(err);
        res.send("Product Delete Error");
    }
});






app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});