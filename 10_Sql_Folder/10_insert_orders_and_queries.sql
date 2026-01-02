/* =========================================
   DATABASE SELECTION
   ========================================= */

-- Select the database
USE mynilam;


/* =========================================
   INSERT SAMPLE ORDER DATA (1–5 MANUAL)
   ========================================= */

-- Insert initial sample orders
INSERT INTO orderstbl
(orderid, orderitem, orderrate, orderqnty, customername, customerd, customerpincode)
VALUES
(1, 'Laptop', 1200.50, 1, 'Alice Smith', 'Patna, Bihar', '800001'),
(2, 'Mouse', 25.99, 2, 'Bob Johnson', 'Delhi', '110001'),
(3, 'Keyboard', 75.00, 1, 'Ravi Kumar', 'Gaya, Bihar', '823001'),
(4, 'Monitor', 300.00, 1, 'Pooja Singh', 'Muzaffarpur, Bihar', '842001'),
(5, 'Laptop', 1150.00, 1, 'Amit Verma', 'Patna, Bihar', '800014');


/* =========================================
   AUTO INSERT ORDERS (6–50)
   ========================================= */

-- Automatically insert remaining orders (6 to 50)
INSERT INTO orderstbl
(orderid, orderitem, orderrate, orderqnty, customername, customerd, customerpincode)
SELECT
    n,
    'Electric Toothbrush',
    2000.00,
    1,
    CONCAT('Customer', n),
    'Amethi, Uttar Pradesh',
    '227405'
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


/* =========================================
   VIEW ALL ORDERS
   ========================================= */

-- Display all order records
SELECT * FROM orderstbl;


/* =========================================
   AGGREGATE QUERIES
   ========================================= */

-- Count total orders where item is Laptop
SELECT COUNT(orderid) AS laptop_orders
FROM orderstbl
WHERE orderitem = 'Laptop';

-- Count orders where customer address contains 'Patna'
SELECT COUNT(orderid) AS patna_orders
FROM orderstbl
WHERE customerd LIKE '%Patna%';
