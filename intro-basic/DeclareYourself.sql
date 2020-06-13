-- 1) DECLARE the variable @region, which has a data type of VARCHAR and length of 10.
-- Declare the variable @region, and specify the data type of the variable
DECLARE @region VARCHAR(10)


-- 2) SET your newly defined variable to 'RFC'.
-- Declare the variable @region
DECLARE @region VARCHAR(10)

-- Update the variable value
SET @region = 'RFC'


-- Exercise
-- Declare the variable @region
DECLARE @region VARCHAR(10)

-- Update the variable value
SET @region = 'RFC'

SELECT description,
    nerc_region,
    demand_loss_mw,
    affected_customers
FROM grid
WHERE nerc_region = @region;


-- 3) Declare a new variable called @start of type DATE.
-- Declare @start
DECLARE @start DATE

-- SET @start to '2014-01-24'
SET @start = '2014-01-24'

-- 4) Declare a new variable called @stop of type DATE.
-- Declare @start
DECLARE @start DATE

-- Declare @stop
DECLARE @stop DATE

-- SET @start to '2014-01-24'
SET @start = '2014-01-24'

-- SET @stop to '2014-07-02'
SET @stop = '2014-07-02'


-- 5) Declare a new variable called @affected of type INT.
-- Declare @start
DECLARE @start DATE

-- Declare @stop
DECLARE @stop DATE

-- Declare @affected
DECLARE @affected INT

-- SET @start to '2014-01-24'
SET @start = '2014-01-24'

-- SET @stop to '2014-07-02'
SET @stop  = '2014-07-02'

-- Set @affected to 5000
SET @affected = 5000


-- 6) Retrieve all rows where event_date is BETWEEN @start and @stop and affected_customers is greater than or equal to @affected.
-- Declare your variables
DECLARE @start DATE
DECLARE @stop DATE
DECLARE @affected INT;
-- SET the relevant values for each variable
SET @start = '2014-01-24'
SET @stop  = '2014-07-02'
SET @affected =  5000
;

SELECT
    description,
    nerc_region,
    demand_loss_mw,
    affected_customers
FROM
    grid
-- Specify the date range of the event_date and the value for @affected
WHERE event_date BETWEEN @start AND @stop
    AND affected_customers >= @affected;


-- 7) FINAL EXERCISE
-- Create a temporary table called maxtracks. Make sure the table name starts with #. Join album to artist using artist_id, and track to album using album_id. Run the final SELECT statement to retrieve all the columns from your new table.

SELECT album.title AS album_title,
    artist.name as artist,
    MAX(track.milliseconds / (1000 * 60) % 60 ) AS max_track_length_mins
-- Name the temp table #maxtracks
INTO #maxtracks
FROM album
    -- Join album to artist using artist_id
    INNER JOIN artist ON album.artist_id = artist.artist_id
    -- Join track to album using album_id
    INNER JOIN track ON album.album_id = track.album_id
GROUP BY artist.artist_id, album.title, artist.name,album.album_id
-- Run the final SELECT query to retrieve the results from the temporary table
SELECT album_title, artist, max_track_length_mins
FROM #maxtracks
ORDER BY max_track_length_mins DESC, artist;