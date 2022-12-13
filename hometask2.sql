DROP DATABASE lesson_2;
CREATE DATABASE lesson_2;


USE lesson_2;

CREATE TABLE movies
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(45),
title_eng VARCHAR(45),
year_movie INT,
count_min INT,
storyline VARCHAR(45)
);

INSERT INTO movies ( title, title_eng, year_movie, count_min, storyline)
VALUES
      ("Игра разума","A beautiful Mind",2001,135,"...."),
      ("Форрест Гамп","Forrest Gump",1994,142,"...."),
      ("Иван Васильевич меняет профессию","",1998,128,"...."),
	  ("Назад в будущее","Back to the Future",1985,116,"....");
      
SELECT *
FROM movies;

-- 1. Переименование таблиц
RENAME TABLE movies TO films;

-- 2. Добавление нового столбца ("ё" на англ.раскладке)
ALTER TABLE films
ADD `language` VARCHAR(45); 
SELECT *
FROM films;

-- 3. Удалить столбец
ALTER TABLE films
DROP COLUMN `language`;

-- 4.  Изменение данных в столбце
ALTER TABLE films
ADD `price` INT DEFAULT 100;  -- Любое значение PRICE = 100

UPDATE films
SET price = price + 150
WHERE title = 'Иван Васильевич меняет профессию'; -- price = price + 150

SELECT *
FROM films;

-- 5. Удаление таблицы
CREATE TABLE TEST
( ID INT);

DROP TABLE test; 


CREATE TABLE movies
(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, -- AUTO_INCREMENT (id++)
    title VARCHAR(45),
    title_eng VARCHAR(45),
    year_movie INT,
    count_min INT,
    storyline VARCHAR(45)
);

INSERT INTO movies(title, title_eng, year_movie,count_min,storyline)
VALUES 
	("Игры разума", "A Beautiful Mind",2001,135, "...."),
    ("Форрест Гамп", "Forrest Gump", 1994, 142, "----"),
    ("Иван Васильевич меняет профессию", "", 1998, 128, "----"),
    ("Назад в будущее", "Back to the Future", 1985, 116, "----");

-- 6. Очистка данных из таблицы
TRUNCATE TABLE movies;
SELECT * FROM films;


-- [100;149] - не самый популярный фильм
-- [150;199] - популярный фильм
-- [200;250] - ХИТ
SELECT title, price,
CASE
	WHEN category = 100 AND  price < 150 THEN "не самый популярный фильм"
    WHEN price >= 150 AND  price < 200 THEN "популярный фильм"
	WHEN price >= 200 AND  price <= 250 THEN "ХИТ"
    ELSE "FAIL"
END AS Result
FROM films;

SELECT *
FROM films;

-- IF(условие,истинное значение, значение для лжи)
SELECT IF(100<200, "yes", "no") AS result;

-- С помощью оператора IF, вывести, к какой группе по про-ти принадлежит фильм
-- 130+ - "полнометражка", меньше 130 - "короткометражка"

SELECT count_min, title,price,
IF(count_min > 130, "полнометражка", "короткометражка") AS `Result card`
FROM films;


