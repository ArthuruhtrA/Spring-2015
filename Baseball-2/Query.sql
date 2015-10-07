.echo off
.headers off
SELECT '' ;
SELECT '' ;
SELECT '**** Standard questions ****' ;
SELECT '10 at 5 points each for 50 points' ;
SELECT '' ;
SELECT '' ; SELECT 'Query 1';
.headers on

-- Query 1
-- Print the player name, player number, and player team
-- for all catchers (position 2)

SELECT name, number, team FROM Player Where position=2 ;

.headers off
SELECT '' ; SELECT 'Query 2' ;
.headers on

-- Query 2
-- Print the coach name and team name for all the managers (a type of coach).

SELECT Coach.name, Team.name FROM Coach JOIN Team ON Coach.team = Team.name WHERE title="Manager" ;

.headers off
SELECT '' ; SELECT 'Query 3' ;
.headers on

-- Query 3
-- Print the player name, number, and position (as a title) for all
-- outfielders (positions 7-9) whose home field is 'Fenway Park'.

SELECT P.name, P.number, Po.title FROM Player AS P JOIN Team AS T ON P.team = T.name JOIN Position as Po ON P.position = Po.posnum WHERE (position=7 OR position=8 OR position=9) AND ballpark="Fenway Park" ;

.headers off
SELECT '' ; SELECT 'Query 4' ;
.headers on

-- Query 4
-- Print the names and numbers of the hitting coaches for 'Hanley Ramirez'.
-- There may be more than one; any coach with a title containing 'Hitting'
-- anywhere within it is a hitting coach.

SELECT Coach.name, Coach.number FROM Coach JOIN Player ON Coach.team = Player.team WHERE Player.name="Hanley Ramirez" AND Coach.title LIKE "%Hitting Coach%" ;

.headers off
SELECT '' ; SELECT 'Query 5' ;
.headers on

-- Query 5
-- Print the player name, pitching coach name, and team name for
-- all pitchers (position 1) who are over 30 years old.
-- Pitching coaches have 'Pitching' somewhere in their title.

SELECT Player.name, Coach.name, Team.name FROM Player JOIN Coach ON Player.team = Coach.team JOIN Team ON Player.team = Team.name WHERE Player.position=1 AND Player.age>30 AND Coach.title LIKE "%Pitching%" ;

.headers off
SELECT '' ; SELECT 'Query 6' ;
.headers on

-- Query 6
-- Print the names, numbers, and ages of all infielders (positions 3-6)
-- whose home field is 'Camden Yards'.

SELECT Player.name, Player.number, Player.age FROM Player JOIN Team ON Player.team = Team.name WHERE (Player.position=3 OR Player.position=4 OR Player.position=5 OR Player.position=6) AND Team.ballpark="Camden Yards" ;

.headers off
SELECT '' ; SELECT 'Query 7' ;
.headers on

-- Query 7
-- Print the names, numbers, and team of all outfielders (positions 7-9)
-- whose manager's first name is 'John'

SELECT P.name, P.number, P.team FROM Player AS P JOIN Coach AS C ON P.team = C.team WHERE (P.position=7 OR P.position=8 OR P.position=9) AND C.name LIKE "John%" ;

.headers off
SELECT '' ; SELECT 'Query 8' ;
.headers on

-- Query 8
-- Print the names of the bullpen coaches for teams on the Eastern Seaboard
-- (Boston, Baltimore, and New York).

SELECT C.name FROM Coach as C JOIN Team AS T ON C.team = T.name WHERE C.title="Bullpen Coach" AND (T.city="Boston" OR T.city="Baltimore" OR T.city="New York") ;

.headers off
SELECT '' ; SELECT 'Query 9' ;
.headers on

-- Query 9
-- Print the name, position, number, and team of all players whose
-- position is greater than their (jersey) number.

SELECT name, position, number, team FROM Player WHERE position>number ;

.headers off
SELECT '' ; SELECT 'Query 10' ;
.headers on

-- Query 10
-- Print the name and position title for all players whose (first) name
-- begins with 'D'

SELECT Player.name, Position.title FROM Player JOIN Position ON Player.position = Position.posnum WHERE Player.name LIKE "D%" ;

.headers off
SELECT '' ;
SELECT '' ;
SELECT '**** Extra credit ****'  ;
SELECT '5 at 2 points each for 10 bonus points max.' ;
SELECT '' ;
SELECT '' ; SELECT 'Extra Credit 1' ;
.headers on

-- Query EC1
-- Create a listing of all player names and numbers for players on the 'Rays'
-- sorted by ascending name.
-- See ORDER BY

SELECT name, number FROM Player WHERE team="Rays" ORDER BY name ASC ;

.headers off
SELECT '' ; SELECT 'Extra Credit 2' ;

-- Query EC2
-- How many infielders (positions 3-6) are in the database?
-- See the count() function.

SELECT count(name) FROM Player WHERE (position=3 OR position=4 OR position=5 OR position=6) ;

SELECT '' ; SELECT 'Extra Credit 3' ;

-- Query EC3
-- What is the average age of all pitchers (position 1) in the database (rounded to
-- two fractional digit)?
-- See the avg() and round() functions.

SELECT round(avg(age), 2) FROM Player WHERE position=1 ;

SELECT '' ; SELECT 'Extra Credit 4' ;

-- Query EC4
-- How many infielders (positions 3-6) are there in the database *by team*?
-- Each output line has a count and a team name.
-- See GROUP BY

SELECT count(name), team FROM Player WHERE (position=3 OR position=4 OR position=5 OR position=6) GROUP BY team ;

SELECT '' ; SELECT 'Extra Credit 5' ;

-- Query EC5
-- What is the average age of all pitchers (position 1) in the database *by team*?
-- Each output line has an average age rounded to two fractional digits and a team name.
-- The lines should be ordered by increasing average age.
-- See GROUP BY

SELECT round(avg(age), 2), team FROM Player WHERE position=1 GROUP BY team ORDER BY round(avg(age), 2) ASC ;
