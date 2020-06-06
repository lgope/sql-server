-- create database
CREATE DATABASE databasename;


-- create table with column name
CREATE TABLE table_name
(
    column1 datatype,
    column2 datatype,
    column3 datatype,
    .....
   columnN datatype,
   PRIMARY KEY
    ( one or more columns )
);


    -- insert data
    INSERT INTO table_name
        (column1, column2, column3, ...)
    VALUES
        (value1, value2, value3, ...);

    -- or 
    INSERT INTO table_name
    VALUES
        (value1, value2, value3, ...);

    -- delete database
    DROP DATABASE databasename;

    -- delete table
    DROP TABLE table_name;


    -- 1) Create a table named 'results' with 3 VARCHAR columns called track, artist, and album, with lengths 200, 120, and 160, respectively.

    -- Create the table
    CREATE TABLE results
    (
        -- Create track column
        track VARCHAR(200),
        -- Create artist column
        artist VARCHAR(120),
        -- Create album column
        album VARCHAR(160),
    );

    -- 2) Create one integer column called track_length_mins.
    -- Create the table
    CREATE TABLE results
    (
        -- Create track column
        track VARCHAR(200),
        -- Create artist column
        artist VARCHAR(120),
        -- Create album column
        album VARCHAR(160),
        -- Create track_length_mins
        track_length_mins int,
    );

    -- 3) SELECT all the columns from your new table. No rows will be returned, but you can confirm that the table has been created.

    -- Create the table
    CREATE TABLE results
    (
        -- Create track column
        track VARCHAR(200),
        -- Create artist column
        artist VARCHAR(120),
        -- Create album column
        album VARCHAR(160),
        -- Create track_length_mins
        track_length_mins INT,
    );

    -- Select all columns from the table
    SELECT
        track,
        artist,
        album,
        track_length_mins
    FROM
        results;