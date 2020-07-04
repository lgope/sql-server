-- Alias the new average BMI column as AvgTeamBMI.
-- Alias the PlayerStats table as ps.
-- Alias the sub-query as p.
-- The PlayerStats table and sub-query are joining on the column PlayerName. Add the aliases to the joining PlayerName columns.

SELECT Team,
    ROUND(AVG(BMI),2) AS AvgTeamBMI
-- Alias the new column
FROM PlayerStats AS ps -- Alias PlayerStats table
    INNER JOIN
    (SELECT PlayerName, Country,
        Weight_kg/SQUARE(Height_cm/100) BMI
    FROM Players) AS p -- Alias the sub-query
    -- Alias the joining columns
    ON ps.PlayerName = p.PlayerName
GROUP BY Team
HAVING AVG(BMI) >= 25;