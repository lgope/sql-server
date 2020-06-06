-- INSERT
-- 1) Create a table called tracks with 2 VARCHAR columns named track and album, and one integer column named track_length_mins. Then, select all columns from the new table using the * notation.
-- Create the table
CREATE TABLE tracks
(
    -- Create track column
    track VARCHAR(200),
    -- Create album column
    album VARCHAR(160),
    -- Create track_length_mins column
    track_length_mins INT
);
-- Select all columns from the new table
SELECT
    *
FROM
    tracks;


-- 2) Insert the track 'Basket Case', from the album 'Dookie', with a track length of 3, into the appropriate columns.
-- Create the table
CREATE TABLE tracks
(
    -- Create track column
    track VARCHAR(200),
    -- Create album column
    album VARCHAR(160),
    -- Create track_length_mins column
    track_length_mins INT
);
-- Complete the statement to enter the data to the table         
INSERT INTO tracks
    -- Specify the destination columns
    (track, album, track_length_mins)
-- Insert the appropriate values for track, album and track length
VALUES
    ('Basket Case', 'Dookie', 3);
-- Select all columns from the new table
SELECT
    *
FROM
    tracks;

-- READ
-- 1) Select the title column from the album table where the album_id is 213.
-- Select the album
SELECT
    title
FROM
    album
WHERE 
  album_id = 213;


-- UPDATE
-- 1) That's a very long album title, isn't it? Use an UPDATE statement to modify the title to 'Pure Cult: The Best Of The Cult'.

-- Run the query
SELECT
    title
FROM
    album
WHERE 
  album_id = 213;
-- UPDATE the album table
UPDATE 
  album
-- SET the new title    
SET
  title = 'Pure Cult: The Best Of The Cult'
WHERE album_id = 213;


-- DELETE
-- 1) DELETE the record from album where album_id is 1 and then hit 'Submit Answer'.

-- Run the query
SELECT
    *
FROM
    album
-- DELETE the record
DELETE FROM 
  album 
WHERE 
  album_id = 1
-- Run the query again
SELECT
    *
FROM
    album;