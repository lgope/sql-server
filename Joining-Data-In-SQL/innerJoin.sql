-- 1) Begin by selecting all columns from the cities table.
-- Select all columns from cities
SELECT *
FROM cities

-- ##################### --
-- 2) Inner join the cities table on the left to the countries table on the right, keeping all of the fields in both tables.
-- You should match the tables on the country_code field in cities and the code field in countries.
-- Do not alias your tables here or in the next step. Using cities and countries is fine for now.

SELECT *
FROM cities
    -- 1. Inner join to countries
    INNER JOIN countries
    -- 2. Match on the country codes
    ON cities.country_code = countries.code;


-- ##################### --
-- 3)Modify the SELECT statement to keep only the name of the city, the name of the country, and the name of the region the country resides in.

-- Recall from our Intro to SQL for Data Science course that you can alias fields using AS. Alias the name of the city AS city and the name of the country AS country.
-- 1. Select name fields (with alias) and region 
SELECT cities.name as city, countries.name as country, countries.region
FROM cities
    INNER JOIN countries
    ON cities.country_code = countries.code;


-- ##################### --
-- 4) Join the tables countries (left) and economies (right) aliasing countries AS c and economies AS e.

-- Specify the field to match the tables ON.

-- From this join, SELECT:
-- c.code, aliased as country_code.
-- name, year, and inflation_rate, not aliased.

-- 3. Select fields with aliases
SELECT c.code AS country_code, name, year, inflation_rate
FROM countries AS c
    -- 1. Join to economies (alias e)
    INNER JOIN economies AS e
    -- 2. Match on code
    ON c.code = e.code;


-- ##################### --
-- 5) Inner join countries (left) and populations (right) on the code and country_code fields respectively.
-- Alias countries AS c and populations AS p.
-- Select code, name, and region from countries and also select year and fertility_rate from populations (5 fields in total).
-- 4. Select fields
SELECT c.code, c.name, c.region, p.year, p.fertility_rate
-- 1. From countries (alias as c)
FROM countries AS c
    -- 2. Join with populations (as p)
    INNER JOIN populations AS p
    -- 3. Match on country code
    ON c.code = p.country_code


-- ##################### --
-- 6) Add an additional inner join with economies to your previous query by joining on code.
-- Include the unemployment_rate column that became available through joining with economies.
-- Note that year appears in both populations and economies, so you have to explicitly use e.year instead of year as you did before.
-- 6. Select fields
SELECT c.code, name, region, e.year, fertility_rate, unemployment_rate
-- 1. From countries (alias as c)
FROM countries AS c
    -- 2. Join to populations (as p)
    INNER JOIN populations AS p
    -- 3. Match on country code
    ON c.code = p.country_code
    -- 4. Join to economies (as e)
    INNER JOIN economies AS e ON
    -- 5. Match on country code
    c.code = e.code;


-- ##################### --
-- 7) Scroll down the query result and take a look at the results for Albania from your previous query. Does something seem off to you?
-- The trouble with doing your last join on c.code = e.code and not also including year is that e.g. the 2010 value for fertility_rate is also paired with the 2015 value for unemployment_rate.
-- Fix your previous query: in your last ON clause, use AND to add an additional joining condition. In addition to joining on code in c and e, also join on year in e and p.

-- 6. Select fields
SELECT c.code, name, region, e.year, fertility_rate, unemployment_rate
-- 1. From countries (alias as c)
FROM countries AS c
    -- 2. Join to populations (as p)
    INNER JOIN populations AS p
    -- 3. Match on country code
    ON c.code = p.country_code
    -- 4. Join to economies (as e)
    INNER JOIN economies AS e
    -- 5. Match on country code and year
    ON c.code = e.code AND e.year = p.year;