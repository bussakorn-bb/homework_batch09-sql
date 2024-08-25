---------------Table Customers
CREATE TABLE customers (
  Customersid int primary key, 
  Firstname text,
  Lastname text,
  Gender text
);
INSERT INTO customers
VALUES 
  (1, "Kylie", "Jenner", "Female"),
  (2, "Shawn", "Mendes", "Male"),
  (3, "Lady", "Gaga", "Female"),
  (4, "Justin", "Bieber", "Male"),
  (5, "Hailey", "Bieber", "Female"),
  (6, "Kendall", "Jenner", "Female"),
  (7, "Peter", "Parker", "Male"),
  (8, "Kris", "Jenner", "Female"),
  (9, "Jaden", "Smith", "Male"),
  (10, "Adam", "Levine", "Male");
.mode box
SELECT * FROM customers;
----------------Table Menus
CREATE TABLE menus (
  Menuid int primary key, 
  Menuname text,
  Price int,
  Orderid int
  );

INSERT INTO menus
VALUES 
  (1, "Mix Special", 250, 4),
  (2, "Chicken Cheese", 160, 3),
  (3, "Super Deluxe", 200, 1),
  (4, "Veggie", 180, 6),
  (5, "Bacon and BBQ", 200, 5),
  (6, "Hawaiian", 150, 2);
SELECT * FROM menus;

CREATE TABLE orders (
  Orderid int primary key, 
  Customersid int, 
  Gender text,
  Menuid int, 
  Orderdate timestamp
);

------------------Table Orders
INSERT INTO orders 
VALUES 
  (1, 8, "Female", 6, '2023-09-15'),
  (2, 3, "Female", 4, '2023-09-23'),
  (3, 1, "Female", 1, '2023-10-02'),
  (4, 9,"Male", 5, '2023-10-15'),
  (5, 2, "Male", 3, '2023-10-21'),
  (6, 4, "Male", 2, '2023-10-25'),
  (7, 9, "Male", 4, '2023-11-21'),
  (8, 7, "Male", 4, '2024-10-01'),
  (9, 4, "Male", 2, '2023-06-17'),
  (10, 6, "Female", 1, '2024-05-31'),
  (11, 10, "Male", 1, '2024-02-21'),
  (12, 3, "Female", 4, '2024-09-21'),
  (13, 2, "Male", 1, '2023-12-01'),
  (14, 7, "Male", 1, '2025-01-24'),
  (15, 8, "Female", 1, '2023-04-09');
.mode box
SELECT * FROM orders;
-------Retrieve data about customers who order and what date did they order?
SELECT 
  c.firstname || " " || lastname AS Fullname,
  m.menuname,
  o.orderdate
FROM customers AS c 
JOIN orders AS o 
  ON c.customersid = o.customersid
JOIN menus AS m
  ON o.orderid = m.orderid;
---------Retrieve all menu with the highest and cheapest prices
SELECT
    Menuname,
    MAX(price) AS "Highest price"
FROM menus;

SELECT
    Menuname,
    MIN(price) AS "Cheapest price"
FROM menus;
---------Retrieve all menu with 10% discount
SELECT 
  Menuname,
  Price,
  price*(1.0 - 00.1) AS "10% Discount"
FROM menus;
------Retrieve all customers whom last name staring with J 
SELECT Firstname, Lastname FROM customers 
WHERE Lastname IN (
  SELECT Lastname FROM customers
  WHERE Lastname  LIKE 'J%');

--------Retrieve the most ordered menus sort by descending 

SELECT Menus.Menuname, COUNT(*) AS Total
FROM Orders
INNER JOIN Menus ON Orders.Menuid = Menus.Menuid
GROUP BY Menus.Menuname
ORDER BY Total DESC
