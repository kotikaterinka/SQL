CREATE DATABASE lesson_4;
USE lesson_4;

CREATE TABLE teachers
(	
	id INT NOT NULL PRIMARY KEY,
    surname VARCHAR(45),
    salary INT
);

INSERT teachers
VALUES
	(1,"Авдеев", 17000),
    (2,"Гущенко",27000),
    (3,"Пчелкин",32000),
    (4,"Питошин",15000),
    (5,"Вебов",45000),
    (6,"Шарпов",30000),
    (7,"Шарпов",40000),
    (8,"Питошин",30000);
    
SELECT * from teachers; 

CREATE TABLE lessons
(	
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    course VARCHAR(45),
    teacher_id INT,
    FOREIGN KEY (teacher_id)  REFERENCES teachers(id)
);

INSERT INTO lessons(course,teacher_id)
VALUES
	("Знакомство с веб-технологиями",1),
    ("Знакомство с веб-технологиями",2),
    ("Знакомство с языками программирования",3),
    ("Базы данных и SQL",4);

-- Получить фамилию учителей и курсы, которые они ведут (общая часть из таблиц лессонс и тичерс)
SELECT t.surname, l.course, l.teacher_id, t.id  -- t - псевдоним, чтобы не писать длинное тичерс
FROM  teachers t 		# JOIN = INNER JOIN (MySQL)
JOIN lessons l  -- l псвевдоним
ON t.id = l.teacher_id; -- t = teachers 
-- Выбрать фамилию всех учителей и курсы, которые они ведут. Если учитель не ведет курс, его фамилию все равно необходимо вывести
 
-- Вывести учителей, которые не ведут никакие курсы

-- SELECT * FROM teachers
-- WHERE NOT EXISTS
-- (SELECT * FROM lessons WHERE lessons.teacher_id = teachers.id);

-- Получите список курсов и учителей , которые их ведут (используя RIGHT JOIN)
SELECT t.surname, l.course, l.teacher_id, t.id
FROM  teachers t 		# JOIN = INNER JOIN (MySQL)
RIGHT JOIN lessons l 
ON t.id = l.teacher_id; -- t = teachers
-- Получить информацию по учителям , которые ведут курс "Знакомство с веб-технологиями"
-- С помощью фильтра “WHERE”
SELECT t.*, l.course
FROM  teachers t 		# JOIN = INNER JOIN (MySQL)
LEFT JOIN lessons l 
ON t.id = l.teacher_id
WHERE l.course = "Знакомство с веб-технологиями";
-- 5.2. 	С помощью подзапроса (выборка с помощью с SELECT-a)
SELECT t1.*, t2.*
FROM teachers t1
JOIN (SELECT course, teacher_id FROM lessons  WHERE course = "Знакомство с веб-технологиями") t2 
ON t1.id = t2.teacher_id;

SELECT t.*, l.*
FROM teachers t
CROSS JOIN lessons l;
