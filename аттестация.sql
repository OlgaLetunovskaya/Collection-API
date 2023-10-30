USE usersdb;
/*Product (maker, model, type).
PС (code, model, speed, ram, hd, price).
Таблица Product хранит производителя (maker), номер модели (model) и тип: 
PC — ПК, Laptop — портативный компьютер, Printer — принтер.
Таблица PC содержит артикул (code), номер модели (model), скорость процессора (speed), 
оперативную память (ram), размер диска (hd), цену (price).*/
CREATE TABLE product(
    maker VARCHAR(100) NOT NULL,
    model int NOT NULL,
    type VARCHAR(100) NOT NULL
);
CREATE TABLE pc(
    code int NOT NULL,
    model int NOT NULL,
    speed int NOT NULL,
    ram VARCHAR(100) NOT NULL,
    hd VARCHAR(100) NOT NULL,
    price numeric 
);

/*вывести производителя, номер модели и цену для типа ПК с оперативной памятью выше 16 ГБ 
производителя Lenovo и его дочерних компаний (в maker встречается Lenovo)*/
SELECT Product.maker, PC.model, PC.price
FROM Product
JOIN PC ON Product.model = PC.model
WHERE Product.type = 'pc' AND PC.ram > 16 AND Product.maker LIKE 'Lenovo%';

/*вывести список производителей, у которых более 2 моделей продукта;*/
SELECT maker 
FROM Product 
GROUP BY maker 
HAVING COUNT(model) = 2;

/*вывести все уникальные наименования производителей.*/
SELECT DISTINCT maker FROM Product;
