-- 1) Return MaxGlucose from the derived table.Join the derived table to the main query on Age.
SELECT a.RecordId, a.Age, a.BloodGlucoseRandom,
    -- Select maximum glucose value (use colname from derived table)    
    b.MaxGlucose
FROM Kidney a
    -- Join to derived table
    JOIN (SELECT Age, MAX(BloodGlucoseRandom) AS MaxGlucose
    FROM Kidney
    GROUP BY Age) b
    -- Join on Age
    ON a.Age = b.Age

-- ################## --
-- 2) Create a derived table
-- returning Age and MaxBloodPressure; the latter is the maximum of BloodPressure.
-- is taken from the kidney table.
-- is grouped by Age.
-- Join the derived table to the main query on
-- blood pressure equal to max blood pressure.
-- age.
SELECT *
FROM Kidney a
    -- Create derived table: select age, max blood pressure from kidney grouped by age
    JOIN (SELECT Age, MAX(BloodPressure) AS MaxBloodPressure
    FROM kidney
    GROUP BY Age) b
    -- JOIN on BloodPressure equal to MaxBloodPressure
    ON a.BloodPressure = b.MaxBloodPressure
        -- Join on Age
        AND b.Age = a.Age