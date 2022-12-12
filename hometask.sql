DROP DATABASE dz ;
CREATE DATABASE dz; -- Создание БД с именем дз

USE dz; -- Активная БД дз
CREATE TABLE mobile -- Создание табл с именем телефон
(
 id INT NOT NULL PRIMARY KEY,  
 ProductName VARCHAR(45),
 Manufacture VARCHAR(45),
 ProductCount INT,
 Price INT -- Целое число 
 );
 
INSERT mobile  -- Заполнение ВСЕХ столбцов табл телефон
VALUES -- Значения
  (1, "iPhone X","Apple", 3, 76000), 
  (2, "iPhone 8","Apple", 2, 5100),
  (3, "Galaxy S9","Sumsung", 2, 56000 ),
  (4, "Galaxy S8","Sumsung", 1, 41000 ),
  (5, "P 20 Pro","Huawei", 5, 36000 );
  
  SELECT *
  FROM mobile;
  
  -- 1.Выведите название, производителя и цену для товаров, количество которых превышает 2.
  SELECT ProductName,Manufacture, Price
  FROM mobile
  WHERE ProductCount > 2;
  -- 2.  Выведите весь ассортимент товаров марки “Samsung”
SELECT *
FROM mobile
WHERE Manufacture = "Sumsung";
  