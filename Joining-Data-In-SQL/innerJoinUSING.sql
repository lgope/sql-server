-- 1) Inner join countries on the left and languages on the right with USING(code).
-- Select the fields corresponding to:
-- country name AS country,
-- continent name,
-- language name AS language, and
-- whether or not the language is official.
-- Remember to alias your tables using the first letter of their names.
-- 4. Select fields
SELECT
    -- 1. From countries (alias as c)
    c.name AS country, c.continent, l.name AS language, l.official
FROM countries AS c
    -- 2. Join to languages (as l)
    INNER JOIN languages AS l 
    -- 3. Match using code
    USING(code);