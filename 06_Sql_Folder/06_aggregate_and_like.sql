-- Select the database
USE mynilam;

-- Count total number of students
SELECT COUNT(rollno) AS total_students
FROM student;

-- Count students whose name starts with letter 'A'
SELECT COUNT(rollno) AS name_start_A
FROM student
WHERE name LIKE 'A%';

-- Count students whose name contains 'Reddy'
SELECT COUNT(rollno) AS reddy_count
FROM student
WHERE name LIKE '%Reddy%';
