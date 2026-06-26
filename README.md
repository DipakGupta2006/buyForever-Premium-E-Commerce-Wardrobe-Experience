# 🛒 buyForever - Full Stack Ecommerce Website

buyForever is a full-stack ecommerce web application built using **Node.js, Express.js, EJS, MySQL, HTML, CSS, and JavaScript**.  

The project provides a complete shopping experience for users and a powerful admin dashboard to manage products, orders, users, and website data.

---

# 🚀 Features

## 👤 User Side Features

### 🏠 Home Page
- Modern ecommerce landing page
- Product banners
- Latest collections showcase
- Product categories display
- Attractive UI design

---

### 🔐 User Authentication

- User registration
- User login/logout
- Secure user account management
- User role management (User/Admin)

---

### 🛍️ Product Browsing

Users can:

- View all products
- Browse product collections
- View product details
- See:
  - Product name
  - Brand
  - Category
  - Price
  - Description
  - Size
  - Multiple product images

---

### ❤️ Wishlist

Users can:

- Add products to wishlist
- Remove products from wishlist
- Manage favourite products

---

### 🛒 Shopping Cart

Users can:

- Add products to cart
- Manage cart items
- View total amount
- Proceed towards checkout

---

### 📦 Checkout & Orders

Users can:

- Add delivery address
- Select payment method
- Place orders
- View order details

---

### 📍 Address Management

Users can save:

- Full name
- Phone number
- House number
- Street
- City
- State
- Pincode
- Landmark


---

# 🛠️ Admin Panel Features

Admin dashboard provides complete control over ecommerce operations.

---

## 📊 Admin Dashboard

Dashboard displays dynamic statistics:

- Total Users
- Total Products
- Total Orders
- Total Revenue

Data is fetched dynamically from MySQL database.

---

# 📦 Product Management

Admin can:

- View all products
- Add new products
- Update products
- Delete products

Product information:

- Product name
- Brand
- Category
- Price
- Description
- Size
- Main image
- Additional product images
- Product status


---

# 🖼️ Product Image Management

Products support:

- Main product image
- Multiple small preview images

Images are stored using image URLs.

---

# 📋 Order Management

Admin can view:

- Order ID
- Customer details
- Delivery address
- Ordered products
- Quantity
- Total amount
- Payment method
- Order status
- Order date


---

# 👥 User Management

Admin can manage users:

- View all registered users
- View user information
- View:
  - Username
  - Email
  - Phone
  - Address
  - Role
  - Account creation date

---

# ⚙️ Settings Module

Admin settings module includes:

- Admin profile management
- Website configuration
- Store information
- Security settings

---

# 🗄️ Database Design

The project uses MySQL database.

## Main Tables:

### users

Stores user account information.

Fields:

- id
- username
- email
- password
- role
- created_at


---

### latest_collection

Stores product details.

Fields:

- id
- product_name
- price
- image
- description
- brand
- category
- size
- image_1
- image_2
- image_3
- image_4
- status


---

### wishlist

Stores user wishlist products.


---

### user_addresses

Stores delivery addresses.

Fields:

- user_id
- full_name
- phone
- house_no
- street
- city
- state
- pincode
- landmark


---

### orders

Stores customer orders.

Fields:

- user_id
- address_id
- total_amount
- payment_method
- order_status
- created_at


---

### order_items

Stores ordered product details.

Fields:

- order_id
- product_id
- quantity
- price


---

# 💻 Tech Stack

## Frontend

- HTML5
- CSS3
- JavaScript
- EJS Template Engine


## Backend

- Node.js
- Express.js


## Database

- MySQL


## Tools

- VS Code
- Git
- GitHub
- MySQL Workbench


---

# 📂 Project Structure

buyForever
│
├── server.js
│
├── package.json
│
├── database
│ └── db.js
│
├── routes
│ ├── userRoutes.js
│ └── adminRoutes.js
│
├── views
│ │
│ ├── user
│ │
│ └── admin
│
├── public
│ │
│ ├── css
│ ├── js
│ └── images
│
└── README.md



---

# 🔐 Authentication

The application includes:

- User authentication
- Admin authentication
- Role based access control

Admin dashboard is protected using authentication middleware.

---

# 📈 Future Improvements

Upcoming features:

- Payment gateway integration
- Product search
- Product filtering
- Product reviews and ratings
- Coupon system
- Email notifications
- Cloud image storage
- Advanced analytics dashboard
- JWT authentication
- Mobile responsive improvements


---

# 👨‍💻 Developer

Developed by **Dipak Gupta**

---

# ⭐ Project Status

Core ecommerce functionality and admin management system implemented.