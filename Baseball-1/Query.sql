SELECT * FROM Player WHERE position=2;
SELECT name, age FROM Player WHERE position=1 AND team="Rays";
SELECT name, number, team FROM Player WHERE (position=7 OR position=8 OR position=9) AND age<=25;
SELECT name, number FROM Player WHERE (position=3 OR position=4 OR position=5 OR position=6) AND team="Red Sox";
SELECT name, number, team FROM Player WHERE position=1 AND age>30;
