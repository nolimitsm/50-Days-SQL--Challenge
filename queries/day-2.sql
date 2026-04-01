-- Departments Table

SELECT * FROM cleaned_departments
WHERE dept_name is null or dept_name =''

or dept_id is null or dept_id ='';

-- Employees Table

SELECT * FROM cleaned_employees
WHERE emp_name ='' or emp_name is NULL

OR city ='' or city is NULL

OR
age = '' or age is NULL
OR dept_id ='' or dept_id is NULL;

-- Performance Table

SELECT * FROM cleaned_performance
WHERE emp_id ='' or emp_id is NULL;

-- Salaries Table

SELECT * FROM cleaned_salaries
WHERE salary_id='' or salary_id is NULL

OR
emp_id ='' or emp_id is NULL

OR
salary ='' or salary is NULL

OR
salary_date ='' or salary_date is NULL;

USE 50_days_sql_challenge;

-- Attedance Table

SELECT  * FROM cleaned_attendance
WHERE attendance_id ='' or attendance_id is NULL

OR
emp_id ='' or emp_id is NULL

OR
attendance_date ='' or attendance_date is NULL;

