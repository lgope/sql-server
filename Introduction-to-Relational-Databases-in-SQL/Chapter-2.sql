-- 1) Execute the given sample code.
-- As it doesn't work, have a look at the error message and correct the statement accordingly – then execute it again.

-- Let's add a record to the table
INSERT INTO transactions
    (transaction_date, amount, fee)
VALUES
    ('2018-09-24', 5454, '30');

-- Doublecheck the contents
SELECT *
FROM transactions;


-- #######################
-- 2) Execute the given sample code.
-- As it doesn't work, add an integer type cast at the right place and execute it again.

-- Calculate the net amount as amount + fee
SELECT transaction_date, CAST(amount AS integer) + CAST(fee AS integer) AS net_amount
FROM transactions;


-- #######################
-- 3) Have a look at the distinct university_shortname values in the professors table and take note of the length of the strings.
-- Select the university_shortname column
SELECT DISTINCT(university_shortname)
FROM professors;

-- #######################
-- 4) Now specify a fixed-length character type with the correct length for university_shortname.
-- Specify the correct fixed-length character type
-- Specify the correct fixed-length character type
ALTER TABLE professors
ALTER COLUMN university_shortname
TYPE
Char
(3);

-- ##############################
-- 5) Change the type of the firstname column to varchar(64).
-- Change the type of firstname
ALTER TABLE professors
ALTER COLUMN firstname
TYPE
varchar
(64);


-- ##############################
-- 6) Run the sample code as is and take note of the error.
-- Now use SUBSTRING() to reduce firstname to 16 characters so its type can be altered to varchar(16).
-- Convert the values in firstname to a max. of 16 characters
ALTER TABLE professors 
ALTER COLUMN firstname 
TYPE
varchar
(16)
USING SUBSTRING
(firstname FROM 1 FOR 16)

-- ##############################
-- 7) Add a not-null constraint for the firstname column.
-- Disallow NULL values in firstname
ALTER TABLE professors 
ALTER COLUMN firstname
SET
NOT NULL;


-- ##############################
-- 8) Add a not-null constraint for the lastname column.
-- Disallow NULL values in lastname
ALTER TABLE professors 
ALTER COLUMN lastname
SET
NOT NULL;


-- ##############################
-- 9) Add a unique constraint to the university_shortname column in universities. Give it the name university_shortname_unq.
-- Make universities.university_shortname unique
ALTER TABLE universities
ADD CONSTRAINT university_shortname_unq UNIQUE(university_shortname);

-- ##############################
-- 10) Add a unique constraint to the organization column in organizations. Give it the name organization_unq.
-- Make organizations.organization unique
ALTER TABLE organizations
ADD CONSTRAINT organization_unq UNIQUE(organization);