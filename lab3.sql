-- Лабораторная 3
-- задача 1.	Напишите запрос для вывода текущей даты. Назовите столбец Date.
SELECT SYSDATE as "Date"
FROM dual;

-- Задача 2. Выведите номер служащего, его фамилию, оклад и новый оклад, повышенный на 15% и округлённый до целого. 
-- Назовите столбец New Salary. Сохраните команду SQL в текстовом файле lab3_2sql.

-- Задача 3.	Выполните запрос из файла lab3_2sql.
SELECT employee_id, last_name, salary as "Current Salary", Round((salary*1.15), 0) as "New Salary + 15%"
FROM employees;

-- Задача 4.	Измените lab3_2.sql. добавьте ещё один столбец, который будет содержать результат 
-- вычитания старого оклада из нового. Назовите столбец Increase. Сохраните изменённый запрос в lab3_4.sql. 
-- Выполните запрос ещё раз.
SELECT employee_id, last_name, salary as "Current Salary", Round((salary*1.15), 0) as "New Salary + 15%", (ROUND(salary*1.15,0)-salary) as "Increase"
FROM employees;

-- Задача 5.	Выведите фамилии служащих (первая буква каждой фамилии должна быть заглавной, 
-- а остальные - строчными) и длину каждой фамилии для тех служащих, фамилия которых начинается с 
-- символа J, A или М. Присвойте соответствующие заголовки столбцам.
SELECT last_name as "Name", LENGTH (last_name) as "Length"
FROM employees
WHERE last_name like 'A%' OR last_name like 'J%' OR last_name like 'M%';