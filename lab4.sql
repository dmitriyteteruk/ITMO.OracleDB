-- Лабораторная работа 4
-- Задача 1.	Для каждого служащего выведите фамилию и вычислите количество месяцев 
-- со дня найма до настоящего времени, округлённое до ближайшего целого. Назовите столбец MONTH_WORKED. 
-- Результаты отсортируйте по количеству отработанных месяцев. Округлите число до ближайшего целого
SELECT
    last_name,
    round((sysdate - hire_date) / 365, 0) AS "Month_Worked"
FROM
    employees;

-- Задача 2.	Получите по каждому служащему отчёт в следующем виде:
-- <фамилия> зарабатывает <оклад> в месяц, но желает <утроенный оклад>. Назовите столбец Dream Salaries
SELECT
    ( last_name
      || ' earns $'
      || salary
      || ' monthly but wants $'
      || salary * 3 ) AS "Dream Salaries"
FROM
    employees;

-- Задача 3.	Напишите запрос для вывода фамилий и окладов всех служащих. 
-- Назовите выходной столбец SALARY. Длина столбца SALARY – 15 символов с заполнением символом $.
SELECT
    last_name,
    lpad(salary, 15, '$') AS "Salary"
FROM
    employees;

-- Задача 4.	Для каждого служащего выведите фамилию, дату найма и дату пересмотра зарплаты, 
-- которая приходится на первый понедельник после 6 месяцев работы. Назовите столбец REVIEW. 
-- Формат даты при выводе имеет вид: “Monday, the Thirty-First of MM, YYYY”.
SELECT
    last_name,
    hire_date,
    'Monday, '
    || to_char(next_day(add_months(hire_date, 6), 'ПОНЕДЕЛЬНИК'), '"the" fmDdspth "of" Month, YYYY') "Review"
FROM
    employees;

-- Задача 5. По каждому служащему выведите фамилию, дату  найма и день недели, 
-- когда он был нанят на работу. Назовите последний столбец DAY. Отсортируйте результаты по датам
SELECT
    last_name,
    hire_date,
    to_char(hire_date, 'DAY') AS "Day"
FROM
    employees;

-- Задача 6.	Напишите запрос для вывода фамилии и суммы комиссионных каждого служащего. 
-- Если служащий не зарабатывает комиссионных, укажите в столбце «No Commission». 
-- Назовите столбец COMM.
SELECT
    last_name,
    nvl(to_char(commission_pct), 'No commission') AS "COMM"
FROM
    employees;

-- Задача7.	Используя функцию DECODE, напишите запрос для отображения должности 
-- сотрудника и её разряда (grade). Разряд каждого типа должности JOB_ID приведён в таблице.
SELECT
    job_id,
    decode(job_id, 'AD_PRES', 'A', 'ST_MAN', 'B',
           'IT_PROG', 'C', 'SA_REP', 'D', 'ST_CLERK',
           'E', '0') AS "Grade"
FROM
    employees;

-- Задача 8. Перепешите команду из предыдущего задания, используя синтаксис выражения CASE.
SELECT
    job_id,
    CASE job_id
        WHEN 'AD_PRES'  THEN
            'A'
        WHEN 'ST_MAN'   THEN
            'B'
        WHEN 'IT_PROG'  THEN
            'C'
        WHEN 'SA_REP'   THEN
            'D'
        WHEN 'ST_CLERK' THEN
            'E'
        ELSE
            '0'
    END AS "Grade"
FROM
    employees;
