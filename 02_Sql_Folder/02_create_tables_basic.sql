-- Select the 'mynilam' database
USE mynilam;

-- Create a table to store student information
CREATE TABLE student (
    rollno   INT,              -- Student roll number
    name     VARCHAR(255),      -- Student name
    address  VARCHAR(255)       -- Student address
);

-- Switch to the 'userdata' database
USE userdata;

-- Create a table to store user account details
CREATE TABLE userstbl (
    userid      INT,            -- Unique user ID
    username    VARCHAR(255),    -- User full name
    useremail   VARCHAR(255),    -- User email address
    usermobile  VARCHAR(20),     -- User mobile number
    userpass    VARCHAR(255)     -- User password (should be hashed in real systems)
);
