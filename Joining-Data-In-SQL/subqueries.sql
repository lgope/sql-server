-- 1) Begin by calculating the average life expectancy across all countries for 2015.
-- Select average life_expectancy
SELECT AVG(life_expectancy)
-- From populations
FROM populations
-- Where year is 2015
WHERE year = 2015

-- ###################### --
-- 2) Recall that you can use SQL to do calculations for you. Suppose we wanted only records that were above 1.15 * 100 in terms of life expectancy for 2015:

/* SELECT *
  FROM populations
WHERE life_expectancy > 1.15 * 100
  AND year = 2015; */

--   Select all fields from populations with records corresponding to larger than 1.15 times the average you calculated in the first task for 2015. In other words, change the 100 in the example above with a subquery.


-- Select fields
SELECT *
-- From populations
FROM populations
-- Where life_expectancy is greater than
WHERE life_expectancy > 1.15 *
  -- 1.15 * subquery
  (SELECT AVG(life_expectancy)
    FROM populations
    WHERE year = 2015)
    AND year = 2015;

-- ###################### --
-- 3) Make use of the capital field in the countries table in your subquery.
-- Select the city name, country code, and urban area population fields.
-- 2. Select fields
SELECT name, country_code, urbanarea_pop
-- 3. From cities
FROM cities
-- 4. Where city name in the field of capital cities
WHERE name IN
  -- 1. Subquery
  (SELECT capital
FROM countries)
ORDER BY urbanarea_pop DESC;

-- TEST QUERY
SELECT countries.name AS country, COUNT(*) AS cities_num
FROM cities
    INNER JOIN countries
    ON countries.code = cities.country_code
GROUP BY country
ORDER BY cities_num DESC, country
LIMIT 9;


-- ####################### --
-- 4) Remove the comments around the second query and comment out the first query instead.
-- Convert the GROUP BY code to use a subquery inside of SELECT, i.e. fill in the blanks to get a result that matches the one given using the GROUP BY code in the first query.
-- Again, sort the result by cities_num descending and then by country ascending.
SELECT countries
.name AS country,
(SELECT COUNT(*)
FROM cities
WHERE countries.code = cities.country_code)
AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;