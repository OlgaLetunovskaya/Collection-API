--1 задание
select * from student

--Найдите общее количество индивидуально обучающихся студентов для каждого уровня.

SELECT COUNT(*)
FROM student
WHERE education_form='personal';

--Найдите общее количество учащихся школы с уровнем Advanced для каждой формы обучения.

SELECT education_form, COUNT(*) as Advanced
FROM student
WHERE level = 'Advanced'
GROUP BY education_form;
/* Этот запрос выбирает всех учеников с уровнем образования Advanced, а затем группирует их 
по форме обучения (education_form) и подсчитывает количество для каждой группы с помощью функции COUNT(). Результат будет содержать два столбца: study_form и advanced_students
(общее количество учеников с уровнем Advanced для каждой формы обучения)
*/

/*
Найдите общее количество учащихся школы в разрезе уровня и формы обучения, отсортированных 
по уровню в порядке возрастания и по форме обучения в порядке убывания.
*/

SELECT level, education_form, COUNT(*) AS count
FROM student
GROUP BY level, education_form
ORDER BY level ASC, education_form DESC;

--Найдите максимальное и минимальное id группы (одним запросом).

select * from group_student

SELECT MIN(group_id) as min, MAX(group_id) as max 
FROM group_student;

--Найдите количество учеников и id группы, в которой наибольшее количество учеников.

SELECT COUNT(*) AS count, group_id
FROM group_student
GROUP BY group_id
ORDER BY count DESC
LIMIT 1;

--2 задание
--Создать таблицу

CREATE TABLE customers (
    customer_id int4,
    customer_nm varchar(255)
);
INSERT INTO customers (customer_id, customer_nm) 
VALUES (1, 'Катя'),
       (2, 'Света'),
	   (3, 'Коля');
	   
select * from customers	  

CREATE TABLE sales (
    sale_id int4,
    store_id int4,
    customer_id int4,
    dt date,
    amt numeric(10,2)
);
INSERT INTO sales (sale_id, store_id, customer_id, dt, amt) 
VALUES (1, 45, 1, '08-08-2021', 2025.20),
       (2, 23, 2, '2022-06-15', 25678.50),
	   (3, 14, 3, '2022-07-09', 8531.35),
	   (4, 56, 1, '2023-03-14', 9543.90),
	   (5, 15, 2, '2023-05-16', 200.60),
	   (6, 17, 3, '2023-06-01', 3000.20),
	   (7, 23, 1, '2023-07-01', 478.30),
	   (8, 63, 2, '2023-08-16', 100.00);
	   
select * from sales	   

--Выведите максимальную сумму покупки

SELECT MAX(amt) FROM sales

--Выведите минимальную дату покупки.

SELECT MIN(amt) FROM sales

--Выведите среднюю сумму покупок для customer_id = 1.

SELECT AVG(amt) FROM sales WHERE customer_id=1

/*
Выведите минимальную и максимальную сумму покупки, совершенную в магазине с store_id = 3 
или покупателем с customer_id = 2.
*/

SELECT MIN(amt) as min, MAX(amt) as max 
FROM sales
WHERE store_id=3 OR customer_id=3

--Выведите количество уникальных имен покупателей.

select* from customers

SELECT COUNT(DISTINCT customer_nm ) as count 
FROM customers