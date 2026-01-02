/* =========================================
   DATABASE SELECTION
   ========================================= */

-- Use the userdata database
USE userdata;


/* =========================================
   BASIC LOGIN CHECK (SAFE)
   ========================================= */

-- Check login using username and password (recommended logic)
SELECT username
FROM userstbl
WHERE username = 'Nilam Kumari'
  AND userpass = 'pass123';


/* =========================================
   AND / OR LOGIC (WITHOUT PARENTHESES)
   NOTE: AND has higher priority than OR
   ========================================= */

-- This query is LOGICALLY UNSAFE for authentication
-- It will return any user having password = 'pass123'
SELECT username
FROM userstbl
WHERE username = 'Nilam Kumari'
  AND usermobile = '9876543210'
  OR userpass = 'pass123';


-- Same logic issue while fetching email
SELECT useremail
FROM userstbl
WHERE username = 'Nilam Kumari'
  AND usermobile = '9876543210'
  OR userpass = 'pass123';


/* =========================================
   CORRECT & SECURE LOGIC (WITH PARENTHESES)
   ========================================= */

-- Correct usage of AND + OR with parentheses
SELECT username
FROM userstbl
WHERE username = 'Nilam Kumari'
  AND (usermobile = '9876543210' OR userpass = 'pass123');


-- Fetch email securely using controlled logic
SELECT useremail
FROM userstbl
WHERE username = 'Nilam Kumari'
  AND (usermobile = '9876543210' OR userpass = 'pass123');


/* =========================================
   BEST PRACTICE NOTE
   ========================================= */

-- In real systems:
-- 1. Passwords must be hashed (not plain text)
-- 2. Authentication should be handled in backend code
-- 3. OR conditions should be avoided in login queries
