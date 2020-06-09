-- NULL | NOT NULL | LEN(col) > 0 |  ISNULL(, ,) | COALESCE(v1, v2..)

-- Database (Incidents)

/*
IncidentDateTime	    City	        IncidentState	Country	    Shape	DurationSeconds	Comments
2005-10-31 18:00:00	    poughkeepsie	    ny	            us	    light	    37800	        Several bright lights moving erratically
2005-10-31 18:30:00	    linwood	            nj	            us	    light	    5	            VERY bright apparent meteor over Southern New Jersey
2005-10-31 19:00:00	    clarksville	        md	            us	    other	    5	            White ball shaped bright object whizzing across 
2005-10-31 19:00:00	    newark	            de	            us	    light	    45	            Very fast&#44 brillant bluish/white light travelling
2005-10-31 19:00:00	    scottsdale	        az	            us	    triangle	600	            Gilbert
2005-10-31 19:15:00	    chambersburg	    pa	            us	    fireball	20	            Fireball
2005-10-31 19:30:00	    scottsdale	        az	            us	    triangle	120	            On Halloween Night 2005&#44 3 Lights in shape.
2005-10-31 19:40:00	    bristol	            tn	            us	    changing	90	            TENNESSEE MUFON REPORT:  Slowly falling&#44
2005-10-31 20:00:00	    fairfield	        ca	            us	    triangle	20	            Triangular craft hovering over highway
2005-10-31 20:30:00	    greensboro	        md	            us	    fireball	60	            At about 8:30 EST  on 10/31/05 Something lit up
2005-10-31 21:00:00	    augusta springs	    va	            us	    unknown	    60	            We saw an unusual bright blue flash in the sky
2005-10-31 21:00:00	    greensboro	        nc	            us	    flash	    15	            Driving north on rt. 220 towards Va. Approx. 9 p.m.
2005-10-31 21:00:00	    johnstown	        pa	            us	    egg	        180	            lights in SW sky 10/31/05 9pm
2005-10-31 21:10:00	    mt. pleasant	    pa	            us	    flash	    15	            Bright green stream of light that was moving south
2005-10-31 21:15:00	    leesburg	        va	            us	    NULL	    2	            Very bright flash with a tail seen in the night sky
2005-10-31 21:17:00	    charlottesville	    va	            us	    fireball	10	            Bright fiery contrail in eastern night sky
*/




-- 1) Write a T-SQL query which returns only the IncidentDateTime and IncidentState columns where IncidentState is not missing.

-- Return the specified columns
SELECT IncidentDateTime, IncidentState
FROM Incidents
-- Exclude all the missing values from IncidentState  
WHERE IncidentState IS NOT NULL

-- ################ --
-- 2) Write a T-SQL query which only returns rows where IncidentState is missing.Replace all the missing values in the IncidentState column with the values in the City column and name this new column Location.
-- Check the IncidentState column for missing values and replace them with the City column
SELECT IncidentState, ISNULL(IncidentState, City) AS Location
FROM Incidents
-- Filter to only return missing values from IncidentState
WHERE IncidentState IS NULL

-- ################ --
-- 3) Replace missing values in Country with the first non-missing value from IncidentState or City, in that order. Name the new column Location.
-- Replace missing values 
SELECT Country, COALESCE(IncidentState, City, 'Unknown') AS Location
FROM Incidents
WHERE Country IS NULL