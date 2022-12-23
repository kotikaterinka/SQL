CREATE DATABASE lesson_5;
USE lesson_5;

create table academic_record (
	name varchar(45),
	quartal  varchar(45),
    subject varchar(45),
	grade int
);

insert into academic_record
values
	('Александр','1 четверть', 'математика', 4),
	('Александр','2 четверть', 'русский', 4),
	('Александр', '3 четверть','физика', 5),
	('Александр', '4 четверть','история', 4),
	('Антон', '1 четверть','математика', 4),
	('Антон', '2 четверть','русский', 3),
	('Антон', '3 четверть','физика', 5),
	('Антон', '4 четверть','история', 3),
    ('Петя', '1 четверть', 'физика', 4),
	('Петя', '2 четверть', 'физика', 3),
	('Петя', '3 четверть', 'физика', 4),
	('Петя', '4 четверть', 'физика', 5);

select * 
from academic_record;

-- 1. Средний балл ученика по всем предметам avg
SELECT name, subject, grade, quartal,-- получим имя и тд, далее указываем агрегатную ф-ю
      AVG(grade) OVER (PARTITION BY NAME) AS avg_grade   -- СРЕДНЯЯ ОЦЕНКА ПО ТАБИЦЕ ИМЯ
 FROM   academic_record --  получим данные из табл  
-- добавляем условие, что получаем средние оценки ТОЛЬКО ЗА 1 ЧЕТВЕРТЬ
WHERE quartal = '1 четверть';

-- 2. Наименьшую и наименьшую оценку ученика min
SELECT name, subject, grade, quartal,-- получим имя и тд, далее указываем агрегатную ф-ю
      AVG(grade) OVER (PARTITION BY NAME) AS avg_grade,   -- СРЕДНЯЯ ОЦЕНКА ПО ТАБИЦЕ ИМЯ
      max(grade) OVER (PARTITION BY NAME) AS max_grade,
	  min(grade) OVER (PARTITION BY NAME) AS min_grade,
	  sum(grade) OVER (PARTITION BY NAME) AS sum_grade, -- sum count проверка на avg
      count(grade) OVER (PARTITION BY NAME) AS count_grade
 FROM   academic_record; --  получим данные из табл  

-- 3. Оценка Пети по физике в следующей четверти LEAD, в предыдущей четверти LAG
SELECT name, subject, grade, quartal,
       LAG(grade) OVER (ORDER BY QUARTAL) AS previous_grade,
	  LEAD(grade) OVER (ORDER BY QUARTAL) AS next_grade
 FROM   academic_record
WHERE name = "Петя";

-- ЗАДАНИЕ 2
CREATE TABLE summer_medals 
(
	year INT,
    city VARCHAR(45),
    sport VARCHAR(45),
    discipline VARCHAR(45),
    athlete VARCHAR(45),
    country VARCHAR(45),
    gender VARCHAR(45),
    event VARCHAR(45),
    medal VARCHAR(45)
);

SELECT *
FROM summer_medals;
INSERT summer_medals
VALUES
	(1896, "Athens", "Aquatics", "Swimming", "HAJOS ALfred", "HUN", "Men","100M Freestyle", "Gold"),
	(1896, "Athens", "Archery", "Swimming", "HERSCHMANN Otto", "AUT", "Men","100M Freestyle", "Silver"),
    (1896, "Athens", "Athletics", "Swimming", "DRIVAC Dimitros", "GRE", "Men","100M Freestyle For Saliors", "Bronze"),
    (1900, "Athens", "Badminton", "Swimming", "MALOKINIS Ioannis", "GRE", "Men","100M Freestyle For Saliors", "Gold"),
    (1896, "Athens", "Aquatics", "Swimming", "CHASAPIS Spiridon", "GRE", "Men","100M Freestyle For Saliors", "Silver"),
    (1896, "Athens", "Aquatics", "Swimming", "CHOROPHAS Elfstathios", "GRE", "Men","1200M Freestele", "Bronze"),
    (1905, "Athens", "Aquatics", "Swimming", "HAJOS ALfred", "HUN", "Men","100M Freestyle For Saliors", "Gold"),
    (1896, "Athens", "Aquatics", "Swimming", "ANDREOU Joannis", "GRE", "Men","1200M Freestyle", "Silver"),
    (1896, "Athens", "Aquatics", "Swimming", "CHOROPHAS Elfstathios", "GRE", "Men","400M Freestyle", "Bronze");

-- 1.Выберите имеющиеся виды спорта и пронумеруем их в алфавитном порядке
SELECT sport,
ROW_NUMBER() OVER(ORDER BY sport) AS row_nam-- номер строчки 
FROM (SELECT DISTINCT sport--  83, 84 избавляемся от дубликатов в столбце со спортом 
FROM summer_medals) AS sports;

-- 2.Создайте представление (VIEW), в которое попадает информация о спортсменах
CREATE VIEW `V_show_sportsmen`  AS-- имя представления, через AS указываем, что попадает под представление
SELECT *
FROM summer_medals;
-- чтобы вывести таблицу в терминал
SELECT *
FROM `V_show_sportsmen`;

SHOW  full tables -- показывает список представлений 
WHERE TABLE_TYPE LIKE 'VIEW';

-- 3.Создайте представление,в котором будет храниться информация о спортсменах по конкретному виду спорта (Aquatics)
CREATE VIEW `V_show_Aquatics` AS -- имя представления, через AS указываем, что попадает под представление
SELECT sport, athlete
FROM summer_medals
WHERE sport = "Aquatics";

SELECT *
FROM `V_show_Aquatics`;

-- ПОЛУЧИТЬ ВСЕ ПРЕДСЬАВЛЕНИЯ В КОНСОЛЬ
SHOW full tables
WHERE TABLE_TYPE LIKE 'VIEW';
