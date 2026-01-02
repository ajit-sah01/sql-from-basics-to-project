/* =========================================
   DATABASE SELECTION
   ========================================= */

-- Select the userdata database
USE userdata;


/* =========================================
   UPDATE USER RECORDS
   ========================================= */

-- Update username for user with ID = 1
UPDATE userstbl
SET username = 'Nilam Kumari'
WHERE userid = 1;

-- Update username for user with ID = 2
UPDATE userstbl
SET username = 'Ajit SAH'
WHERE userid = 2;


/* =========================================
   VERIFY UPDATED DATA
   ========================================= */

-- View all users after update
SELECT userid, username
FROM userstbl;
