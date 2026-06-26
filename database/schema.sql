CREATE DATABASE add2Kart;
USE add2Kart;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    terms_accepted BOOLEAN DEFAULT false,
    role ENUM('user','admin') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
SELECT * FROM users;

CREATE TABLE banners(
    id INT AUTO_INCREMENT PRIMARY KEY,
    image VARCHAR(255) NOT NULL
);

INSERT INTO banners(image) VALUES(
	'https://images.meesho.com/images/marketing/1767796583251.webp'
);

SELECT * FROM banners;

CREATE TABLE latest_collection(
	id INT AUTO_INCREMENT PRIMARY KEY,
	product_name VARCHAR(100),
	price VARCHAR(15),
	image VARCHAR(255),
	status BOOLEAN DEFAULT true
);


INSERT INTO latest_collection(product_name, price, image) VALUES
('Women’s Shirt | Premium Chiffon Allover Print ', '₹499', 'https://m.media-amazon.com/images/I/61QPfwWu-JL._SY741_.jpg'),
('Peter England Mens Regular Fit Insignia Half ', '₹359', 'https://m.media-amazon.com/images/I/81V9Cw7P4tL._SX569_.jpg'),
('Style Quotient Women Printed top with Neck tie-up', '₹299', 'https://m.media-amazon.com/images/I/51GOHZhtU8L.jpg'),
('XYXX Accent Mens Solid Cotton Polo T Shirt ', '₹269', 'https://m.media-amazon.com/images/I/613BIUZxSnL._SY741_.jpg'),
('MIZAGO Womens Top Pastel Pink Black Georgette', '₹399', 'https://m.media-amazon.com/images/I/612iFL9i1tL._AC_CR0%2C0%2C0%2C0_SX615_SY462_.jpg'),
('Pure Cotton Half Sleeves Regular Fit Plain Solid', '₹589', 'https://m.media-amazon.com/images/I/71Jl449dx5L._SY741_.jpg'),
('Leriya Fashion Womens V-Neck Floral Print Ruffle', '₹599', 'https://m.media-amazon.com/images/I/61L24awnI5L._SY741_.jpg'),
('Lymio Polo T Shirt for Men || T Shirt for Man', '₹499', 'https://m.media-amazon.com/images/I/71faeST1ckL._SY741_.jpg'),
('DHARM CREATIONS Women Cotton Rayon Kurti Pant', '₹699', 'https://rukminim1.flixcart.com/image/1536/1536/xif0q/ethnic-set/z/y/5/xxl-nirali-dharm-creations-original-imahz6z3drqrky7k.jpeg?q=90'),
('KOTTY Mens Regular Classic Design with Stylish', '₹389', 'https://m.media-amazon.com/images/I/61VdeIk1OcL._SY741_.jpg'),
('Men’s Baggy Fit Jeans Loose Fit High-Rise Denim', '₹329', 'https://m.media-amazon.com/images/I/61TXmRd7voL._SX569_.jpg'),
('Dream Beauty Fashion Womens Collared Neck Long', '₹389', 'https://m.media-amazon.com/images/I/51Rwb7EAb6L._SY741_.jpg');

SELECT * FROM latest_collection;

ALTER TABLE latest_collection
ADD COLUMN description TEXT,
ADD COLUMN brand VARCHAR(100),
ADD COLUMN category VARCHAR(100),
ADD COLUMN size VARCHAR(100),
ADD COLUMN image_1 VARCHAR(255),
ADD COLUMN image_2 VARCHAR(255),
ADD COLUMN image_3 VARCHAR(255),
ADD COLUMN image_4 VARCHAR(255);


UPDATE latest_collection SET
description = ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!',
brand = 'Fashion Brand',
category = 'Women Wear',
size = 'S,M,L,XL',
image_1 = 'https://m.media-amazon.com/images/I/81okArZZExL._SY741_.jpg',
image_2 = 'https://m.media-amazon.com/images/I/71P95us0-gL._SY741_.jpg',
image_3 = 'https://m.media-amazon.com/images/I/81o2fHckeOL._SY741_.jpg',
image_4 = 'https://m.media-amazon.com/images/I/71zI4bGqGuL._SY741_.jpg'
WHERE id = 1;

