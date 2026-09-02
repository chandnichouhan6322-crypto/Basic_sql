CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME,
    status VARCHAR(20)
);
INSERT INTO customers
(first_name, last_name, email, phone, password, created_at, status)
VALUES
('Rahul','Kumar','rahul@gmail.com','9876543210','rahul123','2026-08-01 10:15:00','Active'),
('Priya','Sharma','priya@gmail.com','9876543211','priya456','2026-08-03 14:30:00','Active'),
('Aman',NULL,'aman@gmail.com','9876543212','aman789','2026-08-05 09:45:00','Active'),
('Sneha','Gupta','sneha@gmail.com',NULL,'sneha123','2026-08-07 16:20:00','Active'),
('Rohit','Verma','rohit@gmail.com','9876543214','rohit456','2026-08-10 11:10:00','Blocked'),
('Anjali',NULL,'anjali@gmail.com',NULL,'anjali789','2026-08-12 18:05:00','Active'),
('Arjun','Yadav','arjun@gmail.com','9876543216','arjun123','2026-08-15 12:40:00','Active'),
('Neha','Sharma','neha@gmail.com','9876543217','neha456','2026-08-18 15:25:00','Inactive'),
('Vikas','Kumar','vikas@gmail.com',NULL,'vikas789','2026-08-22 08:55:00','Active'),
('Pooja','Singh','pooja@gmail.com','9876543219','pooja123','2026-08-25 20:15:00','Active');

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) UNIQUE NOT NULL,
    description VARCHAR(255),
    status VARCHAR(20)
);
INSERT INTO categories
(category_name, description, status)
VALUES
('Electronics','Electronic gadgets and accessories','Active'),
('Clothing','Men and women clothing','Active'),
('Footwear','Shoes and sandals','Active'),
('Books','Educational and general books','Active'),
('Beauty','Beauty and personal care products','Active'),
('Grocery','Daily grocery items','Active'),
('Home Appliances','Appliances for home','Active'),
('Sports','Sports and fitness products','Active'),
('Toys','Toys and games for children','Active'),
('Accessories','Bags, watches and accessories','Inactive');

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT,
    product_name VARCHAR(150) NOT NULL,
    brand VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    discount DECIMAL(5,2),
    status VARCHAR(20),
    created_at DATETIME,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
INSERT INTO products
(category_id, product_name, brand, description, price, discount, status, created_at)
VALUES
(1,'Wireless Mouse','Logitech','Wireless optical mouse',599.00,10.00,'Available','2026-08-01 10:00:00'),
(1,'Bluetooth Headphones','Boat','Wireless Bluetooth headphones',1499.00,15.00,'Available','2026-08-02 11:30:00'),
(2,'Cotton T-Shirt','Puma','Regular fit cotton T-shirt',799.00,20.00,'Available','2026-08-03 12:00:00'),
(2,'Denim Jeans','Levis','Blue denim jeans',1999.00,10.00,'Available','2026-08-04 13:15:00'),
(3,'Running Shoes','Nike','Sports running shoes',2999.00,25.00,'Available','2026-08-05 14:20:00'),
(4,'SQL Programming Book','TechPress','Database learning book',699.00,5.00,'Available','2026-08-06 09:30:00'),
(5,'Face Wash','Nivea','Daily face cleanser',249.00,10.00,'Available','2026-08-07 15:00:00'),
(6,'Basmati Rice','India Gate','5 kg basmati rice',650.00,8.00,'Available','2026-08-08 16:10:00'),
(7,'Electric Kettle','Philips','1.5 litre electric kettle',1299.00,12.00,'Available','2026-08-09 17:00:00'),
(8,'Football','Nivia','Standard football',799.00,15.00,'Available','2026-08-10 18:20:00');

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT,
    reorder_level INT,
    last_updated DATETIME,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO inventory
(product_id, quantity, reorder_level, last_updated)
VALUES
(1,50,10,'2026-08-25 10:00:00'),
(2,35,8,'2026-08-25 10:15:00'),
(3,80,15,'2026-08-25 11:00:00'),
(4,25,5,'2026-08-25 11:30:00'),
(5,12,10,'2026-08-25 12:00:00'),
(6,60,10,'2026-08-25 12:30:00'),
(7,7,10,'2026-08-25 13:00:00'),
(8,40,8,'2026-08-25 13:30:00'),
(9,18,5,'2026-08-25 14:00:00'),
(10,0,5,'2026-08-25 14:30:00');

