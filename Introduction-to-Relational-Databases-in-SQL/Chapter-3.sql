-- 1) First, find out the number of rows in universities.
-- Count the number of rows in universities
SELECT COUNT(*)
FROM universities;

-- ############################
-- 2) Then, find out how many unique values there are in the university_city column.
-- Count the number of distinct values in the university_city column
SELECT COUNT(DISTINCT(university_city))
FROM universities;


-- ############################
-- 3) Using the above steps, identify the candidate key by trying out different combination of columns.
-- Try out different combinations
SELECT COUNT(DISTINCT(firstname, lastname
)) 
FROM professors;


-- ############################
-- 4) Rename the organization column to id in organizations.
-- Make id a primary key and name it organization_pk.
-- Rename the organization column to id
ALTER TABLE organizations
RENAME COLUMN organization TO id;

-- Make id a primary key
ALTER TABLE organizations
ADD CONSTRAINT organization_pk PRIMARY KEY (id);


-- ############################
-- 5) Rename the university_shortname column to id in universities.
-- Make id a primary key and name it university_pk.
-- Rename the university_shortname column to id
ALTER TABLE universities
RENAME COLUMN university_shortname TO id;

-- Make id a primary key
ALTER TABLE universities
ADD CONSTRAINT university_pk PRIMARY KEY (id);


-- ############################
-- 6) Add a new column id with data type serial to the professors table.
-- Add the new column to the table
ALTER TABLE professors 
ADD COLUMN id serial;


-- ############################
-- 7) Make id a primary key and name it professors_pkey.
-- Add the new column to the table
ALTER TABLE professors 
ADD COLUMN id serial;

-- Make id a primary key
ALTER TABLE professors 
ADD CONSTRAINT professors_pkey PRIMARY KEY (id);


-- ############################
-- 8) Write a query that returns all the columns and 10 rows from professors.
-- Add the new column to the table
ALTER TABLE professors 
ADD COLUMN id serial;

-- Make id a primary key
ALTER TABLE professors 
ADD CONSTRAINT professors_pkey PRIMARY KEY (id);

-- Have a look at the first 10 rows of professors
SELECT *
FROM professors LIMIT
10;

-- ############################
-- 9) Count the number of distinct rows with a combination of the make and model columns.
-- Count the number of distinct rows with columns make, model
SELECT COUNT(DISTINCT(make, model
))
FROM cars;


-- ############################
-- 10) Add a new column id with the data type varchar(128).
-- Count the number of distinct rows with columns make, model
SELECT COUNT(DISTINCT(make, model
)) 
FROM cars;

-- Add the id column
ALTER TABLE cars
ADD COLUMN id varchar
(128);


-- ############################
-- 11) Concatenate make and model into id using an UPDATE table_name SET column_name = ... query and the CONCAT() function.
-- Count the number of distinct rows with columns make, model
SELECT COUNT(DISTINCT(make, model
)) 
FROM cars;

-- Add the id column
ALTER TABLE cars
ADD COLUMN id varchar
(128);

-- Update id with make + model
UPDATE cars
SET id = CONCAT(make, model);

-- ############################
-- 12) Make id a primary key and name it id_pk.
-- Count the number of distinct rows with columns make, model
SELECT COUNT(DISTINCT(make, model
)) 
FROM cars;

-- Add the id column
ALTER TABLE cars
ADD COLUMN id varchar
(128);

-- Update id with make + model
UPDATE cars
SET id = CONCAT(make, model);

-- Make id a primary key
ALTER TABLE cars
ADD CONSTRAINT id_pk PRIMARY KEY(id);

-- Have a look at the table
SELECT *
FROM cars;

-- ############################
-- 13) Given the above description of a student entity, create a table students with the correct column types.
-- Add a PRIMARY KEY for the social security number ssn.
-- Note that there is no formal length requirement for the integer column. The application would have to make sure it's a correct SSN!
-- Create the table
CREATE TABLE students
(
    last_name varchar(128) NOT NULL,
    ssn integer
    [9] UNIQUE,
  phone_no char
    (12)
);