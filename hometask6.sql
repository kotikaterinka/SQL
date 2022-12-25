CREATE DATABASE dz_5;
USE dz_5;
CREATE TABLE cars
(
 id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
 (1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
 (5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- 1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE VIEW V_show_cars  
AS           -- имя представления, через AS указываем, что попадает под представление
SELECT *
FROM cars
WHERE cost < 25000;

SELECT *
FROM V_show_cars;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
ALTER VIEW V_show_cars  
AS             -- имя представления, через AS указываем, что попадает под представление
SELECT *
FROM cars
WHERE cost < 30000;

-- 3.  Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW V_name_cars  
AS
SELECT *
FROM cars
WHERE name in  ("Skoda", "Audi");  -- WHERE NAME = (("Skoda", "Audi"); 

SELECT *
FROM V_name_cars;

USE dz_5;
CREATE TABLE stations
(
train_id INT NOT NULL,
station varchar(20) NOT NULL,
station_time TIME NOT NULL
);

INSERT stations(train_id, station, station_time)
VALUES (110, "SanFrancisco", "10:00:00"),
(110, "Redwood Sity", "10:54:00"),
(110, "Palo Alto", "11:02:00"),
(110, "San Jose", "12:35:00"),
(120, "SanFrancisco", "11:00:00"),
(120, "Palo Alto", "12:49:00"),
(120, "San Jose", "13:30:00");

SELECT train_id, station, station_time, 
  timediff(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY station_time), station_time) As `Time to next station`
FROM stations;
