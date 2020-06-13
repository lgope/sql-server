-- 1)Write a T-SQL query that returns the first OrderDate by creating partitions for each TerritoryName.
SELECT TerritoryName, OrderDate,
    -- Select the first value in each partition
    FIRST_VALUE(OrderDate) 
       -- Create the partitions and arrange the rows
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS FirstOrder
FROM Orders

-- ################# --
-- 2) Write a T-SQL query that for each territory:
-- Shifts the values in OrderDate one row down. Call this column PreviousOrder.
-- Shifts the values in OrderDate one row up. Call this column NextOrder. You will need to PARTITION BY the territory
SELECT TerritoryName, OrderDate,
    -- Specify the previous OrderDate in the window
    LAG(OrderDate) 
       -- Over the window, partition by territory & order by order date
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS PreviousOrder,
    -- Specify the next OrderDate in the window
    LEAD(OrderDate) 
       -- Create the partitions and arrange the rows
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS NextOrder
FROM Orders