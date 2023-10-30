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