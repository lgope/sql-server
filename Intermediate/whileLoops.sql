-- 1) Create an integer variable named counter. Assign the value 20 to this variable.
-- Declare the variable (a SQL Command, the var name, the datatype)
DECLARE @counter INT

-- Set the counter to 20
SET @counter = 20

-- Select the counter
SELECT @counter

-- ############### --
--  2) Increment the variable counter by 1 and assign it back to counter.
-- Declare the variable (a SQL Command, the var name, the datatype)
DECLARE @counter INT

-- Set the counter to 20
SET @counter = 20

-- Select and increment the counter by one 
SET @counter += 1

-- Print the variable
SELECT @counter

-- ############### --
-- 3) Write a WHILE loop that increments counter by 1 until counter is less than 30.
DECLARE @counter INT
SET @counter = 20

-- Create a loop
WHILE @counter < 30

-- Loop code starting point
BEGIN
    SELECT @counter = @counter + 1
-- Loop finish
END

-- Check the value of the variable
SELECT @counter