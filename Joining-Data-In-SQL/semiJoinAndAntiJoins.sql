-- 1) Flash back to our Intro to SQL for Data Science course and begin by selecting all country codes in the Middle East as a single field result using SELECT, FROM, and WHERE.

-- Select code
SELECT code
-- From countries
FROM countries
-- Where region is Middle East
WHERE region = 'Middle East';


-- ###################### --
-- 2) Comment out the answer to the previous tab by surrounding it in /* and */. You'll come back to it!

-- Below the commented code, select only unique languages by name appearing in the languages table.
-- Order the resulting single field table by name in ascending order.
/* SELECT code
  FROM countries
WHERE region = 'Middle East';
*/

-- Select field
SELECT DISTINCT name
-- From languages
FROM languages
-- Order by name
ORDER BY name;



-- ###################### --
-- 3) Now combine the previous two queries into one query:

-- Add a WHERE IN statement to the SELECT DISTINCT query, and use the commented out query from the first instruction in there. That way, you can determine the unique languages spoken in the Middle East.
-- Carefully review this result and its code after completing it. It serves as a great example of subqueries, which are the focus of Chapter 4.

-- Select distinct fields
SELECT DISTINCT name
-- From languages
FROM languages
-- Where in statement
WHERE code IN
  -- Subquery
  (SELECT code
FROM countries
WHERE region = 'Middle East')
-- Order by name
ORDER BY name;

-- #################  --
-- 4) Begin by determining the number of countries in countries that are listed in Oceania using SELECT, FROM, and WHERE.
-- Select statement
SELECT COUNT(name)
-- From countries
FROM countries
-- Where continent is Oceania
WHERE continent = 'Oceania';


-- #################  --
-- 5) Complete an inner join with countries AS c1 on the left and currencies AS c2 on the right to get the different currencies used in the countries of Oceania.
-- Match ON the code field in the two tables.
-- Include the country code, country name, and basic_unit AS currency.
-- Observe query result and make note of how many different countries are listed here.
-- 5. Select fields (with aliases)
SELECT c1.code, c1.name, c2.basic_unit AS currency
-- 1. From countries (alias as c1)
FROM countries AS c1
    -- 2. Join with currencies (alias as c2)
    INNER JOIN currencies AS c2
    -- 3. Match on code
    ON c1.code = c2.code
-- 4. Where continent is Oceania
WHERE continent = 'Oceania';

-- ################## --
-- 6) Note that not all countries in Oceania were listed in the resulting inner join with currencies. Use an anti-join to determine which countries were not included!
-- Use NOT IN and (SELECT code FROM currencies) as a subquery to get the country code and country name for the Oceanian countries that are not included in the currencies table.
-- 3. Select fields
SELECT *
-- 4. From Countries
FROM countries
-- 5. Where continent is Oceania
WHERE continent = 'Oceania'
    -- 1. And code not in
    AND code NOT IN
  	-- 2. Subquery
  	(SELECT code
    FROM currencies);


-- ################## --
-- 7) Identify the country codes that are included in either economies or currencies but not in populations.

-- Use that result to determine the names of cities in the countries that match the specification in the previous instruction.


-- Select the city name
SELECT c1.name
-- Alias the table where city name resides
FROM cities AS c1
-- Choose only records matching the result of multiple set theory clauses
WHERE country_code IN
(
    -- Select appropriate field from economies AS e
        SELECT e.code
    FROM economies AS e
    -- Get all additional (unique) values of the field from currencies AS c2  
UNION
    SELECT c2.code
    FROM currencies AS c2
-- Exclude those appearing in populations AS p
EXCEPT
    SELECT p.country_code
    FROM populations AS p
);