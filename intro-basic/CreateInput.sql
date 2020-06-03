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