-- restaurant database

-- 5 tables
-- write 3-5 queries
-- 1x WITH
-- 1x SUBQUERY
-- 1x Aggregate Function

.open restaurant.db

DROP TABLE menus;
CREATE TABLE IF NOT EXISTS menus (
  menu_id INT UNIQUE,
  menu_name TEXT,
  menu_type TEXT,
  menu_price_dollar REAL
);

INSERT INTO menus VALUES
  (1, "Hamburger", "Fastfood", 10),
  (2, "Pizza", "Fastfood", 15),
  (3, "Sandwich", "Fastfood", 5),
  (4, "Caprese Salad", "Vegatable", 7.50),
  (5, "Carrot Salad", "Vegatable", 8.99)
;

DROP TABLE customers;
CREATE TABLE IF NOT EXISTS customers (
  customer_id INT UNIQUE,
  customer_firstname TEXT,
  customer_lastname TEXT
);

INSERT INTO customers VALUES
  (1, "Peter", "Park"),
  (2, "Merry", "Jane"),
  (3, "Oh", "John"),
  (4, "Christ", "Redfield"),
  (5, "Bruce", "Wayne")
;

DROP TABLE order_menu;
CREATE TABLE IF NOT EXISTS order_menu (
  order_id INT UNIQUE,
  order_time DATETIME,
  table_id INT,
  customer_id INT,
  menu_id INT,
  payment_id INT
);

INSERT INTO order_menu VALUES
  (101, "2023-01-01 12:05:05", 05, 1, 2, 001),
  (102, "2023-01-01 12:06:00", 05, 2, 5, 002),
  (103, "2023-01-01 15:05:05", 01, 3, 1, 003),
  (104, "2023-01-01 17:25:25", 02, 4, 4, 004),
  (105, "2023-01-01 20:10:10", 04, 5, 3, 005)
;

DROP TABLE payment;
CREATE TABLE IF NOT EXISTS payment (
  payment_id INT UNIQUE,
  payment_method TEXT,
  order_id INT
);

INSERT INTO payment VALUES
  (001, "cash", 101),
  (002, "cash", 102),
  (003, "cash", 103),
  (004, "credit_card", 104),
  (005, "credit_card", 105)
;
  
DROP TABLE type_table;
CREATE TABLE IF NOT EXISTS type_table (
  table_id INT UNIQUE,
  table_zone TEXT
);

INSERT INTO type_table VALUES
  (01, "Regular"),
  (02, "Spacial"),
  (03, "High-Quality"),
  (04, "ForBussiness"),
  (05, "Honeymoon")
;

.mode box
.header on

.print \n Find menu value by group with type
.print \n หามูลค่าโดยรวมของอาหารแต่ละประเภท \n
SELECT 
  menu_type,
  SUM(menu_price_dollar) AS Values_Each_Type
FROM menus
GROUP BY
  menu_type
;

.print \n Using Subquery and find which menu lowest cost in fastfood type
.print \n ใช้ Subquery และหาว่าเมนูไหนมีราคาต่ำสุดในอาหารประเภท fastfood
SELECT *
FROM (SELECT 
      menu_name AS Name,
      MIN(menu_price_dollar) AS Lowest_Cost
      FROM menus
      WHERE
      menu_type = "Fastfood"
  )
;

.print \n Using With and Between to find menu price and sort by price
.print \n ใช้ with และ between เพื่อหาราคาอาหารและจัดเรียงตามราคา (น้อย > มาก) \n
WITH Between_price as (
  SELECT *
  FROM menus
  ORDER BY
    menu_price_dollar
)
SELECT *
FROM Between_price
WHERE
  menu_price_dollar BETWEEN 0 AND 10
;

.print \n Using With and find customer with lastname J at first character
.print \n ใช้ with และ หาชื่อนามสกุลลูกค้าที่ขึ้นต้นด้วย J \n
WITH customer_J as (
  SELECT
    customer_lastname AS Lastname
  FROM customers
  WHERE
    customer_lastname LIKE "J%"
)
SELECT *
FROM customer_J

;
.print \n Join table + aggregate count table group by table zone
.print \n Join table และหาว่า order ไหนใช้โต๊ะอะไรบ้าง \n
SELECT
  order_id,
  type_table.table_zone,
  COUNT(type_table.table_id) AS Used
FROM
  order_menu
JOIN type_table
  ON order_menu.table_id = type_table.table_id
GROUP BY
  type_table.table_zone
;
