-- 1) Again, order by code and then by year, both in ascending order.

-- Note the number of records here (given at the bottom of query result) compared to the similar UNION ALL query result (814 records).
-- Select fields
    SELECT code, year
    -- From economies
    FROM economies
    -- Set theory clause
INTERSECT
    -- Select fields
    SELECT country_code, year
    -- From populations
    FROM populations
-- Order by code and year
ORDER BY code, year;

-- ######################## --
-- 2) Use INTERSECT to answer this question with countries and cities!
-- Select fields
    SELECT name
    -- From countries
    FROM countries
    -- Set theory clause
INTERSECT
    -- Select fields
    SELECT name
    -- From cities
    FROM cities;