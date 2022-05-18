-- Лабораторная работа 5
-- Задача 1. Напишите запрос для вывода фамилии, 
-- номера отдела и названия отдела для всех служащих.
SELECT
    last_name,
    department_id,
    department_name
FROM
         employees
    JOIN departments USING ( department_id );

-- Задача 2. Выведите список всех должностей в отдел 80 
-- (должности в списке не должны повторяться) и местоположение отдела.
SELECT DISTINCT
    job_id,
    location_id
FROM
         employees
    JOIN departments USING ( department_id )
WHERE
    department_id = 80;

-- Задача3.	Напишите запрос для вывода фамилий, названия отдела, 
-- идентификатора местоположения отдела и города, в котором он находится, 
-- для всех служащих, зарабатывающих комиссионные.
SELECT
    e.last_name,
    d.department_name,
    l.location_id,
    l.city
FROM
         departments d
    JOIN employees e ON ( d.department_id = e.department_id )
    JOIN locations l ON ( l.location_id = d.location_id )
WHERE
    e.commission_pct IS NOT NULL;

-- Задача 4.	Выведите фамилии всех служащих, содержащих букву «а» 
-- (в строчном регистре), с названиями отделов. Сохраните свою команду 
-- SQL в файле lab4_4.sql.
SELECT
    e.last_name,
    d.department_name
FROM
         employees e
    JOIN departments d ON ( e.department_id = d.department_id );

-- Задача 5. Напишите запрос для вывода фамилии, должности, номера отдела
-- и названия отдела всех служащих, работающих в городе Toronto.
SELECT
    e.last_name,
    e.job_id,
    e.department_id,
    d.department_name
FROM
         employees e
    JOIN departments d ON ( e.department_id = d.department_id )
    JOIN locations   l ON ( l.location_id = d.location_id )
WHERE
    l.city = 'Toronto';

-- Задача 6. Выведите фамилии и номера всех служащих вместе 
-- с фамилиями и номерами их менеджеров. Назовите столбцы 
-- EMPLOYEE, Emp#, Manager и Mgr#. Сохраните свою команду 
-- SQL в файле lab4_6.sql.
SELECT
    worker.last_name    AS "Employee",
    worker.employee_id  AS "EMP#",
    manager.employee_id AS "Manager",
    manager.last_name   AS "Mgr#"
FROM
         employees worker
    JOIN employees manager ON ( worker.manager_id = manager.employee_id );

-- Задача 7. Измените файл lab4_6.sql так, чтобы получить фамилии 
-- всех служащих, включая Кинга, который не имеет менеджера. 
-- Упорядочьте результат по возрастанию номера служащего. 
-- Сохраните изменённый запрос в текстовом файле lab4_7.sql. Выполните запрос.
SELECT
    worker.last_name                       AS "Employee",
    worker.employee_id                     AS "EMP#",
    nvl(manager.last_name, ' ')            AS "Manager",
    nvl(to_char(manager.employee_id), ' ') AS "Mgr#"
FROM
    employees worker
    LEFT JOIN employees manager ON ( worker.manager_id = manager.employee_id )
ORDER BY
    worker.employee_id;

-- Задача 8. Создайте запрос для вывода номера отдела, фамилии служащего и фамилий 
-- всех служащих, работающих в одном отделе с данным служащим. Дайте столбцам соответствующие имена.
SELECT
    emp.department_id AS department,
    emp.last_name     AS "Last Name",
    col.last_name     AS "Collegue's Last Name"
FROM
         employees emp
    JOIN employees col ON emp.department_id = col.department_id
WHERE
    emp.employee_id <> col.employee_id
ORDER BY
    emp.last_name;

-- Задача 9. Покажите структуру таблицы JOB_GRADES. Создайте запрос для вывода фамилии,
-- должности, названия отдела, оклада и категории (GRADE_LEVEL) всех служащих
SELECT
    emp.last_name,
    emp.job_id,
    dept.department_name,
    emp.salary,
    grades.grade_level AS "GRA"
FROM
         employees emp
    JOIN departments dept ON ( emp.department_id = dept.department_id )
    LEFT JOIN job_grades  grades ON emp.salary BETWEEN grades.lowest_sal AND grades.highest_sal;

-- Задача 10. Создайте запрос для вывода фамилий и дат найма всех служащих, 
-- нанятых после Davies
SELECT
    last_name,
    to_char(hire_date, 'DD-MON-YY') AS "Hire_Date"
FROM
    employees
WHERE
    hire_date > (
        SELECT
            hire_date
        FROM
            employees
        WHERE
            last_name = 'Davies'
    );
                   
-- Задача 11. По всем служащим нанятым раньше своих менеджеров, выведите фамилии 
-- и даты найма самих служащих, а также фамилии и даты найма их менеджеров. 
-- Назовите столбцы Employee, Emp, Manager и Manager Hired.
SELECT
    worker.last_name                       AS "Employee",
    to_char(worker.hire_date, 'DD-MON-YY') AS "Emp Hired",
    manager.last_name                      AS "Manager",
    to_char(manager.hire_date, 'DD-MM-YY') AS "Mgr hired"
FROM
         employees worker
    JOIN employees manager ON ( worker.manager_id = manager.employee_id )
WHERE
    worker.hire_date > manager.hire_date;

-- Задача 12. Выведите номера, наименования и местоположение всех отделов,
-- а также количество работающих в них сотрудников. Обеспечьте вывод отделов
-- в которых нет сотрудников.
SELECT
    department_id      AS "Department ID",
    department_name    AS "Department Name",
    location_id        AS "Location ID",
    COUNT(employee_id) AS "# of Employees"
FROM
    departments
    LEFT JOIN employees USING ( department_id )
GROUP BY
    department_id,
    department_name,
    location_id
ORDER BY
    department_id;
    
-- Задача 13.	Какие должности имеются в отделах Administration и Executive,
-- а также сколько сотрудников занимают эти должности? 
-- Выведите первыми наиболее часто встречаемые должности.
SELECT
    job_id,
    COUNT(employee_id) AS "Frequency"
FROM
    employees
    LEFT JOIN departments USING ( department_id )
WHERE
    department_name = 'Administration'
    OR department_name = 'Executive'
GROUP BY
    job_id
ORDER BY
    "Frequency" DESC;

-- Задача 14. Покажите сотрудников, менеджеры которых имеют оклад выше $15000.
-- выведите следующие сведения: фамилию сотрудника, фамилию менеджера,
-- его оклад и уровень оклада (GRADE_LEVEL).

SELECT
    worker.last_name   AS "Last_Name",
    manager.last_name  AS "Manager",
    manager.salary     AS "Salary",
    grades.grade_level AS "GRA"
FROM
         employees worker
    JOIN employees  manager ON worker.manager_id = manager.employee_id
    LEFT JOIN job_grades grades ON manager.salary BETWEEN grades.lowest_sal AND grades.highest_sal
WHERE
    manager.salary > 15000
ORDER BY
    manager.salary DESC;
