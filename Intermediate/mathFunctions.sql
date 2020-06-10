-- ABS(), SQRT(), LOG(), SQUARE()

-- 1) Write a query that converts all the negative values in the DeliveryWeight column to positive values.
-- Return the absolute value of DeliveryWeight
SELECT DeliveryWeight,
    ABS(DeliveryWeight) AS AbsoluteValue
FROM Shipments

-- ############### --
-- 2 ) Write a query that calculates the square and square root of the WeightValue column.
-- Return the square and square root of WeightValue
SELECT WeightValue,
    SQUARE(WeightValue) AS WeightSquare,
    SQRT(WeightValue) AS WeightSqrt
FROM Shipments
