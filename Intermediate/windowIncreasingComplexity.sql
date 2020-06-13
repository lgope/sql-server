-- 1) Create the window, partition by TerritoryName and order by OrderDate to calculate a running total of OrderPrice.

SELECT TerritoryName, OrderDate,
    -- Create a running total
    SUM(OrderPrice) 
       -- Create the partitions and arrange the rows
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS TerritoryTotal
FROM Orders


-- ################ --
-- 2) Write a T-SQL query that assigns row numbers to all records partitioned by TerritoryName and ordered by OrderDate.
SELECT TerritoryName, OrderDate,
    -- Assign a row number
    ROW_NUMBER() 
       -- Create the partitions and arrange the rows
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS OrderCount
FROM Orders