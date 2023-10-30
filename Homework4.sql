-- 1 задание
--Найдите учеников и все группы, в которых преподает учитель с почтой blanda.jamil@yahoo.com.
SELECT s.user_id,s.group_id,
       t.teacher_id,t.email AS teacher_email
FROM group_student AS s
JOIN teacher AS t
ON s.group_id=t.group_id
WHERE t.email='blanda.jamil@yahoo.com'

--Выведите уровень ученика с почтой gpagac@jacobs.com
SELECT student.level
FROM student
JOIN users
ON student.user_id = users.user_id
WHERE users.user_email = 'gpagac@jacobs.com';

/*
Выведите уникальные названия предметов, которые изучает ученик c user_id=11300 
(таблицы user и subject)
*/
SELECT DISTINCT subject_title
FROM subject
JOIN users
ON subject.subject_id=users.subject_id
WHERE user_id=11300

SELECT DISTINCT subject_title
FROM users
JOIN subject 
ON users.subject_id = subject.subject_id
WHERE user_id = 11300;

SELECT DISTINCT subject_title
FROM subject
WHERE subject_id IN (
SELECT subject_id
FROM users
WHERE user_id = 11300
)
/*Последний запрос делала по справочнику. И вопрос, почему при разных значениях FROM в первых 2х
запросах результат оказался одинаковый?*/

--Выведите уникальные уровни учеников, которые занимаются в группе с id = 10.
SELECT DISTINCT level
FROM student
JOIN group_student 
ON student.user_id = group_student.user_id
WHERE group_student.group_id=10

--2 задание
CREATE TABLE POSITIONS (
   id_check int4,
   id_pos   int4,
   art      varchar,
   quantity int4
);
INSERT INTO (id_check,id_pos,art,quantity)
VALUES (1,1,'A1',1),
       (1,2,'A4',3),
       (1,3,'A2',2),
       (1,4,'A10',1),
       (1,5,'A8',4),
       (2,1,'A5',1),
       (2,2,'A7',1),
       (2,3,'A3',2),
       (3,1,'A2',1),
       (3,2,'A9',1),
       (3,3,'A5',2),
       (3,4,'A6',1),
       (3,5,'A3',3),
       (4,1,'A1',3),
       (4,2,'A2',1),
       (5,1,'A2',1),
       (5,2,'A8',5),
       (5,3,'A3',1),
       (5,4,'A4',1),
       (5,5,'A5',1);

CREATE TABLE PRODUCTS (
   art      varchar,
   product  varchar,
   category varchar	
);
INSERT INTO (art, product, category)
VALUES ('A1','кроссовки','обувь'),
       ('A2','кеды','обувь'),
       ('A3','сланцы','обувь'),
       ('A4','куртка','одежда'),
       ('A5','ветровка','одежда'),
       ('A6','шорты','одежда'),
       ('A7','палатка','туризм'),
       ('A8','коврик','туризм'),
       ('A9','спальник','туризм'),
       ('A10','рюкзак','туризм'),
       ('A11','туфли','обувь'),
       ('A12','солнечные очки','аксессуары'); 

--Выведите названия уникальных категорий, которые были куплены в чеке с id = 3.
SELECT DISTINCT category
FROM products
JOIN positions 
ON positions.art=products.art
WHERE positions.id_check=3

--Выведите артикулы продуктов, которые не покупали (т. е. они не встречаются ни в одном чеке).
SELECT p.art
FROM products AS p
WHERE NOT EXISTS (
  SELECT 1
  FROM positions AS pos
  WHERE pos.art = p.art
);
--Делала с помощью интернета

--Посчитайте количество чеков, в которых куплено больше двух пар одинаковой обуви.
SELECT COUNT(DISTINCT id_check) as count_checks
FROM positions
WHERE art IN (
SELECT art
FROM positions
GROUP BY art
HAVING SUM(quantity) > 2
)

--Посчитайте количество чеков, в которых куплено больше двух позиций любой одежды.
SELECT COUNT(DISTINCT id_check) AS count_checks
FROM positions
JOIN products ON positions.art = products.art
WHERE products.category = 'одежда'
HAVING COUNT(*) > 2