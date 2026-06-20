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
app.use(express.json());
app.use(session({
    secret: process.env.SESSION_SECRET || "keyboard cat",
    resave: false,
    saveUninitialized: false,
    cookie: { maxAge: 1000 * 60 * 60 }
}));
app.set("view engine", "ejs");


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
        req.session.userId = user.id;
        return res.redirect("/home");
    }
    catch (error) {
        console.error(error);
        return res.status(500).send("Server error while logging in.");
    }
});


app.get('/home', (req, res) => {
    res.render('home');
})


app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});