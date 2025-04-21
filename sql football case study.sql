# FOOTBALL DATASET CASE STUDY

create	database if not exists football_dataset;
use football_dataset;


# CREATING TABLE 
CREATE TABLE players (
    player_id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50),
    team VARCHAR(50),
    position VARCHAR(20),
    goals INT,
    assists INT
);

# INSERT VALUES

INSERT INTO players (player_id, name, country, team, position, goals, assists) VALUES
(1, 'Lionel Messi', 'Argentina', 'PSG', 'Forward', 30, 12),
(2, 'Cristiano Ronaldo', 'Portugal', 'Al-Nassr', 'Forward', 28, 8),
(3, 'Kylian Mbappé', 'France', 'PSG', 'Forward', 32, 10),
(4, 'Kevin De Bruyne', 'Belgium', 'Man City', 'Midfield', 10, 18),
(5, 'Neymar Jr', 'Brazil', 'PSG', 'Forward', 20, 14),
(6, 'Luka Modric', 'Croatia', 'Real Madrid', 'Midfield', 6, 9),
(7, 'Erling Haaland', 'Norway', 'Man City', 'Forward', 35, 5);

# ANALYSING QUERIES

#1 List the names of players who scored more than 20 goals and made more than 10 assists.
SELECT name
FROM players
WHERE goals > 20 AND assists > 10;

#2 Show the top 3 players with the highest assists.
SELECT name, assists
FROM players
ORDER BY assists DESC
LIMIT 3;

#3 Count the number of players in each position.
SELECT position, COUNT(*) AS num_players
FROM players
GROUP BY position;

#4 Show the team with the highest total goals scored by its players.
SELECT team, SUM(goals) AS total_goals
FROM players
GROUP BY team
ORDER BY total_goals DESC
LIMIT 1;

#5 List all players and their goal-to-assist ratio (goals / assists), rounded to 2 decimal places.
SELECT name, ROUND(goals / assists, 2) AS goal_assist_ratio
FROM players;

#6  Show the country with the highest average number of goals per player.
SELECT country, AVG(goals) AS avg_goals
FROM players
GROUP BY country
ORDER BY avg_goals DESC
LIMIT 1;



