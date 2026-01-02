/* =========================================================
   FINAL SQL MASTER FILE
   CORE → ADVANCED SQL (MySQL)
   ========================================================= */


/* =========================================================
   1. DATABASE SETUP
   ========================================================= */

-- Remove databases if they already exist
DROP DATABASE IF EXISTS mynilam;
DROP DATABASE IF EXISTS userdata;

-- Create databases
CREATE DATABASE mynilam;
CREATE DATABASE userdata;


/* =========================================================
   2. STUDENT DATABASE (CORE SQL)
   ========================================================= */

USE mynilam;

-- Student table
CREATE TABLE student (
    rollno   INT PRIMARY KEY,
    name     VARCHAR(255) NOT NULL,
    address  VARCHAR(255)
);

-- Insert sample students
INSERT INTO student VALUES
(1, 'Nilam', 'Bettiah'),
(2, 'Ajit', 'Bettiah'),
(3, 'Ravi', 'Gaya'),
(4, 'Pooja', 'Muzaffarpur'),
(5, 'Suman', 'Bhagalpur');

-- Auto insert students (6–50)
INSERT INTO student
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
) t;


/* =========================================================
   3. CORE QUERIES (SELECT / WHERE / UPDATE / DELETE)
   ========================================================= */

SELECT * FROM student;
SELECT * FROM student WHERE name = 'Nilam';

UPDATE student SET address = 'Bettiah' WHERE rollno = 1;
DELETE FROM student WHERE rollno = 2;


/* =========================================================
   4. AGGREGATE FUNCTIONS
   ========================================================= */

SELECT COUNT(*) AS total_students FROM student;
SELECT COUNT(*) AS name_start_A FROM student WHERE name LIKE 'A%';


/* =========================================================
   5. ORDER MANAGEMENT (BUSINESS DATA)
   ========================================================= */

CREATE TABLE orderstbl (
    orderid      INT PRIMARY KEY AUTO_INCREMENT,
    orderitem    VARCHAR(255),
    orderrate    DECIMAL(10,2),
    orderqnty    INT,
    customername VARCHAR(255),
    customerd    VARCHAR(255),
    pincode      VARCHAR(10)
);

INSERT INTO orderstbl
(orderitem, orderrate, orderqnty, customername, customerd, pincode)
VALUES
('Laptop', 1200.50, 1, 'Alice', 'Patna, Bihar', '800001'),
('Laptop', 1150.00, 1, 'Amit', 'Patna, Bihar', '800014'),
('Mouse', 25.99, 2, 'Bob', 'Delhi', '110001'),
('Keyboard', 75.00, 1, 'Ravi', 'Gaya', '823001');

-- Sales calculations
SELECT orderitem, SUM(orderrate * orderqnty) AS total_sales
FROM orderstbl
GROUP BY orderitem;

SELECT COUNT(*) AS patna_orders
FROM orderstbl
WHERE customerd LIKE '%Patna%';


/* =========================================================
   6. USER AUTH DATABASE (REAL-WORLD LOGIC)
   ========================================================= */

USE userdata;

CREATE TABLE userstbl (
    userid     INT PRIMARY KEY AUTO_INCREMENT,
    username   VARCHAR(255) NOT NULL,
    useremail  VARCHAR(255) UNIQUE,
    usermobile VARCHAR(20),
    userpass   VARCHAR(255) NOT NULL
);

INSERT INTO userstbl
(username, useremail, usermobile, userpass)
VALUES
('Nilam Kumari', 'nilam@gmail.com', '9876543210', 'pass123'),
('Ajit SAH', 'ajit@gmail.com', '9123456789', 'ajit@123');


/* =========================================================
   7. LOGIN & SECURITY LOGIC
   ========================================================= */

-- Safe login
SELECT username
FROM userstbl
WHERE username = 'Nilam Kumari'
  AND userpass = 'pass123';

-- Correct AND / OR usage
SELECT username
FROM userstbl
WHERE username = 'Nilam Kumari'
  AND (usermobile = '9876543210' OR userpass = 'pass123');


/* =========================================================
   8. ADVANCED SQL
   ========================================================= */

-- CASE expression
SELECT username,
CASE
    WHEN usermobile IS NULL THEN 'NO MOBILE'
    ELSE 'MOBILE OK'
END AS mobile_status
FROM userstbl;

-- Subquery
SELECT *
FROM orderstbl
WHERE orderrate >
      (SELECT AVG(orderrate) FROM orderstbl);

-- Index for performance
CREATE INDEX idx_username ON userstbl(username);


/* =========================================================
   9. TRANSACTIONS (ADVANCED)
   ========================================================= */

START TRANSACTION;

UPDATE orderstbl
SET orderrate = orderrate + 100
WHERE orderitem = 'Laptop';

ROLLBACK;   -- Use COMMIT to save changes


/* =========================================================
   END OF MASTER SQL FILE
   ========================================================= */
