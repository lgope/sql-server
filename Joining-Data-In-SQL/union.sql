-- 1) Combine these two tables into one table containing all of the fields in economies2010. The economies table is also included for reference.

-- Sort this resulting single table by country code and then by year, both in ascending order.

-- Select fields from 2010 table
    SELECT *
    -- From 2010 table
    FROM economies2010
    -- Set theory clause
UNION
    -- Select fields from 2015 table
    SELECT *
    -- From 2015 table
    FROM economies2015
-- Order by code and year
ORDER BY code, year;


-- ######################## --
-- 2) Determine all (non-duplicated) country codes in either the cities or the currencies table. The result should be a table with only one field called country_code.
-- Sort by country_code in alphabetical order.

-- Select field
    SELECT country_code
    -- From cities
    FROM cities
    -- Set theory clause
UNION
    -- Select field
    SELECT code
    -- From currencies
    FROM currencies
-- Order by country_code
ORDER BY country_code;

-- ######################## --
-- 3) Determine all combinations (include duplicates) of country code and year that exist in either the economies or the populations tables. Order by code then year.
-- The result of the query should only have two columns/fields. Think about how many records this query should result in.
-- You'll use code very similar to this in your next exercise after the video. Make note of this code after completing it.
-- Select fields
    SELECT code, year
    -- From economies
    FROM economies
    -- Set theory clause
UNION ALL
    -- Select fields
    SELECT country_code, year
    -- From populations
    FROM populations
-- Order by code, year
ORDER BY code, year;