UPDATE latest_collection SET
description = ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!',
brand = 'Style Quotient',
category = 'Men Wear',
size = 'S,M,L,XL',
image_1 = 'https://m.media-amazon.com/images/I/818hJYSQBmL._SX569_.jpg',
image_2 = 'https://m.media-amazon.com/images/I/91C5IKOvvQL._SX569_.jpg',
image_3 = 'https://m.media-amazon.com/images/I/91Cehu+rhCL._SX569_.jpg',
image_4 = 'https://m.media-amazon.com/images/I/61c-ksExbML._SX569_.jpg'
WHERE id = 2;


UPDATE latest_collection SET
description = ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!',
brand = 'Style Quotient',
category = 'Women Wear',
size = 'S,M,L,XL',
image_1 = 'https://m.media-amazon.com/images/I/612On96WDXL._SY741_.jpg',
image_2 = 'https://m.media-amazon.com/images/I/61ctAwUoA0L._SY741_.jpg',
image_3 = 'https://m.media-amazon.com/images/I/71eA4EH8IsL._SY741_.jpg',
image_4 = 'https://m.media-amazon.com/images/I/61Q64GVKFTL._SY741_.jpg'
WHERE id = 3;


UPDATE latest_collection SET
description = ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!',
brand = 'Style Quotient',
category = 'Men Wear',
size = 'S,M,L,XL',
image_1 = 'https://m.media-amazon.com/images/I/81M8b3Bam3L._SY741_.jpg',
image_2 = 'https://m.media-amazon.com/images/I/91Br1nL-GsL._SY741_.jpg',
image_3 = 'https://m.media-amazon.com/images/I/71c+SNaD6UL._SY741_.jpg',
image_4 = 'https://m.media-amazon.com/images/I/71c+SNaD6UL._SY741_.jpg'
WHERE id = 4;

UPDATE latest_collection SET
description = ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!',
brand = 'Style Quotient',
category = 'Women Wear',
size = 'S,M,L,XL',
image_1 = 'https://m.media-amazon.com/images/I/71F89p4-3tL._SY741_.jpg',
image_2 = 'https://m.media-amazon.com/images/I/71oSuuoLbDL._SY741_.jpg',
image_3 = 'https://m.media-amazon.com/images/I/81HuJNfOMrL._SY741_.jpg',
image_4 = 'https://m.media-amazon.com/images/I/71EbIDHkm1L._SY741_.jpg'
WHERE id = 5;


UPDATE latest_collection SET
description = ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!',
brand = 'Style Quotient',
category = 'Men Wear',
size = 'S,M,L,XL',
image_1 = 'https://m.media-amazon.com/images/I/51iFm3CyZJL._SX679_.jpg',
image_2 = 'https://m.media-amazon.com/images/I/51tVWf1S4kL._SY741_.jpg',
image_3 = 'https://m.media-amazon.com/images/I/61gNU7ahz9L._SY741_.jpg',
image_4 = 'https://m.media-amazon.com/images/I/71BX58UAYqL._SY741_.jpg'
WHERE id = 6;

UPDATE latest_collection SET
description = ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!',
brand = 'Style Quotient',
category = 'Women Wear',
size = 'S,M,L,XL',
image_1 = 'https://m.media-amazon.com/images/I/61BohCkM+GL._SY741_.jpg',
image_2 = 'https://m.media-amazon.com/images/I/61fIUv+NnqL._SY741_.jpg',
image_3 = 'https://m.media-amazon.com/images/I/61xghpckw-L._SY741_.jpg',
image_4 = 'https://m.media-amazon.com/images/I/81iK-s4GF4L._SX679_.jpg'
WHERE id = 7;

