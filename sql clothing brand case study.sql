#  CLOTHING BRAND CASE STUDY 

create database if not exists clothing_brand_dataset;
use clothing_brand_dataset;

# CREATING TABLE

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    join_date DATE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

# INSERTING VALUES

INSERT INTO products (product_id, product_name, category, price, stock) VALUES
(1, 'Classic T-Shirt', 'T-Shirts', 799, 150),
(2, 'Blue Jeans', 'Jeans', 1499, 60),
(3, 'Formal Shirt', 'Shirts', 1299, 80),
(4, 'Hoodie', 'Winter Wear', 1799, 40),
(5, 'Summer Dress', 'Dresses', 1599, 30);

INSERT INTO customers (customer_id, customer_name, city, join_date) VALUES
(101, 'Riya Mehta', 'Bangalore', '2023-01-10'),
(102, 'Arjun Singh', 'Delhi', '2023-02-15'),
(103, 'Sneha Roy', 'Mumbai', '2023-03-05'),
(104, 'Karan Patel', 'Pune', '2023-04-01');

INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity) VALUES
(1001, 101, 1, '2023-04-10', 2),
(1002, 102, 2, '2023-04-11', 1),
(1003, 101, 3, '2023-04-15', 1),
(1004, 103, 5, '2023-04-20', 2),
(1005, 104, 4, '2023-04-25', 1),
(1006, 102, 1, '2023-04-27', 3);

# ANALYSING QUERIES

#1  List all products in the 'Shirts' category.
SELECT * 
FROM products 
WHERE category = 'Shirts';

#2 Find customers from Bangalore.
SELECT * 
FROM customers 
WHERE city = 'Bangalore';

#3 Show the number of orders placed by each customer.
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

#4  Find the total quantity of each product sold.
SELECT p.product_name, SUM(o.quantity) AS total_sold
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name;

#5  Which customer spent the most money?
SELECT c.customer_name, SUM(o.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

#6  Find the most popular product by total quantity sold.
SELECT p.product_name, SUM(o.quantity) AS total_sold
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 1;
