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

-- Select description and event_date from grid. Your query should return the first 5 rows, ordered by event_date.

-- Select the first 5 rows from the specified columns
SELECT
    TOP (5)
    description,
    event_date
FROM
    grid
-- Order your results by the event_date column
ORDER BY
  event_date;



-- Select the top 20 rows from description, nerc_region and event_date
SELECT
    TOP (20)
    description,
    nerc_region,
    event_date
FROM
    grid
-- Order by nerc_region, affected_customers & event_date
-- Event_date should be in descending order
ORDER BY
  nerc_region,
  affected_customers,
  event_date DESC;


-- Select the description and event_year columns.
-- Return rows WHERE the description is 'Vandalism'.

-- Select description and event_year
SELECT
    description,
    event_year
FROM
    grid
-- Filter the results
WHERE 
  description = 'Vandalism';

-- Select the nerc_region and demand_loss_mw columns, limiting the results to those where affected_customers is greater than or equal to 500000.

-- Select nerc_region and demand_loss_mw
SELECT
    nerc_region,
    demand_loss_mw
FROM
    grid
-- Retrieve rows where affected_customers is >= 500000  
WHERE 
  affected_customers >= 500000;


-- Update your code to select description and affected_customers, returning records where the event_date was the 22nd December, 2013.

-- Select description and affected customers
SELECT
    description,
    affected_customers
FROM
    grid
-- Retrieve rows where the event_date was the 22nd December, 2013    
WHERE 
  event_date = '2013-12-22';

-- Limit the results to those where the affected_customers is BETWEEN 50000 and 150000, and order in descending order of event_date.

-- Select description, affected_customers and event date
SELECT
    description,
    affected_customers,
    event_date
FROM
    grid
-- The affected_customers column should be >= 50000 and <=150000   
WHERE 
  affected_customers BETWEEN 50000
  AND 150000
-- Define the order   
ORDER BY 
  event_date DESC;


-- Use a shortcut to select all columns from grid. Then filter the results to only include rows where demand_loss_mw is unknown or missing.

-- Retrieve all columns
SELECT
    *
FROM
    grid
-- Return only rows where demand_loss_mw is missing or unknown  
WHERE 
  demand_loss_mw IS NULL;

-- Adapt your code to return rows where demand_loss_mw is not unknown or missing.

-- Retrieve all columns
SELECT
    *
FROM
    grid
-- Return rows where demand_loss_mw is not missing or unknown   
WHERE 
  demand_loss_mw IS NOT NULL;


-- Database (songlist)

/*
songlistID	song	                artist	        release_year	    combined
    1	    Keep On Loving You	    REO Speedwagon	    1980	        Keep On Loving You by REO Speedwagon
    2	    Keep Pushin  1977	    REO Speedwagon	    null	        Keep Pushin  1977 by REO Speedwagon
    3	    Like You Do	            REO Speedwagon	    null	        Like You Do by REO Speedwagon
    4	    Ridin the Storm Out	    REO Speedwagon	    null	        Ridin the Storm Out by REO Speedwagon
    5	    Roll With the Changes	REO Speedwagon	    null	        Roll With the Changes by REO Speedwagon
    6	    Take It on the Run	    REO Speedwagon  	1981	        Take It on the Run by REO Speedwagon
    7	    Time For Me To Fly	    REO Speedwagon	    null	        Time For Me To Fly by REO Speedwagon
    8	    Jessies Girl	        Rick Springfield    1981	        Jessies Girl by Rick Springfield
    9	    Back Off Boogaloo	    Ringo Starr	        1972	        Back Off Boogaloo by Ringo Starr
    10	    Early 1970 [*]	        Ringo Starr	        1971	        Early 1970 [*] by Ringo Starr
    11	    It Dont Come Easy	    Ringo Starr 	    1971            Dont Come Easy by Ringo Starr
    12	    No No Song	            Ringo Starr         1974	        No No Song by Ringo Starr
    13	    Photograph          	Ringo Starr	        1973	        Photograph by Ringo Starr
    14	    Yourre Sixteen      	Ringo Starr        	1974	        Yourre Sixteen by Ringo Starr
    15	    Addicted to Love    	Robert Palmer	    1985	        Addicted to Love by Robert Palmer

*/

-- Retrieve the song, artist, and release_year columns from the songlist table.

-- Retrieve the song, artist and release_year columns
SELECT
    song,
    artist,
    release_year
FROM
    songlist


-- Make sure there are no NULL values in the release_year column.

-- Retrieve the song, artist and release_year columns
SELECT
    song,
    artist,
    release_year
FROM
    songlist
-- Ensure there are no missing or unknown values in the release_year column
WHERE 
  release_year IS NOT NULL


-- Order the results by artist and release_year.
-- Retrieve the song,artist and release_year columns
SELECT
    song,
    artist,
    release_year
FROM
    songlist
-- Ensure there are no missing or unknown values in the release_year column
WHERE 
  release_year IS NOT NULL
-- Arrange the results by the artist and release_year columns
ORDER BY 
  artist, 
  release_year;

-- Extend the WHERE clause so that the results are those with a release_year greater than or equal to 1980 and less than or equal to 1990.
SELECT
    song,
    artist,
    release_year
FROM
    songlist
WHERE 
  -- Retrieve records greater than and including 1980
  release_year >= 1980
    -- Also retrieve records up to and including 1990
    AND release_year <= 1990
ORDER BY 
  artist, 
  release_year;

-- Select all artists beginning with B who released tracks in 1986, but also retrieve any records where the release_year is greater than 1990.
SELECT
    artist,
    release_year,
    song
FROM
    songlist
-- Choose the correct artist and specify the release year
WHERE 
  (
    artist LIKE 'B%'
    AND release_year = 1986
  )
    -- Or return all songs released after 1990
    OR release_year > 1990
-- Order the results
ORDER BY 
  release_year, 
  artist, 
  song;