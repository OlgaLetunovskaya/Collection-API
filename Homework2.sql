-- 1 задание
/*
Выведите уровень студента с id = 9651. При этом задайте алиас (псевдоним) для колонки 
как stud_level, а для таблицы — s.
*/
SELECT level AS stud_level
FROM student AS s
WHERE user_id = 9651

-- Выведите email учителей с id 30019 и 31433 (в одном запросе).
SELECT email
FROM teacher
WHERE teacher_id=30019 AND teacher_id= 31433

/*
Выведите данные о пользователях с уровнем Advanced, занимающихся в группах (group), 
и о пользователях с уровнем Upper-Intermediate, занимающихся индивидуально (personal).
*/
SELECT *
FROM student
WHERE education_form IN ('personal','group') AND level IN ('Advanced','Upper-Intermediate')

-- Выведите данные об учителях из групп от 180 до 190 (group_id).
SELECT teacher_id, email
FROM teacher
WHERE group_id BETWEEN 180 AND 190
--Выведите данные о пользователях, у которых email заканчивается на yahoo.com
SELECT *
FROM users
WHERE user_email LIKE '%yahoo.com' 
/*
Добавьте в таблицу subject новый предмет — Chinese (выберите id, равное 16 или следующее по порядку).
*/
INSERT INTO subject (subject_id, subject_title) 
VALUES ('17', 'Chinese')

DELETE FROM subject WHERE subject_id=17

/*
Обновите данные учителя с id 5562. У него изменилась почта с cold@gmail.com 
на cold5562@gmail.com.
*/
UPDATE teacher 
SET email='cold5562@gmail.com'  
WHERE teacher_id=5562

-- 2 задание
--Создайте таблицы в БД и заполните их данными.
CREATE TABLE posts (
    post_id INT,
	text_len INT, 
	post_date DATE
);
INSERT INTO posts (post_id, text_len, post_date) 
VALUES (1, 6799, '2023.03.09'),
       (2, 7800, '2023.03.12'),
	   (3, 6907, '2023.03.19'),
	   (4, 8890, '2023.03.22'),
	   (5, 9802, '2023.03.30');

select * from posts

CREATE TABLE tags (post_id INT, tag VARCHAR);
INSERT INTO tags (post_id, tag)
VALUES (1,'nofilter'),
       (2, 'happy'),
	   (3, 'joy'),
	   (4, 'music'),
	   (5, 'dark');
	   
select * from tags	

--Выведите данные по постам, которые длиннее 8000 символов.
SELECT * 
FROM posts
WHERE text_len>8000;

--Выведите id постов, которые отмечены тегами happy или joy.
SELECT post_id
FROM tags
WHERE tag='happy' OR tag='joy';

--Выведите id постов, которые были размещены до 10 марта 2023.
SELECT post_id
FROM posts
WHERE post_date<'2023.03.10';

/*
Добавьте пост с id 6, сделанный 31 марта 2023, содержащий 10782 символ и отмеченный 
тегом love (два INSERT в обе таблицы).
*/
INSERT INTO posts (post_id, text_len, post_date)
VALUES (6, 10782, '2023.03.31');
INSERT INTO tags (post_id, tag)
VALUES (6, 'love');

--Измените тег для поста с id =5 c dark на live.
UPDATE tags
SET tag='live'
WHERE post_id=5;
