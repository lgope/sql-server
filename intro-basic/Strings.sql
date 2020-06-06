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

-- 1) Retrieve the length of the description column, returning the results as description_length.
-- Calculate the length of the description column
SELECT
    LEN (description) AS description_length
FROM
    grid;

-- 2) Retrieve the first 25 characters from the description column in the grid table. Name the results first_25_left.
-- Select the first 25 characters from the left of the description column
SELECT
    LEFT(description, 25) AS first_25_left
FROM
    grid;


-- 3) Retrieve the first 25 characters from the description column in the grid table. Name the results last_25_right.
-- select 25 characters from the  right of the description column
SELECT
    RIGHT(description, 25) AS last_25_right
FROM
    grid;



-- 4) You can use CHARINDEX to find a specific character or pattern within a column. Edit the query to return the CHARINDEX of the string 'Weather' whenever it appears within the description column.
-- Complete the query to find `Weather` within the description column
SELECT
    description,
    CHARINDEX('Weather', description)
FROM
    grid
WHERE description LIKE '%Weather%';

-- 5) We now know where 'Weather' begins in the description column. But where does it end? We could manually count the number of characters, but, for longer strings, this is more work, especially when we can also find the length with LEN.
-- Complete the query to find the length of `Weather'
SELECT
    description,
    CHARINDEX('Weather', description) AS start_of_string,
    LEN('Weather') AS length_of_string
FROM
    grid
WHERE description LIKE '%Weather%';

-- 6) Now we use SUBSTRING to return everything after Weather for the first ten rows. The start index here is 15, because the CHARINDEX for each row is 8, and the LEN of Weather is 7.

-- Complete the substring function to begin extracting from the correct character in the description column
SELECT TOP (10)
    description,
    CHARINDEX('Weather', description) AS start_of_string,
    LEN ('Weather') AS length_of_string,
    SUBSTRING(
    description, 
    15, 
    LEN(description)
  ) AS additional_description
FROM
    grid
WHERE description LIKE '%Weather%';