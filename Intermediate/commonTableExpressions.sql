-- 1 ) Create a CTE BloodGlucoseRandom that returns one column (MaxGlucose) which contains the maximum BloodGlucoseRandom in the table.
-- Join the CTE to the main table (Kidney) on BloodGlucoseRandom and MaxGlucose.
-- Specify the keyowrds to create the CTE
WITH
    BloodGlucoseRandom (MaxGlucose)
    AS
    (
        SELECT MAX(BloodGlucoseRandom) AS MaxGlucose
        FROM Kidney
    )

SELECT a.Age, b.MaxGlucose
FROM Kidney a
    -- Join the CTE on blood glucose equal to max blood glucose
    JOIN BloodGlucoseRandom b
    ON a.BloodGlucoseRandom = b.MaxGlucose

-- ################# --
-- 2) Create a CTE BloodPressure that returns one column (MaxBloodPressure) which contains the maximum BloodPressure in the table.
-- Join this CTE (using an alias b) to the main table (Kidney) to return information about patients with the maximum BloodPressure.

-- Create the CTE
WITH
    BloodPressure
    AS
    (
        SELECT MAX(BloodPressure) AS MaxBloodPressure
        FROM Kidney
    )

SELECT *
FROM Kidney a
    -- Join the CTE  
    JOIN BloodPressure b
    ON a.BloodPressure = b.MaxBloodPressure