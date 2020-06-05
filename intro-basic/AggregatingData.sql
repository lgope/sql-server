-- Database (grid)

/*
grid_id	        description	         event_year	event_date	restore_date  nerc_region	demand_loss_mw	affected_customers
    1	Severe Weather Thunderstorms	2014	2014-06-30	2014-07-01	    RFC	            null        	127000
    2	Severe Weather Thunderstorms	2014	2014-06-30	2014-07-01	    MRO	            424	1           20000
    3	Fuel Supply Emergency  Coal	    2014	2014-06-27	null	        MRO	            null           	null
    4	Physical Attack Vandalism	    2014	2014-06-24	2014-06-24  	SERC	        null	        null
    5	Physical Attack Vandalism	    2014	2014-06-19	2014-06-19  	SERC	        null	        null
    6	Physical Attack Vandalism	    2014	2014-06-18	2014-06-18  	WECC	        null        	null
    7	Severe Weather Thunderstorms	2014	2014-06-18	2014-06-20  	RFC	            null        	138802
    8	Severe Weather Thunderstorms	2014	2014-06-15	2014-06-15  	MRO	            null	        55951
    9	Suspected Physical Attack	    2014	2014-06-12	2014-06-12	    ERCOT	        null	        null
    10	Physical Attack Vandalism	    2014	2014-06-11	2014-06-11	    SERC	        null        	null

*/

-- 1) Obtain a grand total of the demand_loss_mw column by using the SUM function, and alias the result as MRO_demand_loss.
-- Sum the demand_loss_mw column
SELECT
    SUM(demand_loss_mw) AS MRO_demand_loss
FROM
    grid
WHERE
  -- demand_loss_mw should not contain NULL values
  demand_loss_mw IS NOT NULL
    -- and nerc_region should be 'MRO';
    AND nerc_region = 'MRO';


-- 2) Return the COUNT of the grid_id column, aliasing the result as grid_total.
-- Obtain a count of 'grid_id'
SELECT
    COUNT(grid_id) AS grid_total
FROM
    grid;

-- 3) Make the count more meaningful by restricting it to records where the nerc_region is 'RFC'. Name the result RFC_count.
-- Obtain a count of 'grid_id'
SELECT
    COUNT(grid_id) AS RFC_count
FROM
    grid
-- Restrict to rows where the nerc_region is 'RFC'
WHERE
  nerc_region = 'RFC';

-- 4) Find the minimum value from the affected_customers column, but only for rows where demand_loss_mw has a value. Name the result min_affected_customers.
-- Find the minimum number of affected customers
SELECT
    MIN(affected_customers) AS min_affected_customers
FROM
    grid
-- Only retrieve rows where demand_loss_mw has a value
WHERE
  demand_loss_mw IS NOT NULL;

-- 5) Find the maximum value from the affected_customers column, but only for rows where demand_loss_mw has a value. Name the result min_affected_customers.
-- Find the minimum number of affected customers
-- Find the maximum number of affected customers
SELECT
    MAX(affected_customers) AS max_affected_customers
FROM
    grid
-- Only retrieve rows where demand_loss_mw has a value
WHERE 
  demand_loss_mw IS NOT NULL;


-- 6) Return the average value from the affected_customers column, this time aliasing as avg_affected_customers.
-- Find the average number of affected customers
SELECT
    AVG(affected_customers) AS avg_affected_customers
FROM
    grid
-- Only retrieve rows where demand_loss_mw has a value
WHERE 
  demand_loss_mw IS NOT NULL;