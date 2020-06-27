-- 1) Create the cross join as described above. (Recall that cross joins do not use ON or USING.)

-- Make use of LIKE and Hyder% to choose Hyderabad in both countries.

-- Select only the city name AS city and language name AS language.
-- 4. Select fields
SELECT c.name AS city, l.name AS language
-- 1. From cities (alias as c)
FROM cities AS c        
  -- 2. Join to languages (alias as l)
  CROSS JOIN languages AS l
-- 3. Where c.name like Hyderabad
WHERE c.name LIKE 'Hyder%';

-- ################# --
-- 2) Use an inner join instead of a cross join. Think about what the difference will be in the results for this inner join result and the one for the cross join.
-- 5. Select fields
SELECT c.name AS city, l.name AS language
-- 1. From cities (alias as c)
FROM cities AS c
    -- 2. Join to languages (alias as l)
    INNER JOIN languages AS l
    -- 3. Match on country code
    ON c.country_code = l.code
-- 4. Where c.name like Hyderabad
WHERE c.name LIKE 'Hyder%';

-- ################# --
-- 3 ) Select country name AS country, region, and life expectancy AS life_exp.

-- Make sure to use LEFT JOIN, WHERE, ORDER BY, and LIMIT.
-- Select fields
SELECT c.name AS country, c.region, p.life_expectancy AS life_exp
-- From countries (alias as c)
FROM countries AS c
    -- Join to populations (alias as p)
    LEFT JOIN populations AS p
    -- Match on country code
    ON c.code = p.country_code
-- Focus on 2010
WHERE year = 2010
-- Order by life_exp
ORDER BY life_exp
-- Limit to 5 records
LIMIT 5;