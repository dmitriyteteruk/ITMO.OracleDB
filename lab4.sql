-- ������������ ������ 4
-- ������ 1.	��� ������� ��������� �������� ������� � ��������� ���������� ������� 
-- �� ��� ����� �� ���������� �������, ���������� �� ���������� ������. �������� ������� MONTH_WORKED. 
-- ���������� ������������ �� ���������� ������������ �������. ��������� ����� �� ���������� ������
SELECT last_name, ROUND((sysdate-hire_date)/365 , 0) AS "Month_Worked"
FROM employees;

-- ������ 2.	�������� �� ������� ��������� ����� � ��������� ����:
-- <�������> ������������ <�����> � �����, �� ������ <��������� �����>. �������� ������� Dream Salaries
SELECT (last_name || ' earns $' || salary || ' monthly but wants $' || salary*3) AS "Dream Salaries"
FROM employees;

-- ������ 3.	�������� ������ ��� ������ ������� � ������� ���� ��������. 
-- �������� �������� ������� SALARY. ����� ������� SALARY � 15 �������� � ����������� �������� $.
SELECT last_name, LPAD(salary, 15, '$') as "Salary"
FROM employees;

-- ������ 4.	��� ������� ��������� �������� �������, ���� ����� � ���� ���������� ��������, 
-- ������� ���������� �� ������ ����������� ����� 6 ������� ������. �������� ������� REVIEW. 
-- ������ ���� ��� ������ ����� ���: �Monday, the Thirty-First of MM, YYYY�.
SELECT last_name, hire_date,'Monday, '|| 
to_char(NEXT_DAY(ADD_MONTHS(hire_date, 6),'�����������'),'"the" fmDdspth "of" Month, YYYY') "Review"
from employees;

-- ������ 5. �� ������� ��������� �������� �������, ����  ����� � ���� ������, 
-- ����� �� ��� ����� �� ������. �������� ��������� ������� DAY. ������������ ���������� �� �����
SELECT last_name, hire_date, 
to_char(hire_date, 'DAY') as "Day"
FROM employees;

-- ������ 6.	�������� ������ ��� ������ ������� � ����� ������������ ������� ���������. 
-- ���� �������� �� ������������ ������������, ������� � ������� �No Commission�. 
-- �������� ������� COMM.
SELECT last_name, nvl (to_char(commission_pct), 'No commission') as "COMM"
FROM employees;

-- ������7.	��������� ������� DECODE, �������� ������ ��� ����������� ��������� 
-- ���������� � � ������� (grade). ������ ������� ���� ��������� JOB_ID ������� � �������.
SELECT job_id,
DECODE(job_id, 
'AD_PRES', 'A',
'ST_MAN', 'B',
'IT_PROG',	'C',
'SA_REP',	'D',
'ST_CLERK',	'E',
'0') as "Grade"
FROM employees;

-- ������ 8. ���������� ������� �� ����������� �������, ��������� ��������� ��������� CASE.
SELECT job_id,
CASE job_id WHEN 'AD_PRES' THEN 'A'
            WHEN 'ST_MAN' THEN 'B'
            WHEN 'IT_PROG' THEN	'C'
            WHEN 'SA_REP' THEN	'D'
            WHEN 'ST_CLERK' THEN 'E'
            ELSE '0' END AS "Grade"
FROM employees;
