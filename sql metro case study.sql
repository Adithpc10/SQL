# METRO CASE STUDY

create database if not	exists metro_dataset;
use metro_dataset;

# CREATING TABLE

CREATE TABLE stations (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(100),
    zone VARCHAR(50)
);

CREATE TABLE routes (
    route_id INT PRIMARY KEY,
    start_station_id INT,
    end_station_id INT,
    duration_mins INT,
    FOREIGN KEY (start_station_id) REFERENCES stations(station_id),
    FOREIGN KEY (end_station_id) REFERENCES stations(station_id)
);

CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY,
    route_id INT,
    passenger_name VARCHAR(100),
    travel_date DATE,
    fare DECIMAL(6,2),
    FOREIGN KEY (route_id) REFERENCES routes(route_id)
);

# INSERTING VALUES

INSERT INTO stations (station_id, station_name, zone) VALUES
(1, 'Majestic', 'Central'),
(2, 'Indiranagar', 'East'),
(3, 'Yeshwanthpur', 'North'),
(4, 'Jayanagar', 'South'),
(5, 'Electronic City', 'South-East');

INSERT INTO routes (route_id, start_station_id, end_station_id, duration_mins) VALUES
(101, 1, 2, 15),
(102, 1, 3, 20),
(103, 2, 4, 18),
(104, 4, 5, 25),
(105, 3, 5, 30);

INSERT INTO tickets (ticket_id, route_id, passenger_name, travel_date, fare) VALUES
(1001, 101, 'Arjun Rao', '2024-12-01', 30),
(1002, 102, 'Riya Mehta', '2024-12-02', 35),
(1003, 103, 'Priya Das', '2024-12-03', 32),
(1004, 104, 'Kunal Joshi', '2024-12-03', 40),
(1005, 101, 'Meera Menon', '2024-12-04', 30),
(1006, 105, 'Arjun Rao', '2024-12-04', 45);

# ANALYSING QUERIES

#1 List all stations in the 'South' zone.
SELECT * FROM stations WHERE zone = 'South';

#2 Show all ticket bookings made on '2024-12-03'.
SELECT * FROM tickets WHERE travel_date = '2024-12-03';

#3 Find the names of all passengers who took Route 101.
SELECT passenger_name 
FROM tickets 
WHERE route_id = 101;

#4 Display each route with its start and end station names.
SELECT 
  r.route_id, 
  s1.station_name AS start_station, 
  s2.station_name AS end_station,
  r.duration_mins
FROM routes r
JOIN stations s1 ON r.start_station_id = s1.station_id
JOIN stations s2 ON r.end_station_id = s2.station_id;

#5 Calculate total fare collected per route.
SELECT route_id, SUM(fare) AS total_fare
FROM tickets
GROUP BY route_id;

#6  Find the route with the longest duration.
SELECT route_id, duration_mins 
FROM routes
ORDER BY duration_mins DESC
LIMIT 1;

#7 List passengers who have taken more than one trip.
SELECT passenger_name, COUNT(*) AS trips
FROM tickets
GROUP BY passenger_name
HAVING trips > 1;