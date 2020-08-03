-- 1) Rename the university_shortname column to university_id in professors.

-- Rename the university_shortname column
ALTER TABLE professors
RENAME COLUMN university_shortname TO university_id;

-- ###############################
-- 2) Add a foreign key on university_id column in professors that references the id column in universities.
-- Name this foreign key professors_fkey.
-- Rename the university_shortname column
ALTER TABLE professors
RENAME COLUMN university_shortname TO university_id;

-- Add a foreign key on professors referencing universities
ALTER TABLE professors
ADD CONSTRAINT professors_fkey FOREIGN KEY (university_id) REFERENCES universities (id);




-- ###############################
-- 3) Run the sample code and have a look at the error message.
-- What's wrong? Correct the university_id so that it actually reflects where Albert Einstein wrote his dissertation and became a professor – at the University of Zurich (UZH)!
-- Try to insert a new professor
INSERT INTO professors
    (firstname, lastname, university_id)
VALUES
    ('Albert', 'Einstein', 'UZH');

-- ###############################
-- 4) JOIN professors with universities on professors.university_id = universities.id, i.e., retain all records where the foreign key of professors is equal to the primary key of universities.
-- Filter for university_city = 'Zurich'.
-- Select all professors working for universities in the city of Zurich
SELECT professors.lastname, universities.id, universities.university_city
FROM professors
    JOIN universities
    ON professors.university_id = universities.id
WHERE universities.university_city = 'Zurich';

-- ###############################
-- 5) Add a professor_id column with integer data type to affiliations, and declare it to be a foreign key that references the id column in professors.
-- Add a professor_id column
ALTER TABLE affiliations
ADD COLUMN professor_id integer REFERENCES professors
(id);


-- ###############################
-- 6) Rename the organization column in affiliations to organization_id.
-- Add a professor_id column
ALTER TABLE affiliations
ADD COLUMN professor_id integer REFERENCES professors
(id);

-- Rename the organization column to organization_id
ALTER TABLE affiliations
RENAME organization TO organization_id;

-- ###############################
-- Add a foreign key constraint on organization_id so that it references the id column in organizations.
-- Add a professor_id column
ALTER TABLE affiliations
ADD COLUMN professor_id integer REFERENCES professors
(id);

-- Rename the organization column to organization_id
ALTER TABLE affiliations
RENAME organization TO organization_id;

-- Add a foreign key on organization_id
ALTER TABLE affiliations
ADD CONSTRAINT affiliations_organization_fkey FOREIGN KEY (organization_id) REFERENCES organizations (id);

-- ###############################
-- 7) First, have a look at the current state of affiliations by fetching 10 rows and all columns.
-- Have a look at the 10 first rows of affiliations
SELECT *
FROM affiliations LIMIT
10;


-- ###############################
-- 8) Update the professor_id column with the corresponding value of the id column in professors.
-- "Corresponding" means rows in professors where the firstname and lastname are identical to the ones in affiliations.
-- Set professor_id to professors.id where firstname, lastname correspond to rows in professors
UPDATE affiliations
SET professor_id = professors.id
FROM professors
WHERE affiliations.firstname = professors.firstname AND affiliations.lastname = professors.lastname;

-- ###############################
-- 9) Check out the first 10 rows and all columns of affiliations again. Have the professor_ids been correctly matched?
-- Update professor_id to professors.id where firstname, lastname correspond to rows in professors
UPDATE affiliations
SET professor_id = professors.id
FROM professors
WHERE affiliations.firstname = professors.firstname AND affiliations.lastname = professors.lastname;

-- Have a look at the 10 first rows of affiliations again
SELECT *
FROM affiliations LIMIT
10;


-- ###############################
-- 10) Drop the firstname and lastname columns from the affiliations table.
-- Drop the firstname column
ALTER TABLE affiliations
DROP COLUMN firstname;

-- Drop the lastname column
ALTER TABLE affiliations
DROP COLUMN lastname;

-- ###############################
-- 11) Have a look at the existing foreign key constraints by querying table_constraints in information_schema.
-- Identify the correct constraint name
SELECT constraint_name, table_name, constraint_type
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY';

-- ###############################
-- 12) Delete the affiliations_organization_id_fkey foreign key constraint in affiliations.
-- Identify the correct constraint name
SELECT constraint_name, table_name, constraint_type
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY';

-- Drop the right foreign key constraint
ALTER TABLE affiliations
DROP CONSTRAINT affiliations_organization_id_fkey;

-- ###############################
-- 13) Add a new foreign key to affiliations that cascades deletion if a referenced record is deleted from organizations. Name it affiliations_organization_id_fkey.
-- Identify the correct constraint name
SELECT constraint_name, table_name, constraint_type
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY';

-- Drop the right foreign key constraint
ALTER TABLE affiliations
DROP CONSTRAINT affiliations_organization_id_fkey;

-- Add a new foreign key constraint from affiliations to organizations which cascades deletion
ALTER TABLE affiliations
ADD CONSTRAINT affiliations_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES organizations (id) ON DELETE CASCADE;


-- ###############################
-- 14) Run the DELETE and SELECT queries to double check that the deletion cascade actually works.
-- Identify the correct constraint name
SELECT constraint_name, table_name, constraint_type
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY';

-- Drop the right foreign key constraint
ALTER TABLE affiliations
DROP CONSTRAINT affiliations_organization_id_fkey;

-- Add a new foreign key constraint from affiliations to organizations which cascades deletion
ALTER TABLE affiliations
ADD CONSTRAINT affiliations_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES organizations (id) ON DELETE CASCADE;

-- Delete an organization 
DELETE FROM organizations 
WHERE id = 'CUREM';

-- Check that no more affiliations with this organization exist
SELECT *
FROM affiliations
WHERE organization_id = 'CUREM';


-- ###############################
-- 15) Count the number of total affiliations by university.
-- Sort the result by that count, in descending order.
-- Count the total number of affiliations per university
SELECT COUNT(*), professors.university_id
FROM affiliations
    JOIN professors
    ON affiliations.professor_id = professors.id
-- Group by the ids of professors
GROUP BY professors.university_id
ORDER BY count DESC;

-- ###############################
-- 16) Join all tables in the database (starting with affiliations, professors, organizations, and universities) and look at the result.
-- Join all tables
SELECT *
FROM affiliations
    JOIN professors
    ON affiliations.professor_id = professors.id
    JOIN organizations
    ON affiliations.organization_id = organizations.id
    JOIN universities
    ON professors.university_id = universities.id;

-- ###############################
-- 17) Now group the result by organization sector, professor, and university city.
-- Count the resulting number of rows.
-- Group the table by organization sector, professor and university city
SELECT COUNT(*), organizations.organization_sector,
    professors.id, universities.university_city
FROM affiliations
    JOIN professors
    ON affiliations.professor_id = professors.id
    JOIN organizations
    ON affiliations.organization_id = organizations.id
    JOIN universities
    ON professors.university_id = universities.id
GROUP BY organizations.organization_sector, 
professors.id, universities.university_city;


-- ###############################
-- 18) Only retain rows with "Media & communication" as organization sector, and sort the table by count, in descending order.
-- Filter the table and sort it
SELECT COUNT(*), organizations.organization_sector,
    professors.id, universities.university_city
FROM affiliations
    JOIN professors
    ON affiliations.professor_id = professors.id
    JOIN organizations
    ON affiliations.organization_id = organizations.id
    JOIN universities
    ON professors.university_id = universities.id
WHERE organizations.organization_sector = 'Media & communication'
GROUP BY organizations.organization_sector, 
professors.id, universities.university_city
ORDER BY count DESC;