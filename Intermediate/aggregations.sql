-- 1) Write a T-SQL query which will return the average, minimum, and maximum values of the DurationSeconds column.

-- Calculate the average, minimum and maximum
SELECT AVG(DurationSeconds) AS Average,
    MIN(DurationSeconds) AS Minimum,
    MAX(DurationSeconds) AS Maximum
FROM Incidents

-- #################### --

-- 2) Update the query to return only the records where the minimum of DurationSeconds column is greater than 1.
-- Calculate the aggregations by Shape
SELECT Shape,
    AVG(DurationSeconds) AS Average,
    MIN(DurationSeconds) AS Minimum,
    MAX(DurationSeconds) AS Maximum
FROM Incidents
GROUP BY Shape
-- Return records where minimum of DurationSeconds is greater than 1
HAVING MIN(DurationSeconds) > 1