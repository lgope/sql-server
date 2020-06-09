-- 1) Write a query that returns the number of days between OrderDate and ShipDate.
-- Return the difference in OrderDate and ShipDate
SELECT OrderDate, ShipDate,
    DATEDIFF(DD, OrderDate, ShipDate) AS Duration
FROM Shipments

-- ############# --
-- 2) Write a query that returns the approximate delivery date as five days after the ShipDate.
-- Return the DeliveryDate as 5 days after the ShipDate
SELECT OrderDate,
    DATEADD(DD, 5, ShipDate) AS DeliveryDate
FROM Shipments