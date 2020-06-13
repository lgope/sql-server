-- 1)  Create the window, partition by TerritoryName and order by OrderDate to calculate a running standard deviation of OrderPrice.
SELECT OrderDate, TerritoryName,
    -- Calculate the standard deviation
    STDEV(OrderPrice) 
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS StdDevPrice
FROM Orders

-- ############### --
-- 2) Create a CTE ModePrice that returns two columns (OrderPrice and UnitPriceFrequency).
-- Write a query that returns all rows in this CTE.
-- Create a CTE Called ModePrice which contains two columns
WITH ModePrice
(OrderPrice, UnitPriceFrequency)
AS
(
	SELECT OrderPrice,
    ROW_NUMBER() 
	OVER(PARTITION BY OrderPrice ORDER BY OrderPrice) AS UnitPriceFrequency
FROM Orders 
)

-- Select everything from the CTE
SELECT *
FROM ModePrice

-- ############### --
-- 3) Use the CTE ModePrice to return the value of OrderPrice with the highest row number.
-- CTE from the previous exercise
WITH ModePrice
(OrderPrice, UnitPriceFrequency)
AS
(
	SELECT OrderPrice,
    ROW_NUMBER() 
    OVER (PARTITION BY OrderPrice ORDER BY OrderPrice) AS UnitPriceFrequency
FROM Orders
)

-- Select the order price from the CTE
SELECT OrderPrice AS ModeOrderPrice
FROM ModePrice
-- Select the maximum UnitPriceFrequency from the CTE
WHERE UnitPriceFrequency IN (SELECT MAX(UnitPriceFrequency)
FROM ModePrice)