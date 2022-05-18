-- ������������ ������ 5
-- ������ 1. �������� ������ ��� ������ �������, 
-- ������ ������ � �������� ������ ��� ���� ��������.
select last_name, department_id, department_name 
from employees JOIN departments
using (department_id);

-- ������ 2. �������� ������ ���� ���������� � ����� 80 
-- (��������� � ������ �� ������ �����������) � �������������� ������.
SELECT DISTINCT job_id, location_id
FROM employees join departments
using (department_id)
WHERE department_id = 80;

-- ������3.	�������� ������ ��� ������ �������, �������� ������, 
-- �������������� �������������� ������ � ������, � ������� �� ���������, 
-- ��� ���� ��������, �������������� ������������.
SELECT e.last_name, d.department_name, l.location_id, l.city
FROM departments d JOIN employees e ON (d.department_id = e.department_id)
JOIN locations l ON (l.location_id = d.location_id)
WHERE e.commission_pct is not null;

-- ������ 4.	�������� ������� ���� ��������, ���������� ����� �� 
-- (� �������� ��������), � ���������� �������. ��������� ���� ������� 
-- SQL � ����� lab4_4.sql.
SELECT e.last_name, d.department_name
FROM employees e JOIN departments d ON (e.department_id = d.department_id);

-- ������ 5. �������� ������ ��� ������ �������, ���������, ������ ������
-- � �������� ������ ���� ��������, ���������� � ������ Toronto.
SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
JOIN locations l ON (l.location_id = d.location_id)
WHERE l.city = 'Toronto';

-- ������ 6. �������� ������� � ������ ���� �������� ������ 
-- � ��������� � �������� �� ����������. �������� ������� 
-- EMPLOYEE, Emp#, Manager � Mgr#. ��������� ���� ������� 
-- SQL � ����� lab4_6.sql.
SELECT 
    worker.last_name as "Employee", 
    worker.employee_id as "EMP#", 
    manager.employee_id  as "Manager",
    manager.last_name as "Mgr#"
FROM employees worker JOIN employees manager
ON (worker.manager_id = manager.employee_id);

-- ������ 7. �������� ���� lab4_6.sql ���, ����� �������� ������� 
-- ���� ��������, ������� �����, ������� �� ����� ���������. 
-- ����������� ��������� �� ����������� ������ ���������. 
-- ��������� ��������� ������ � ��������� ����� lab4_7.sql. ��������� ������.
SELECT 
    worker.last_name as "Employee", 
    worker.employee_id as "EMP#", 
    nvl(manager.last_name, ' ')  as "Manager",
    nvl(to_char(manager.employee_id), ' ') as "Mgr#"
FROM employees worker LEFT JOIN employees manager
ON (worker.manager_id = manager.employee_id)
ORDER BY worker.employee_id;

-- ������ 8. �������� ������ ��� ������ ������ ������, ������� ��������� � ������� 
-- ���� ��������, ���������� � ����� ������ � ������ ��������. ����� �������� ��������������� �����.
SELECT emp.department_id as Department, emp.last_name as "Last Name", col.last_name as "Collegue's Last Name"
FROM employees emp JOIN employees col ON emp.department_id=col.department_id
WHERE emp.employee_id <> col.employee_id
ORDER BY emp.last_name;

-- ������ 9. �������� ��������� ������� JOB_GRADES. �������� ������ ��� ������ �������,
-- ���������, �������� ������, ������ � ��������� (GRADE_LEVEL) ���� ��������
SELECT emp.last_name, emp.job_id, dept.department_name, emp.salary, grades.grade_level as "GRA"
FROM employees emp 
JOIN departments dept
ON (emp.department_id = dept.department_id)
LEFT JOIN job_grades grades 
ON emp.salary BETWEEN grades.lowest_sal and grades.highest_sal;

-- ������ 10. �������� ������ ��� ������ ������� � ��� ����� ���� ��������, 
-- ������� ����� Davies
SELECT last_name, to_char(hire_date,'DD-MON-YY') as "Hire_Date"
FROM employees
WHERE hire_date > (SELECT hire_date 
                   FROM employees
                   WHERE last_name = 'Davies');
                   
-- ������ 11. �� ���� �������� ������� ������ ����� ����������, �������� ������� 
-- � ���� ����� ����� ��������, � ����� ������� � ���� ����� �� ����������. 
-- �������� ������� Employee, Emp, Manager � Manager Hired.
SELECT
    worker.last_name as "Employee", 
    to_char(worker.hire_date, 'DD-MON-YY') as "Emp Hired", 
    manager.last_name as "Manager",
    to_char(manager.hire_date, 'DD-MM-YY') as "Mgr hired"
FROM employees worker JOIN employees manager
ON (worker.manager_id = manager.employee_id)
WHERE worker.hire_date > manager.hire_date;

-- ������ 12. �������� ������, ������������ � �������������� ���� �������,
-- � ����� ���������� ���������� � ��� �����������. ���������� ����� �������
-- � ������� ��� �����������.
SELECT department_id as "Department ID", department_name as "Department Name", location_id as "Location ID", COUNT(employee_id) as "# of Employees"
    FROM departments 
    LEFT JOIN employees
    USING (department_id)
    GROUP BY department_id, department_name, location_id
    ORDER BY department_id;
    
-- ������ 13.	����� ��������� ������� � ������� Administration � Executive,
-- � ����� ������� ����������� �������� ��� ���������? 
-- �������� ������� �������� ����� ����������� ���������.
SELECT job_id, COUNT(employee_id) as "Frequency"
FROM employees LEFT JOIN departments USING (department_id)
WHERE department_name = 'Administration' OR department_name = 'Executive'
GROUP BY job_id
ORDER BY "Frequency" DESC;

-- ������ 14. �������� �����������, ��������� ������� ����� ����� ���� $15000.
-- �������� ��������� ��������: ������� ����������, ������� ���������,
-- ��� ����� � ������� ������ (GRADE_LEVEL).

SELECT
    worker.last_name as "Last_Name", 
    manager.last_name as "Manager",
    manager.salary as "Salary",
    grades.grade_level as "GRA"
FROM employees worker JOIN employees manager
ON worker.manager_id = manager.employee_id
LEFT JOIN job_grades grades 
ON manager.salary BETWEEN grades.lowest_sal and grades.highest_sal
WHERE manager.salary > 15000
ORDER BY manager.salary DESC;
    