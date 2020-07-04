-- Change all SQL syntax (clauses, operators, and functions) to UPPERCASE.
-- Make sure all SQL syntax begins on a new line.
-- Add an indent to the calculated BMI column and OR statement.

SELECT PlayerName, Country,
    round(Weight_kg/SQUARE(Height_cm/100),2) BMI
FROM Players
WHERE Country = 'USA'
    OR Country = 'Canada'
ORDER BY BMI;

-- Create a comment block on lines 1 and 4.
-- Add the above comment to the block.
-- Comment out the ORDER BY statement and add Order by not required comment on the same line.
-- Add ; directly after 'Canada' to indicate the new ending of the query.

/* Returns the Body Mass Index (BMI)
for all North American players from
the 2017-2018 NBA season
*/
SELECT PlayerName, Country,
    ROUND(Weight_kg/SQUARE(Height_cm/100),2) BMI
FROM Players
WHERE Country = 'USA'
    OR Country = 'Canada';
-- Order by not required
-- ORDER BY BMI;

-- Add the line comment First attempt, contains errors and inconsistent formatting on line 2.
-- Block comment out your friend's query on lines 3 and 11.
-- Add the line comment Second attempt - errors corrected and formatting fixed on line 14.
-- Remove the block comment syntax from your query on lines 15 and 23.

-- Your friend's query
-- First attempt, contains errors and inconsistent formatting
/*
select PlayerName, p.Country,sum(ps.TotalPoints) 
AS TotalPoints  
FROM PlayerStats ps inner join Players On ps.PlayerName = p.PlayerName
WHERE p.Country = 'New Zeeland'
Group 
by PlayerName, Country
order by Country;
*/

-- Your query
-- Second attempt - errors corrected and formatting fixed

SELECT p.PlayerName, p.Country,
    SUM(ps.TotalPoints) AS TotalPoints
FROM PlayerStats ps
    INNER JOIN Players p
    ON ps.PlayerName = p.PlayerName
WHERE p.Country = 'New Zealand'
GROUP BY p.PlayerName, p.Country;
