-- 1) Write a T-SQL query that returns the sum of OrderPrice by creating partitions for each TerritoryName.
SELECT OrderID, TerritoryName,
    -- Total price for each partition
    SUM(OrderPrice) 
       -- Create the window and partitions
       OVER(PARTITION BY TerritoryName) AS TotalPrice
FROM Orders

-- ########### --
-- 2) Count the number of rows in each partition.
-- Partition the table by TerritoryName.
SELECT OrderID, TerritoryName,
    -- Number of rows per partition
    COUNT(TerritoryName) 
       -- Create the window and partitions
       OVER(PARTITION BY TerritoryName) AS TotalOrders
FROM Orders