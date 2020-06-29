-- 1) Select unique country names. Also select the total investment and imports fields.

-- Use a left join with countries on the left. (An inner join would also work, but please use a left join here.)

-- Match on code in the two tables AND use a subquery inside of ON to choose the appropriate languages records.

-- Order by country name ascending.

-- Use table aliasing but not field aliasing in this exercise.
-- Select fields
SELECT DISTINCT c.name, e.total_investment, e.imports
-- From table (with alias)
FROM countries AS c
    -- Join with table (with alias)
    LEFT JOIN economies AS e
    -- Match on code
    ON (c.code = e.code
        -- and code in Subquery
        AND c.code IN (
          SELECT l.code
        FROM languages AS l
        WHERE official = 'true'
        ) )
-- Where region and year are correct
WHERE region = 'Central America' AND year = 2015
-- Order by field
ORDER BY name;

-- ############################# --
-- 2) Include the name of region, its continent, and average fertility rate aliased as avg_fert_rate.

-- Sort based on avg_fert_rate ascending.

-- Remember that you'll need to GROUP BY all fields that aren't included in the aggregate function of SELECT.
-- Select fields
SELECT c.region, c.continent, AVG(p.fertility_rate) AS avg_fert_rate
-- From left table
FROM populations AS p
    -- Join to right table
    INNER JOIN countries AS c
    -- Match on join condition
    ON p.country_code = c.code
-- Where specific records matching some condition
WHERE year = 2015
-- Group appropriately
GROUP BY c.region, c.continent
-- Order appropriately
ORDER BY avg_fert_rate;

-- ############################ --
-- 3) Select the city name, country code, city proper population, and metro area population.
-- Calculate the percentage of metro area population composed of city proper population for each city in cities, aliased as city_perc.
-- Focus only on capital cities in Europe and the Americas in a subquery.
-- Make sure to exclude records with missing data on metro area population.
-- Order the result by city_perc descending.
-- Then determine the top 10 capital cities in Europe and the Americas in terms of this city_perc percentage.
-- Select fields
SELECT name, country_code, city_proper_pop, metroarea_pop,
    -- Calculate city_perc
    city_proper_pop / metroarea_pop * 100 AS city_perc
-- From appropriate table
FROM cities
-- Where 
WHERE name IN
    -- Subquery
    (SELECT capital
    FROM countries
    WHERE (continent = 'Europe'
        OR continent LIKE '%America'))
    AND metroarea_pop IS NOT NULL
-- Order appropriately
ORDER BY city_perc DESC
-- Limit amount
LIMIT 10;