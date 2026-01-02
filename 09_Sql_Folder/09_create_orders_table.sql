/* =========================================
   DATABASE SELECTION
   ========================================= */

-- Select the mynilam database
USE mynilam;


/* =========================================
   ORDERS TABLE CREATION
   ========================================= */

-- Create table to store order and customer details
CREATE TABLE orderstbl (
    orderid         INT,            -- Unique order ID
    orderitem       VARCHAR(255),    -- Name of the ordered item
    orderrate       FLOAT,           -- Price per unit
    orderqnty       INT,             -- Quantity ordered
    customername    VARCHAR(255),    -- Customer full name
    customerd       VARCHAR(255),    -- Customer address / district
    customerpincode VARCHAR(10)      -- Customer area pincode
);
