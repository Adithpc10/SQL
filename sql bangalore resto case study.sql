# BANGALORE RESTAURANT CASE STUDY

create database	if not exists bangalore_resto_dataset;
use bangalore_resto_dataset;

# CREATING TABLE

CREATE TABLE bangalore_restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    area VARCHAR(100),
    cuisine VARCHAR(100),
    average_cost DECIMAL(10, 2),
    rating DECIMAL(3, 1),
    is_veg ENUM('YES', 'NO')
);

# INSERTING VALUES 

INSERT INTO bangalore_restaurants (id, name, area, cuisine, average_cost, rating, is_veg) VALUES
(1, 'Roti Mahal', 'Koramangala', 'North Indian', 450, 4.2, 'YES'),
(2, 'Tandoori Flames', 'Indiranagar', 'Mughlai', 600, 4.5, 'NO'),
(3, 'Pasta Street', 'MG Road', 'Italian', 700, 4.1, 'NO'),
(4, 'Green Fork', 'HSR Layout', 'Healthy', 400, 4.6, 'YES'),
(5, 'Dosa King', 'Jayanagar', 'South Indian', 300, 4.3, 'YES'),
(6, 'Burger Factory', 'Koramangala', 'American', 350, 3.8, 'NO'),
(7, 'Sushi Sensei', 'Whitefield', 'Japanese', 1200, 4.7, 'NO'),
(8, 'Curry Leaf', 'Indiranagar', 'North Indian', 500, 4.0, 'YES');

# ANALYSING QUERIES

#1 List all vegetarian restaurants.
SELECT name, area
FROM bangalore_restaurants
WHERE is_veg = 'YES';

#2 Show restaurants located in ‘Indiranagar’ with a rating above 4.0.
SELECT name, cuisine, rating
FROM bangalore_restaurants
WHERE area = 'Indiranagar' AND rating > 4.0;

#3  Find the average cost of all restaurants in 'Koramangala'.
SELECT AVG(average_cost) AS avg_cost_koramangala
FROM bangalore_restaurants
WHERE area = 'Koramangala';

#4  Count the number of restaurants in each area.
SELECT area, COUNT(*) AS num_restaurants
FROM bangalore_restaurants
GROUP BY area;

#5 List the top 3 highest-rated restaurants.
SELECT name, rating
FROM bangalore_restaurants
ORDER BY rating DESC
LIMIT 3;

#6 Find the average rating of vegetarian vs. non-vegetarian restaurants.
SELECT is_veg, ROUND(AVG(rating), 2) AS avg_rating
FROM bangalore_restaurants
GROUP BY is_veg;


