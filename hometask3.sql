CREATE DATABASE lesson_3;

USE lesson_3;
-- "ё" на англ. раскладке

CREATE TABLE `workers`
(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45),
    `surname` VARCHAR(45),
    `speciality` VARCHAR(45),
    `seniority` INT, -- стаж работы
    `salary` INT,
    `age` INT
);

INSERT `workers`(name, surname,speciality,seniority,salary,age)
VALUES 	
	("Вася", "Васькин", "начальник", 40, 100000, 60),
    ("Петя", "Петькин", "начальник", 8, 70000, 30),
    ("Катя", "Петькина", "инженер", 2, 70000, 25),
    ("Иван", "Иванов", "инженер", 12, 50000, 35),
    ("Саша", "Сашкин", "рабочий", 20, 30000, 40),
    ("Петр", "Петров", "рабочий", 40, 30000, 59);


SELECT * FROM `workers`;

-- 1.	Выведите все записи, отсортированные по полю "age" по возрастанию
SELECT *
FROM workers
ORDER BY age ; -- agw ASC - по воз-ю, age DESC - по убыванию  ЕСЛИ НИЧЕГО НЕ УКАЗЫВАТЬ, ТО АВТОМАТИЧЕСКИ ПО ВОЗРАСТАНИЮ

-- 2.	Выведите все записи, отсортированные по полю "name"
SELECT *
FROM workers
ORDER BY name ; -- name ASC А-Я, name DESC Я-А

-- 3.	Выведите записи полей "name", "surname","age",
-- отсортированные по полю "name" в алфавитном порядке по убыванию
SELECT name, surname, age
FROM workers 
ORDER BY name DESC;

-- 4.	Выполните сортировку по полям "name" и "age" по убыванию С ДОПОЛНЕНИЕМ НОВОГО ЧЕЛОВЕКА
INSERT `workers`(name, surname,speciality,seniority,salary,age)
VALUES 	
	("Петр", "Васькин", "начальник", 40, 100000, 60);
SELECT name, surname, age
FROM workers 
ORDER BY name DESC, age DESC; -- СНАЧАЛА ИМЯ ПО УБЫВАНИЮ ОТ Я ДО А, ДАЛЕЕ ПО ГОДАМ

-- АГРЕГАТНЫЕ ФУНКЦИИ - ф-я, которая воспринимает набор параметров и выдает конечный результат (1 число)

-- 1. Выведем УНИКАЛЬНЫЕ (DISTINCT) имена из таблички workers
SELECT DISTINCT name
FROM workers;
 
SELECT count(name) -- Вывод всех строчек втаблице 
FROM workers;

-- 2. Вывести первые 2 строчки (LIMIT)
SELECT id,name 
FROM workers
LIMIT 2; -- Первые 2 строчки из запроса

-- 3. Пропустить первые 2 строчки и извлечь следующие 4
SELECT id,name 
FROM workers
LIMIT 2, 4; -- Пропустили первые 2 строчки (id = 1,2) И ВЫВЕСТИ СЛЕДУЮЩИЕ 4
-- Выведем следующие 4 строчки(id = 3,4,5,6)

-- Пропустите две последнии строки (где id=6, id=5)  ORDER BY id DESC
-- и извлекаются следующие за ними 3 строки (где id=4, id=3, id=2)
SELECT id,name 
FROM workers
ORDER BY id DESC
LIMIT 2, 3;

-- SUM: 100, 400, 500, 1000 => 2000 (sum,avg, min,max, count())

-- 1. Получим суммарную зарплату сотрудников завода
SELECT SUM(salary) AS Result -- СТОЛБИК С СУММАРОНЙ ЗП НАЗЫВАЕТСЯ КАК Result
FROM workers;

SELECT CEIL(3.501); -- 4 (ОКРУГЛЯЕТ В большую сторону)
SELECT FLOOR(3.501); -- 3 (ОКРУГЛЯЕТ В меньшую сторону)

-- 2. Среднюю зарплату по СПЕЦИАЛЬНОСТИ
SELECT FLOOR(AVG(salary)), speciality
FROM workers
GROUP BY speciality;  -- указывает на среднюю зп именно по СПЕЦИАЛЬНОСТИ

-- Через псевдоним , чтобы название столбика было компактным и проверка на  правильность подсчета среднего арифметического
SELECT AVG(salary) AS average, speciality,
SUM(salary) AS sum, COUNT(salary) AS count, SUM(salary) / COUNT(salary) AS result_average ,
MIN(salary), MAX(salary) -- мин и макс по ЗП по специальностям
FROM workers
GROUP BY speciality;  -- указывает на среднюю зп именно по СПЕЦИАЛЬНОСТИ

-- По специальностям, на которых работает как минимум 3 человека, получить статистику из прошлого задания с использованием HAVING
SELECT AVG(salary) AS average, speciality,
SUM(salary) AS sum, COUNT(salary) AS count, SUM(salary) / COUNT(salary) AS result_average ,
MIN(salary), MAX(salary)
FROM workers
WHERE speciality != "рабочий"
GROUP BY speciality
HAVING count(speciality) >= 2;

-- WHERE НЕ работает с агрегатными функциями
-- HAVING без GROUP BY = WHERE