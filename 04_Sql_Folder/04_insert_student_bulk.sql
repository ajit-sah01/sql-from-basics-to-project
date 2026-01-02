/* ================================
   DATABASE SETUP
   ================================ */

-- Remove old database if it exists
DROP DATABASE IF EXISTS mynilam;

-- Create new database
CREATE DATABASE mynilam;

-- Use the database
USE mynilam;


/* ================================
   TABLE CREATION
   ================================ */

-- Create student table
CREATE TABLE student (
    rollno   INT PRIMARY KEY,     -- Student roll number
    name     VARCHAR(255),         -- Student name
    address  VARCHAR(255)          -- Student address
);


/* ================================
   INSERT INITIAL SAMPLE DATA
   ================================ */

-- Insert first few records manually
INSERT INTO student (rollno, name, address) VALUES
(1, 'Nilam', 'Bettiah'),
(2, 'Amit', 'Patna'),
(3, 'Ravi', 'Gaya'),
(4, 'Pooja', 'Muzaffarpur'),
(5, 'Suman', 'Bhagalpur');


/* ================================
   AUTO INSERT DATA (6 TO 50)
   ================================ */

-- Insert roll numbers from 6 to 50 automatically
INSERT INTO student (rollno, name, address)
SELECT
    n,
    CONCAT('Student', n),
    'Bettiah'
FROM (
    SELECT 6 n UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10
    UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15
    UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20
    UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25
    UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29 UNION ALL SELECT 30
    UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35
    UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39 UNION ALL SELECT 40
    UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45
    UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49 UNION ALL SELECT 50
) numbers;


/* ================================
   VERIFY DATA
   ================================ */

-- View all student records
SELECT * FROM student;
