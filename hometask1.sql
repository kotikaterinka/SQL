CREATE DATABASE lesson_1; -- Создание БД с именем lesson_1
# Это комментарий 
/* Это многострочный
комментарий
*/
USE lesson_1; -- Активная бд - lesson_1
CREATE TABLE teachers  -- Cоздание таблицы с именем teachers
(
	id INT NOT NULL PRIMARY KEY, -- Целое число, не является значением NULL
    surname VARCHAR(45),		 -- VARCHAR(45) - строчка на 45 символов
    salary INT -- Целое число (ЗП)
);
-- Заполнение таблички данными
INSERT teachers -- Заполняете ВСЕ столбцы таблчики teachers
VALUES -- Значения
	(1, "Иванов", 30000),
    (2, "Петров", 40000),
    (3, "Иванова", 50000),
    (4, "Петрова", 70000);
    
SELECT *
FROM teachers; -- Выбор всех значений из таблички teachers


CREATE TABLE lessons  -- Cоздание таблицы с именем lessons
(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, -- Целое число, не является значением NULL,автозаполнение ключей
    course VARCHAR(45),		 -- VARCHAR(45) - строчка на 45 символов
    teacher_id INT, -- названиеТаблицы_id
    FOREIGN KEY (teacher_id) REFERENCES teachers(id) -- Таблица (поле)
);

-- Заполнение таблицы данными
INSERT lessons(course, teacher_id) 
VALUES 
	("C#", 2),
    ("SQL", 1),
    ("SQL", 3),
    ("C#", 4);
    
SELECT *
FROM lessons;

-- 1.	Получить список с информацией обо всех учителях
SELECT *
FROM teachers; 
-- 2. 	Получить информацию о Иванове (м.р.)
SELECT surname, salary
FROM teachers
WHERE surname = "Иванов";
-- 3. 	Выведем фамилию и зарплату учителя
SELECT surname, salary
FROM teachers;
-- 4*.	Выбрать учителей, фамилии которых начинаются с буквы «И».
SELECT surname, salary
FROM teachers
WHERE surname LIKE "и%";

SELECT surname, salary
FROM teachers
WHERE surname LIKE "%"; -- Овечкин

-- 1.	Выбрать всех сотрудников,у которых зарплата больше 40000
SELECT surname, salary
FROM teachers
WHERE salary > 40000;
-- 2.	Покажите  всех cписок уроков, кроме "С#"
SELECT *
FROM lessons
WHERE course != "C#";
-- 3. Покажите ТОЛЬКО курс по "C#"
SELECT *
FROM lessons
WHERE course = "C#";
