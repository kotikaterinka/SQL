CREATE DATABASE dz_3;

USE dz_3;

CREATE TABLE sales
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
count_product INT

);

INSERT INTO sales ( order_date, count_product )
VALUES
      ('2022-01-01',156),
      ('2022-01-02',180),
	  ('2022-01-03',21),
	  ('2022-01-04',124),
	  ('2022-01-05',341);
      
SELECT *
FROM sales;

-- Задание 2

SELECT  count_product,order_date,
CASE
	WHEN count_product < 100  THEN "Маленький заказ"
    WHEN count_product >= 100 AND count_product < 300 THEN "Средний заказ"
    WHEN count_product > 300  THEN "Большой заказ"

END AS "Тип заказа"
FROM sales;

-- Задание 3

CREATE TABLE orders_1
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
employee_id CHAR(45),
amount DOUBLE,
order_status VARCHAR(45)

);

INSERT INTO orders_1 ( employee_id, amount, order_status )
VALUES
      ("e03",'15.00',"OPEN"),
	  ("e01",'25.50',"OPEN"),
	  ("e05",'100.70',"CLOSED"),
	  ("e02",'22.18',"OPEN"),
	  ("e04",'9.50',"CANCELLED");
      
SELECT *
FROM orders_1;

SELECT * ,
CASE
WHEN order_status = "OPEN" THEN "Order is in open state" 
WHEN order_status = "CLOSED" THEN "Order is closed"
WHEN order_status = "CANCELLED" THEN "Order is cancelled"
ELSE "FAIL"
END AS 'Full_order_status'
FROM orders;
