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