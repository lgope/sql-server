-- 1) Get information on all table names in the current database, while limiting your query to the 'public' table_schema.
-- Query the right table in information_schema
SELECT table_name
FROM information_schema.tables
-- Specify the correct table_schema value
WHERE table_schema = 'public';


-- ############################
-- 2) Now have a look at the columns in university_professors by selecting all entries in information_schema.columns that correspond to that table.
-- Query the right table in information_schema to get columns
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'university_professors' AND table_schema = 'public';


-- 3) Finally, print the first five rows of the university_professors table.
-- Query the first five rows of our table
SELECT *
FROM university_professors 
LIMIT
5;

-- ############################
-- 4) Create a table professors with two text columns: firstname and lastname.
-- Create a table for the professors entity type
CREATE TABLE professors
(
    firstname text,
    lastname text
);

-- Print the contents of this table
SELECT *
FROM professors


-- ############################
-- 5) Create a table universities with three text columns: university_shortname, university, and university_city.
-- Create a table for the universities entity type
CREATE TABLE universities
(
    university_shortname text,
    university text,
    university_city text
);


-- Print the contents of this table
SELECT *
FROM universities


-- ############################
-- 6) Alter professors to add the text column university_shortname.
-- Add the university_shortname column
ALTER TABLE professors
ADD COLUMN university_shortname text;

-- Print the contents of this table
SELECT *
FROM professors


-- ############################
-- 7) Rename the organisation column to organization in affiliations.
-- Rename the organisation column
ALTER TABLE affiliations
RENAME COLUMN organisation TO organization;


-- ############################
-- 8) Delete the university_shortname column in affiliations.
-- Rename the organisation column
ALTER TABLE affiliations
RENAME COLUMN organisation TO organization;

-- Delete the university_shortname column
ALTER TABLE affiliations
DROP COLUMN university_shortname;


-- ############################
-- 9) Insert all DISTINCT professors from university_professors into professors. Print all the rows in professors.
-- Insert unique professors into the new table
INSERT INTO professors
SELECT DISTINCT firstname, lastname, university_shortname
FROM university_professors;

-- Doublecheck the contents of professors
SELECT *
FROM professors;

-- ############################
-- 10) Insert all DISTINCT affiliations into affiliations from university_professors.
-- Insert unique affiliations into the new table
INSERT INTO affiliations
SELECT DISTINCT firstname, lastname, function, organization
FROM university_professors;

-- Doublecheck the contents of affiliations
SELECT *
FROM affiliations;


-- ############################
-- 11) Delete the university_professors table.
-- Delete the university_professors table
DROP TABLE university_professors;