UPDATE latest_collection SET
description = ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!',
brand = 'Style Quotient',
category = 'Men Wear',
size = 'S,M,L,XL',
image_1 = 'https://m.media-amazon.com/images/I/71JrjzxjNFL._SY741_.jpg',
image_2 = 'https://m.media-amazon.com/images/I/71m-jW6K44L._SY741_.jpg',
image_3 = 'https://m.media-amazon.com/images/I/81ETzrNPF9L._SY741_.jpg',
image_4 = 'https://m.media-amazon.com/images/I/81TmR8yh1kL._SY741_.jpg'
WHERE id = 8;

UPDATE latest_collection SET
description = ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!',
brand = 'Style Quotient',
category = 'Women Wear',
size = 'S,M,L,XL',
image_1 = 'https://m.media-amazon.com/images/I/61BohCkM+GL._SY741_.jpg',
image_2 = 'https://m.media-amazon.com/images/I/61fIUv+NnqL._SY741_.jpg',
image_3 = 'https://m.media-amazon.com/images/I/61xghpckw-L._SY741_.jpg',
image_4 = 'https://m.media-amazon.com/images/I/81iK-s4GF4L._SX679_.jpg'
WHERE id = 9;

UPDATE latest_collection SET
description = ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!',
brand = 'Style Quotient',
category = 'Men Wear',
size = 'S,M,L,XL',
image_1 = 'https://m.media-amazon.com/images/I/61WKqzR3iLL._SY741_.jpg',
image_2 = 'https://m.media-amazon.com/images/I/61lbyTgrT6L._SY741_.jpg',
image_3 = 'https://m.media-amazon.com/images/I/61wpKJNFVhL._SY741_.jpg',
image_4 = 'https://m.media-amazon.com/images/I/61gOlrb4KzL._SY741_.jpg'
WHERE id = 10;

UPDATE latest_collection SET
description = ' Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!',
brand = 'Style Quotient',
category = 'Men Wear',
size = 'S,M,L,XL',
image_1 = 'https://m.media-amazon.com/images/I/61WKqzR3iLL._SY741_.jpg',
image_2 = 'https://m.media-amazon.com/images/I/61lbyTgrT6L._SY741_.jpg',
image_3 = 'https://m.media-amazon.com/images/I/61wpKJNFVhL._SY741_.jpg',
image_4 = 'https://m.media-amazon.com/images/I/61gOlrb4KzL._SY741_.jpg'
WHERE id = 11;

UPDATE latest_collection SET
description = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!',
brand = 'Style Quotient',
category = 'Men Wear',
size = 'S,M,L,XL',
image_1 = 'https://m.media-amazon.com/images/I/51pDInaWNLL._SY741_.jpg',
image_2 = 'https://m.media-amazon.com/images/I/51pDInaWNLL._SY741_.jpg',
image_3 = 'https://m.media-amazon.com/images/I/41Z1vH1XMSL._SY741_.jpg',
image_4 = 'https://m.media-amazon.com/images/I/51Rwb7EAb6L.jpg'
WHERE id = 12;

