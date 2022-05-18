--������������ 2.
-- ������ 1.	�������� ������ ��� ������ ����� � ���������� ����� ��������, 
-- �������������� ����� $12000. ��������� ������� SQL � ����� lab2_1.sql. ��������� ������
SELECT last_name, salary
FROM employees
WHERE salary >12000;

-- ������ 2.	�������� ������ ��� ������ ������� � ������ ������ ��������� ��� ������� 176
SELECT last_name, department_id
FROM employees
WHERE employee_id=176;

-- ������ 3.	�������� ���� lab2_1.sql � �������� ������� � ������ ���� ��������, 
-- ��� ����� �� ������ � �������� �� $5000 �� $12000. ��������� ������� SQL � ����� lab2_3.sql
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 5000 AND 12000;

-- ������ 4. �������� �������, ������������� ��������� � ���� ������ ������ ���� ��������, 
-- ������� � ������ � 20 ������� 1998 �� 1 ��� 1998 �. ������������ ������ � ������� ����������� ���� �����.
SELECT last_name, job_id, hire_date
FROM employees
WHERE hire_date BETWEEN '20.02.98' and '01.05.98'
ORDER BY hire_date;

-- ������ 5.	�������� ������� � ����� ������ ���� �������� �� ������� 20 � 50. 
-- ������������ ������ �� �������� � ���������� �������.
SELECT last_name, department_id
     FROM employees
     WHERE department_id IN (20, 50)
     ORDER BY last_name;

-- ������ 6. �������� ���� lab2_3.sql ��� ������ ������� � ������� �������� ������� 20 � 50, 
-- �������������� �� $5000 �� $12000. �������� ������� Employee � Mounthly Salary, 
-- ��������������. ����� ��������� ������� SQL  � ����� lab2_6.sql. ��������� ������
SELECT last_name as "Employee", salary AS "Monthly Salary"
FROM employees
WHERE salary BETWEEN 5000 AND 12000 AND department_id IN (20, 50)
ORDER BY last_name;

-- ������ 7.	�������� ������� � ���� ����� ���� ��������, ������� � 1994 �.
SELECT last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01-01-94' AND '31-12-94';

-- ������ 8.	�������� ������� � ��������� ���� ��������, �� ������� ���������
SELECT last_name, job_id
FROM employees
WHERE manager_id is null;

-- ������ 9.	�������� �������, � ������������ ���� ��������, �������������� 
-- ������������. ������������ ������ � ������� �������� ������� � ������������.
SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct is not null
ORDER BY salary DESC;

-- ������ 10.	�������� ��� ������� ��������, � ������� ������ ����� � �.
SELECT last_name
FROM employees
WHERE last_name like '__a%';

-- ������ 11. �������� ������� ���� ��������, � ������� ���� ����� �� � ��.
SELECT last_name
FROM employees
WHERE last_name like '%a%' AND last_name like '%e%';

-- ������ 12.	��������� �������, ��������� � ������ ���� ��������, ���������� ��������� ��������������� (SA_REP)
-- ��� �������� �� ������ (ST_CLERK) � � �������, �� ������  $2500, $3500 � $7000.
SELECT last_name, job_id, salary
FROM employees
WHERE job_id in ('SA_REP', 'ST_CLERK') AND salary not in (2500, 3500, 700);

-- ������ 13.	�������� lab2_6.sql ���, ����� �������� ������� ������ � ������������ ���� ��������, 
-- � ������� ����� ������������ ��������� 20%. ��������� ������ ��� ���. ��������� ������ � ����� lab2_13.sql.
SELECT last_name as "Employee", salary AS "Monthly Salary", commission_pct
FROM employees
WHERE commission_pct >= 0.2
ORDER BY last_name;