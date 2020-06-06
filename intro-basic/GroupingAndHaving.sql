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

-- 1) Select nerc_region and the sum of demand_loss_mw for each region.Exclude values where demand_loss_mw is NULL.Group the results by nerc_region.Arrange in descending order of demand_loss.

-- Select the region column
SELECT
    nerc_region,
    -- Sum the demand_loss_mw column
    SUM(demand_loss_mw) AS demand_loss
FROM
    grid
-- Exclude NULL values of demand_loss
WHERE 
  demand_loss_mw IS NOT NULL
-- Group the results by nerc_region
GROUP BY 
  nerc_region
-- Order the results in descending order of demand_loss
ORDER BY 
  demand_loss DESC;



-- ==========================================
-- 2) Having
SELECT
    nerc_region,
    SUM (demand_loss_mw) AS demand_loss
FROM
    grid

WHERE demand_loss_mw  IS NOT NULL
GROUP BY 
  nerc_region
-- Enter a new HAVING clause so that the sum of demand_loss_mw is greater than 10000
HAVING 
  SUM(demand_loss_mw) > 10000
ORDER BY 
  demand_loss DESC;


-- ==========================================
/*  eurovision
euro_id	event_year	country	gender	group_type	place	points	host_country	host_region	is_final	sf_number	song_in_english
 1	    2009	    Israel	Female	    Group	    16	    53  	Away    	Away	        1	        null	    1
 2	    2009	    France	Female  	Solo	    8	    107 	Away    	Away        	1       	null	    0
 3	    2009	    Sweden	Female  	Solo	    21  	33  	Away    	Away          	1       	null	    1
 4	    2009	    Croatia	Both	    Group	    18  	45  	Away    	Away     	    1       	null	    0
 5	    2009	    PortugalBoth	    Group	    15  	57  	Away    	Away        	1       	null	    0
 6	    2009	    Iceland	Female  	Solo	    2	    218 	Away    	Away        	1       	null	    1
 7	    2009	    Greece	Male	    Solo	    7	    120 	Away	    Away        	1       	null	    1
 8	    2009	    Armenia	Female  	Group	    10  	92  	Away    	Home        	1   	    null    	1
 9	    2009	    Russia	Female  	Solo	    11	    91  	Home	    Home        	1       	null	    0
 10	    2009	    Azerbaijan	Both	Group	    3	    207	    Away    	Home        	1       	null    	1
*/

-- 3) Use MIN and MAX to retrieve the minimum and maximum values for the place and points columns respectively.
-- Retrieve the minimum and maximum place values
SELECT
    MIN(place) AS min_place,
    MAX(place) AS max_place,
    -- Retrieve the minimum and maximum points values
    MIN(points) AS min_points,
    MAX(points) AS max_points
FROM
    eurovision;


-- ==========================================
-- 4) Let's obtain more insight from our results by adding a GROUP BY clause. Group the results by country.
-- Retrieve the minimum and maximum place values
SELECT
    MIN(place) AS min_place,
    MAX(place) AS max_place,
    -- Retrieve the minimum and maximum points values
    MIN(points) AS min_points,
    MAX(points) AS max_points
FROM
    eurovision
-- Group by country
GROUP BY
  country;


-- 5) The previous query results did not identify the country. Let's amend the query, returning the count of entries per country and the country column. Complete the aggregate section by finding the average place for each country.
-- Obtain a count for each country
SELECT
    count(country) AS country_count,
    -- Retrieve the country column
    country,
    -- Return the average of the Place column 
    AVG(place) AS average_place,
    AVG(points) AS avg_points,
    MIN(points) AS min_points,
    MAX(points) AS max_points
FROM
    eurovision
GROUP BY 
  country;

-- 6} Finally, our results are skewed by countries who only have one entry. Apply a filter so we only return rows where the country_count is greater than 5. Then arrange by avg_place in ascending order, and avg_points in descending order.
SELECT
    country,
    COUNT (country) AS country_count,
    AVG (place) AS avg_place,
    AVG (points) AS avg_points,
    MIN (points) AS min_points,
    MAX (points) AS max_points
FROM
    eurovision
GROUP BY 
  country
-- The country column should only contain those with a count greater than 5
HAVING 
  COUNT(country) > 5
-- Arrange columns in the correct order
ORDER BY 
  avg_place, 
  avg_points DESC;