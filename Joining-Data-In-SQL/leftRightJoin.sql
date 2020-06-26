-- 1) Fill in the code based on the instructions in the code comments to complete the inner join. Note how many records are in the result of the join in the query result tab.
-- Select the city name (with alias), the country code,
-- the country name (with alias), the region,
-- and the city proper population
SELECT c1.name AS city, code, c2.name AS country,
    region, city_proper_pop
-- From left table (with alias)
FROM cities AS c1
    -- Join to right table (with alias)
    INNER JOIN countries AS c2
    -- Match on country code
    ON c1.country_code = c2.code
-- Order by descending country code
ORDER BY code DESC;

-- ################### --
-- 2) Change the code to perform a LEFT JOIN instead of an INNER JOIN. After executing this query, note how many records the query result contains.
SELECT c1.name AS city, code, c2.name AS country,
    region, city_proper_pop
FROM cities AS c1
    -- 1. Join right table (with alias)
    LEFT JOIN countries AS c2
    -- 2. Match on country code
    ON c1.country_code = c2.code
-- 3. Order by descending country code
ORDER BY code DESC;


-- ################### --
-- 3) Perform an inner join. Alias the name of the country field as country and the name of the language field as language.
-- Sort based on descending country name.
/*
5. Select country name AS country, the country's local name,
the language name AS language, and
the percent of the language spoken in the country
*/
SELECT c.name AS country, local_name, l.name AS language, percent
-- 1. From left table (alias as c)
FROM countries AS c
    -- 2. Join to right table (alias as l)
    INNER JOIN languages AS l
    -- 3. Match on fields
    ON c.code = l.code
-- 4. Order by descending country
ORDER BY country DESC;


-- ################### --
-- 4)Perform a left join instead of an inner join. Observe the result, and also note the change in the number of records in the result.
-- Carefully review which records appear in the left join result, but not in the inner join result.
/*
5. Select country name AS country, the country's local name,
the language name AS language, and
the percent of the language spoken in the country
*/
SELECT c.name AS country, local_name, l.name AS language, percent
-- 1. From left table (alias as c)
FROM countries AS c
    -- 2. Join to right table (alias as l)
    LEFT JOIN languages AS l
    -- 3. Match on fields
    ON c.code = l.code
-- 4. Order by descending country
ORDER BY country DESC;

-- ################### --
-- 5) Begin with a left join with the countries table on the left and the economies table on the right.
-- Focus only on records with 2010 as the year.
-- 5. Select name, region, and gdp_percapita
SELECT name, region, gdp_percapita
-- 1. From countries (alias as c)
FROM countries AS c
    -- 2. Left join with economies (alias as e)
    LEFT JOIN economies AS e
    -- 3. Match on code fields
    ON c.code = e.code
-- 4. Focus on 2010
WHERE year = 2010;


-- ################### --
-- 6)Modify your code to calculate the average GDP per capita AS avg_gdp for each region in 2010.
-- Select the region and avg_gdp fields.
-- Select fields
SELECT c.region, AVG(e.gdp_percapita) AS avg_gdp
-- From countries (alias as c)
FROM countries AS c
    -- Left join with economies (alias as e)
    LEFT JOIN economies AS e
    -- Match on code fields
    ON c.code = e.code
-- Focus on 2010
WHERE year = 2010
-- Group by region
GROUP BY region;

-- ##################### --
-- 7) Arrange this data on average GDP per capita for each region in 2010 from highest to lowest average GDP per capita.
-- Select fields
SELECT region, AVG(gdp_percapita) AS avg_gdp
-- From countries (alias as c)
FROM countries AS c
    -- Left join with economies (alias as e)
    LEFT JOIN economies AS e
    -- Match on code fields
    ON c.code = e.code
-- Focus on 2010
WHERE year = 2010
-- Group by region
GROUP BY region
-- Order by descending avg_gdp
ORDER BY avg_gdp DESC;

-- #################### --
-- 8) The left join code is commented out here. Your task is to write a new query using rights joins that produces the same result as what the query using left joins produces. Keep this left joins code commented as you write your own query just below it using right joins to solve the problem.

-- Note the order of the joins matters in your conversion to using right joins!
-- convert this code to use RIGHT JOINs instead of LEFT JOINs
/*
SELECT cities.name AS city, urbanarea_pop, countries.name AS country,
       indep_year, languages.name AS language, percent
FROM cities
  LEFT JOIN countries
    ON cities.country_code = countries.code
  LEFT JOIN languages
    ON countries.code = languages.code
ORDER BY city, language;
*/

SELECT cities.name AS city, urbanarea_pop, countries.name AS country,
    indep_year, languages.name AS language, percent
FROM languages
    RIGHT JOIN countries
    ON languages.code = countries.code
    RIGHT JOIN cities
    ON countries.code = cities.country_code
ORDER BY city, language;