CREATE TABLE addresses (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    address_line VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    address_type VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO addresses
(customer_id, address_line, city, state, pincode, address_type)
VALUES
(1,'12 Main Road','Dhanbad','Jharkhand','826001','Home'),
(2,'45 Station Road','Ranchi','Jharkhand','834001','Home'),
(3,'22 MG Road','Bokaro','Jharkhand','827004','Home'),
(4,'18 Park Street','Kolkata','West Bengal','700016','Work'),
(5,'10 Bank Road','Dhanbad','Jharkhand','826004','Home'),
(6,'55 College Road','Ranchi','Jharkhand','834008','Home'),
(7,'76 Market Road','Bokaro','Jharkhand','827001','Work'),
(8,'14 Main Street','Jamshedpur','Jharkhand','831001','Home'),
(9,'30 Station Road','Dhanbad','Jharkhand','826005','Home'),
(10,'8 City Road','Ranchi','Jharkhand','834002','Home');

CREATE TABLE cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO cart
(customer_id, created_at, updated_at)
VALUES
(1,'2026-08-20 10:00:00','2026-08-25 10:30:00'),
(2,'2026-08-21 11:00:00','2026-08-25 11:30:00'),
(3,'2026-08-22 12:00:00','2026-08-25 12:00:00'),
(4,'2026-08-22 14:00:00','2026-08-25 14:20:00'),
(5,'2026-08-23 09:00:00','2026-08-25 09:30:00'),
(6,'2026-08-23 15:00:00','2026-08-25 15:15:00'),
(7,'2026-08-24 10:00:00','2026-08-25 10:10:00'),
(8,'2026-08-24 12:00:00','2026-08-25 12:30:00'),
(9,'2026-08-24 16:00:00','2026-08-25 16:10:00'),
(10,'2026-08-25 18:00:00','2026-08-25 18:30:00');

CREATE TABLE cart_items (
    cart_item_id INT PRIMARY KEY AUTO_INCREMENT,
    cart_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (cart_id) REFERENCES cart(cart_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO cart_items
(cart_id, product_id, quantity)
VALUES
(1,1,2),
(1,6,1),
(2,2,1),
(2,3,2),
(3,4,1),
(4,5,1),
(5,7,2),
(6,8,1),
(7,9,1),
(8,10,2);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    address_id INT,
    order_date DATETIME,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (address_id) REFERENCES addresses(address_id)
);
INSERT INTO orders
(customer_id, address_id, order_date, total_amount, order_status)
VALUES
(1,1,'2026-08-20 10:30:00',1078.20,'Delivered'),
(2,2,'2026-08-21 12:15:00',2548.30,'Shipped'),
(3,3,'2026-08-22 14:00:00',1799.10,'Confirmed'),
(4,4,'2026-08-23 09:45:00',2249.25,'Pending'),
(5,5,'2026-08-23 16:20:00',1169.10,'Delivered'),
(6,6,'2026-08-24 11:30:00',679.15,'Shipped'),
(7,7,'2026-08-24 15:00:00',1149.15,'Confirmed'),
(8,8,'2026-08-25 10:10:00',699.00,'Pending'),
(9,9,'2026-08-25 13:30:00',1299.00,'Delivered'),
(10,10,'2026-08-25 18:00:00',799.00,'Cancelled');

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO order_items
(order_id, product_id, quantity, price)
VALUES
(1,1,2,599.00),
(2,2,1,1499.00),
(2,3,1,799.00),
(3,4,1,1999.00),
(4,5,1,2999.00),
(5,6,1,699.00),
(6,7,2,249.00),
(7,8,1,799.00),
(8,9,1,1299.00),
(9,10,1,799.00);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(30),
    amount DECIMAL(10,2),
    payment_status VARCHAR(30),
    payment_date DATETIME,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
INSERT INTO payments
(order_id, payment_method, amount, payment_status, payment_date)
VALUES
(1,'UPI',1078.20,'Success','2026-08-20 10:35:00'),
(2,'Card',2548.30,'Success','2026-08-21 12:20:00'),
(3,'UPI',1799.10,'Success','2026-08-22 14:05:00'),
(4,'COD',2249.25,'Pending','2026-08-23 09:50:00'),
(5,'Card',1169.10,'Success','2026-08-23 16:25:00'),
(6,'UPI',679.15,'Success','2026-08-24 11:35:00'),
(7,'COD',1149.15,'Pending','2026-08-24 15:05:00'),
(8,'UPI',699.00,'Pending','2026-08-25 10:15:00'),
(9,'Card',1299.00,'Success','2026-08-25 13:35:00'),
(10,'UPI',799.00,'Failed','2026-08-25 18:05:00');

CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    rating INT,
    review_text TEXT,
    review_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO reviews
(customer_id, product_id, rating, review_text, review_date)
VALUES
(1,1,5,'Very good mouse','2026-08-21 12:00:00'),
(2,2,4,'Good sound quality','2026-08-22 13:00:00'),
(3,3,5,'Comfortable T-shirt','2026-08-23 14:00:00'),
(4,4,4,'Good quality jeans','2026-08-24 10:00:00'),
(5,5,5,'Very comfortable shoes','2026-08-24 15:00:00'),
(6,6,4,'Useful book','2026-08-25 11:00:00'),
(7,7,3,'Average product','2026-08-25 12:00:00'),
(8,8,5,'Good quality rice','2026-08-25 13:00:00'),
(9,9,4,'Works well','2026-08-25 14:00:00'),
(10,10,5,'Good football','2026-08-25 15:00:00');

CREATE TABLE wishlist (
    wishlist_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    added_at DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO wishlist
(customer_id, product_id, added_at)
VALUES
(1,2,'2026-08-20 10:00:00'),
(2,5,'2026-08-21 11:00:00'),
(3,1,'2026-08-22 12:30:00'),
(4,6,'2026-08-22 14:20:00'),
(5,3,'2026-08-23 09:15:00'),
(6,9,'2026-08-23 15:30:00'),
(7,4,'2026-08-24 10:30:00'),
(8,7,'2026-08-24 13:00:00'),
(9,10,'2026-08-25 16:00:00'),
(10,8,'2026-08-25 18:30:00');
select*from customer;

