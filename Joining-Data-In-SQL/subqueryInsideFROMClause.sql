-- 1) Begin by determining for each country code how many languages are listed in the languages table using SELECT, FROM, and GROUP BY.
-- Alias the aggregated field as lang_num.

-- Select fields (with aliases)
SELECT code, COUNT(name) AS lang_num
-- From languages
FROM languages
-- Group by code
GROUP BY code;


-- ###################################### --
-- 2) Include the previous query (aliased as subquery) as a subquery in the FROM clause of a new query.

-- Select the local name of the country from countries.

-- Also, select lang_num from subquery.

-- Make sure to use WHERE appropriately to match code in countries and in subquery.

-- Sort by lang_num in descending order.
-- Select fields
SELECT countries.local_name, subquery.lang_num
-- From countries
FROM countries,
    -- Subquery (alias as subquery)
    (SELECT code, COUNT(name) AS lang_num
    FROM languages
    GROUP BY code) AS subquery
-- Where codes match
WHERE countries.code = subquery.code
-- Order by descending number of languages
ORDER BY lang_num DESC;

-- ###################################### --
-- 3) Now it's time to append the second part's query to the first part's query using AND and IN to obtain the name of the country, its continent, and the maximum inflation rate for each continent in 2015!
-- For the sake of practice, change all joining conditions to use ON instead of USING (based upon the same column, code).
-- Revisit the sample output in the assignment text at the beginning of the exercise to see how this matches up.
-- Select fields
SELECT name, continent, inflation_rate
-- From countries
FROM countries
    -- Join to economies
    INNER JOIN economies
    -- Match on code
    USING (code) 
-- Where year is 2015
WHERE year = 2015;

-- ###################################### --
-- 4) Select the maximum inflation rate in 2015 AS max_inf grouped by continent using the previous step's query as a subquery in the FROM clause.
-- Thus, in your subquery you should:
-- Create an inner join with countries on the left and economies on the right with USING (without aliasing your tables or columns).
-- Retrieve the country name, continent, and inflation rate for 2015.
-- Alias the subquery as subquery.
-- This will result in the six maximum inflation rates in 2015 for the six continents as one field table. Make sure to not include continent in the outer SELECT statement.

-- Select the maximum inflation rate as max_inf
SELECT MAX(inflation_rate) AS max_inf
-- Subquery using FROM (alias as subquery)
FROM (
      SELECT name, continent, inflation_rate
    FROM countries
        INNER JOIN economies
      USING (code) 
    WHERE year = 2015) AS subquery
-- Group by continent
GROUP BY continent;

-- ###################################### --
-- 5) Now it's time to append your second query to your first query using AND and IN to obtain the name of the country, its continent, and the maximum inflation rate for each continent in 2015.
-- For the sake of practice, change all joining conditions to use ON instead of USING.
-- Select fields
SELECT name, continent, inflation_rate
-- From countries
FROM countries
    -- Join to economies
    INNER JOIN economies
    -- Match on code
    ON countries.code = economies.code
-- Where year is 2015
WHERE year = 2015
    -- And inflation rate in subquery (alias as subquery)
    AND inflation_rate IN (
        SELECT MAX(inflation_rate) AS max_inf
    FROM (
             SELECT name, continent, inflation_rate
        FROM countries
            INNER JOIN economies
            ON countries.code = economies.code
        WHERE year = 2015) AS subquery
    -- Group by continent
    GROUP BY continent);


-- ###################################### --
-- Select the country code, inflation rate, and unemployment rate.
-- Order by inflation rate ascending.
-- Do not use table aliasing in this exercise.
-- Select fields
SELECT code, inflation_rate, unemployment_rate
-- From economies
FROM economies
-- Where year is 2015 and code is not in
WHERE year = 2015 AND code NOT IN
  	-- Subquery
  	(SELECT code
    FROM countries
    WHERE (gov_form = 'Constitutional Monarchy' OR gov_form LIKE '%Republic'))
-- Order by inflation rate
ORDER BY inflation_rate;