INSERT INTO latest_collection(product_name, price, image, description, brand, category, size, image_1, image_2, image_3, image_4) VALUES
('MARUTI FASHION HOUSE Lehenga Choli Draped Lehenga Saree Set For Womens And Girls Ready To Wear Hevay Chinon', '₹3999', 'https://m.media-amazon.com/images/I/71bGaOWXSVL._SY741_.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!', 'Style Quotient', 'Women Wear', 'S, M, L, XL', 'https://m.media-amazon.com/images/I/71VdhswoufL._SY741_.jpg', 'https://m.media-amazon.com/images/I/71VdhswoufL._SY741_.jpg', 'https://m.media-amazon.com/images/I/71Q6wYljpLL._SY741_.jpg', 'https://m.media-amazon.com/images/I/71JNGzOcuhL._SY741_.jpg'),
('LUXE VIBE Printed Chinon Silk Lehenga Choli with Sequins Embroidered Net Dupatta & Stitched Banglory Silk', '₹3299', 'https://m.media-amazon.com/images/I/71TNGiuXngL._SX569_.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!', 'Style Quotient', 'Women Wear', 'S, M, L, XL', 'https://m.media-amazon.com/images/I/71hXbcMq5iL._SX569_.jpg', 'https://m.media-amazon.com/images/I/711oZ16TpCL._SX569_.jpg', 'https://m.media-amazon.com/images/I/61pJLHO+SOL._SY741_.jpg', 'https://m.media-amazon.com/images/I/710YASXWB1L._SX569_.jpg'),
('TRENDMALLS Womens Georgette Embroidery work Lehenga Choli with Dupatta | Bridesmaid Wedding Lehenga Choli', '₹4999', 'https://m.media-amazon.com/images/I/71oLPwCh06L._SY741_.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!', 'Style Quotient', 'Women Wear', 'S, M, L, XL', 'https://m.media-amazon.com/images/I/71MlxKjAkSL._SY741_.jpg', 'https://m.media-amazon.com/images/I/71JUKag1SfL._SY741_.jpg', 'https://m.media-amazon.com/images/I/81zEh90PhGL._SY741_.jpg', 'https://m.media-amazon.com/images/I/81Uk+B374EL._SY741_.jpg'),
('Men’s Designer Black Embroidered Sherwani | Premium Wedding Ethnic Outfit |  Bridesmaid Wedding Silk', '₹2899', 'https://m.media-amazon.com/images/I/51LqcvVyvmL._SY741_.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa incidunt hic, corporis reprehenderit, vero accusamus possimus dolor quia reiciendis similique autem nesciunt explicabo voluptatum exercitationem nulla omnis quas inventore ab adipisci eius, quis earum at illum optio! Quae quia aliquam praesentium architecto autem quos. Natus illo magni error! Pariatur dolorem delectus enim. Recusandae hic dolores repellendus laudantium doloremque vero delectus similique blanditiis quae? Maiores odio tenetur reiciendis, velit, quo modi exercitationem illum praesentium non quos rem accusamus molestias quia incidunt consequatur sapiente porro obcaecati. Architecto quia aspernatur quas molestias itaque doloribus esse est hic aut cumque saepe, iure voluptate qui!', 'Style Quotient', 'Women Wear', 'S, M, L, XL', 'https://m.media-amazon.com/images/I/51FiadTlLGL.jpg', 'https://m.media-amazon.com/images/I/51YZ87uLtTL._SY741_.jpg', 'https://m.media-amazon.com/images/I/51R-AY+wvZL.jpg', 'https://m.media-amazon.com/images/I/51R-AY+wvZL.jpg');


ALTER TABLE latest_collection
MODIFY product_name VARCHAR(255);

CREATE TABLE banners_collection(
    id INT AUTO_INCREMENT PRIMARY KEY,
    image VARCHAR(255) NOT NULL
);

INSERT INTO banners_collection(image) VALUES(
	'https://rukminim1.flixcart.com/fk-p-flap/3200/640/image/652138a0711310c6.jpg?q=60'
);

SELECT * FROM banners_collection;

CREATE TABLE wishlist(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY(product_id) REFERENCES latest_collection(id) ON DELETE CASCADE
);

CREATE TABLE cart(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY(product_id) REFERENCES latest_collection(id) ON DELETE CASCADE
);


CREATE TABLE user_addresses(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    full_name VARCHAR(100),
    phone VARCHAR(15),
    house_no VARCHAR(100),
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    pincode VARCHAR(10),
    landmark VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

SELECT * FROM user_addresses;

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    address_id INT NOT NULL,
    total_amount VARCHAR(20),
    payment_method VARCHAR(50),
    order_status VARCHAR(50) DEFAULT 'Placed',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY(address_id) REFERENCES user_addresses(id) ON DELETE CASCADE
);

CREATE TABLE order_items(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT DEFAULT 1,
    price VARCHAR(20),
    FOREIGN KEY(order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY(product_id) REFERENCES latest_collection(id) ON DELETE CASCADE
);


-- ADMIN CODE ALL

CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO admins(email, password)
VALUES(
'adminbuyforever@gmail.com',
'admin123'
);

select * from admins
