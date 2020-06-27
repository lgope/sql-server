-- 1 Choose records in which region corresponds to North America or is NULL.
SELECT name AS country, code, region, basic_unit
-- 3. From countries
FROM countries
    -- 4. Join to currencies
    FULL JOIN currencies
    -- 5. Match on code
    USING (code) 
-- 1. Where region is North America or null
WHERE region = 'North America' OR region IS NULL
-- 2. Order by region
ORDER BY region;

-- ####################### --
-- 2) Repeat the same query as above but use a LEFT JOIN instead of a FULL JOIN. Note what has changed compared to the FULL JOIN result!
SELECT name AS country, code, region, basic_unit
-- 1. From countries
FROM countries
    -- 2. Join to currencies
    LEFT JOIN currencies
    -- 3. Match on code
    USING (code) 
-- 4. Where region is North America or null
WHERE region = 'North America' OR region IS NULL
-- 5. Order by region
ORDER BY region;


-- ####################### --
-- 3) Repeat the same query as above but use an INNER JOIN instead of a FULL JOIN. Note what has changed compared to the FULL JOIN and LEFT JOIN results!
SELECT name AS country, code, region, basic_unit
FROM countries
    -- 1. Join to currencies
    INNER JOIN currencies
    USING (code) 
-- 2. Where region is North America or null
WHERE region = 'North America' OR region IS NULL
-- 3. Order by region
ORDER BY region;

-- ####################### --
-- 4) Choose records in which countries.name starts with the capital letter 'V' or is NULL.
-- Arrange by countries.name in ascending order to more clearly see the results.
SELECT countries.name, code, languages.name AS language
-- 3. From languages
FROM languages
    -- 4. Join to countries
    FULL JOIN countries
    -- 5. Match on code
    USING (code) 
-- 1. Where countries.name starts with V or is null
WHERE countries.name LIKE 'V%' OR countries.name IS NULL
-- 2. Order by ascending countries.name
ORDER BY countries.name;

-- ####################### --
-- 5) Repeat the same query as above but use a left join instead of a full join. Note what has changed compared to the full join result!
SELECT countries.name, code, languages.name AS language
FROM languages
    -- 1. Join to countries
    LEFT JOIN countries
    -- 2. Match using code
    USING (code) 
-- 3. Where countries.name starts with V or is null
WHERE countries.name LIKE 'V%' OR countries.name IS NULL
ORDER BY countries.name;


-- ####################### --
-- 6) Repeat once more, but use an inner join instead of a left join. Note what has changed compared to the full join and left join results.
SELECT countries.name, code, languages.name AS language
FROM languages
    -- 1. Join to countries
    INNER JOIN countries
    USING (code) 
-- 2. Where countries.name starts with V or is null
WHERE countries.name LIKE 'V%' OR countries.name IS NULL
ORDER BY countries.name;


-- ####################### --

-- 7) Complete a full join with countries on the left and languages on the right.

-- Next, full join this result with currencies on the right.

-- Use LIKE to choose the Melanesia and Micronesia regions (Hint: 'M%esia').

-- Select the fields corresponding to the country name AS country, region, language name AS language, and basic and fractional units of currency.
-- 7. Select fields (with aliases)
SELECT c1.name AS country, c1.region, l.name AS language,
    c2.basic_unit, c2.frac_unit
-- 1. From countries (alias as c1)
FROM countries AS c1
    -- 2. Join with languages (alias as l)
    FULL JOIN languages AS l 
    -- 3. Match on code
    USING (code)
    -- 4. Join with currencies (alias as c2)
    FULL JOIN currencies AS c2 
    -- 5. Match on code
    USING (code)
-- 6. Where region like Melanesia and Micronesia
WHERE region LIKE 'M%esia';