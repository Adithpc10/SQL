# GADGETS CASE STUDY

create database if not exists gadgets_dataset;
use gadgets_dataset;

# CREATING TABLES
CREATE TABLE gadgets (
    gadget_id INT PRIMARY KEY,
    name VARCHAR(100),
    brand VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    release_year INT
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    gadget_id INT,
    rating DECIMAL(2, 1),
    review_text VARCHAR(255),
    reviewer VARCHAR(50),
    FOREIGN KEY (gadget_id) REFERENCES gadgets(gadget_id)
);

# INSERTING VALUES

INSERT INTO gadgets (gadget_id, name, brand, category, price, release_year) VALUES
(1, 'iPhone 14', 'Apple', 'Smartphone', 999, 2022),
(2, 'Galaxy S22', 'Samsung', 'Smartphone', 899, 2022),
(3, 'MacBook Air M2', 'Apple', 'Laptop', 1199, 2022),
(4, 'Galaxy Tab S8', 'Samsung', 'Tablet', 799, 2022),
(5, 'Pixel 7', 'Google', 'Smartphone', 599, 2022),
(6, 'Surface Laptop 5', 'Microsoft', 'Laptop', 999, 2022),
(7, 'iPad Pro', 'Apple', 'Tablet', 1099, 2021),
(8, 'Pixelbook Go', 'Google', 'Laptop', 849, 2021);

INSERT INTO reviews (review_id, gadget_id, rating, review_text, reviewer) VALUES
(1, 1, 4.8, 'Excellent phone', 'Alice'),
(2, 1, 4.5, 'Fast and sleek', 'Bob'),
(3, 2, 4.2, 'Great display', 'Charlie'),
(4, 3, 4.7, 'Best MacBook yet', 'Alice'),
(5, 4, 4.0, 'Very portable', 'Dave'),
(6, 5, 4.3, 'Smooth Android experience', 'Eve'),
(7, 6, 3.8, 'Average for the price', 'Bob'),
(8, 7, 4.6, 'Excellent for artists', 'Alice'),
(9, 8, 3.9, 'Good Chromebook', 'Charlie');

# ANALYSING QUERIES

#1 List the names and prices of all gadgets that cost more than $900
SELECT name, price
FROM gadgets
WHERE price > 900;

#2 List all gadgets released in the year 2022.
SELECT name, release_year
FROM gadgets
WHERE release_year = 2022;

#3 Find the names of reviewers who gave a rating below 4.0.
SELECT reviewer, rating
FROM reviews
WHERE rating < 4.0;

#4 List all gadgets with their average rating (if they have any reviews).
SELECT g.name, ROUND(AVG(r.rating), 2) AS avg_rating
FROM gadgets g
JOIN reviews r ON g.gadget_id = r.gadget_id
GROUP BY g.gadget_id, g.name;

#5  Find the number of reviews written for each gadget.
SELECT g.name, COUNT(r.review_id) AS review_count
FROM gadgets g
LEFT JOIN reviews r ON g.gadget_id = r.gadget_id
GROUP BY g.gadget_id, g.name;

#6  Which reviewer has written the most reviews?
SELECT reviewer, COUNT(*) AS review_count
FROM reviews
GROUP BY reviewer
ORDER BY review_count DESC
LIMIT 1;

