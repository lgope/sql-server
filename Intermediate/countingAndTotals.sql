-- 1) Write a T-SQL query which will return the sum of the Quantity column as Total for each type of MixDesc.
-- Write a query that returns an aggregation 
SELECT MixDesc, SUM(Quantity) AS Total
FROM Shipments
-- Group by the relevant column
GROUP BY MixDesc

-- ################## --
-- 2) Create a query that returns the number of rows for each type of MixDesc.
-- Count the number of rows by MixDesc
SELECT MixDesc, COUNT(MixDesc)
FROM Shipments
GROUP BY MixDesc