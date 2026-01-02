-- Select the database
USE mynilam;

-- Display all records from the student table
SELECT * FROM student;

-- Fetch student details where name is 'Nilam'
SELECT * FROM student
WHERE name = 'Nilam';

-- Fetch students who belong to Katihar
SELECT * FROM student
WHERE address = 'Katihar';

-- Update address of student with roll number 1
UPDATE student
SET address = 'Bettiah'
WHERE rollno = 1;

-- Delete the student record with roll number 2
DELETE FROM student
WHERE rollno = 2;

-- Verify final data after update and delete
SELECT * FROM student;
