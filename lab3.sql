-- ������������ 3
-- ������ 1.	�������� ������ ��� ������ ������� ����. �������� ������� Date.
SELECT SYSDATE as "Date"
FROM dual;

-- ������ 2. �������� ����� ���������, ��� �������, ����� � ����� �����, ���������� �� 15% � ���������� �� ������. 
-- �������� ������� New Salary. ��������� ������� SQL � ��������� ����� lab3_2sql.

-- ������ 3.	��������� ������ �� ����� lab3_2sql.
SELECT employee_id, last_name, salary as "Current Salary", Round((salary*1.15), 0) as "New Salary + 15%"
FROM employees;

-- ������ 4.	�������� lab3_2.sql. �������� ��� ���� �������, ������� ����� ��������� ��������� 
-- ��������� ������� ������ �� ������. �������� ������� Increase. ��������� ��������� ������ � lab3_4.sql. 
-- ��������� ������ ��� ���.
SELECT employee_id, last_name, salary as "Current Salary", Round((salary*1.15), 0) as "New Salary + 15%", (ROUND(salary*1.15,0)-salary) as "Increase"
FROM employees;

-- ������ 5.	�������� ������� �������� (������ ����� ������ ������� ������ ���� ���������, 
-- � ��������� - ���������) � ����� ������ ������� ��� ��� ��������, ������� ������� ���������� � 
-- ������� J, A ��� �. ��������� ��������������� ��������� ��������.
SELECT last_name as "Name", LENGTH (last_name) as "Length"
FROM employees
WHERE last_name like 'A%' OR last_name like 'J%' OR last_name like 'M%';