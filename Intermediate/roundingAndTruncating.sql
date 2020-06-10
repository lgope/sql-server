-- 1) Write a SQL query to round the values in the Cost column to the nearest whole number.
-- Round Cost to the nearest dollar
SELECT Cost,
    ROUND(Cost, 0) AS RoundedCost
FROM Shipments


-- ############ --
-- 2) Write a SQL query to truncate the values in the Cost column to the nearest whole number.
-- Truncate cost to whole number
SELECT Cost,
    ROUND(Cost, 0, 1) AS TruncateCost
FROM Shipments