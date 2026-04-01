USE 50_days_sql_challenge;

UPDATE cleaned_employees
SET emp_name ='Unknown'
WHERE emp_name is null or emp_name ='';

-- emp_id 13 ~Delhi

UPDATE cleaned_employees
SET city ='Delhi'
WHERE emp_id = 13;

UPDATE cleaned_employees
SET city ='Delhi NCR'
WHERE city is NULL or city ='';

-- RATING_2203-0

UPDATE cleaned_performance
SET rating_2023 = 0
WHERE rating_2023 = '';

-- Find Duplocate Value..

-- Employees

SELECT emp_id, emp_name, city, count(*)
FROM cleaned_employees
GROUP BY emp_id, emp_name, city

having count(*)>1;

-- Performance

SELECT emp_id, count(*)
FROM cleaned_performance
GROUP BY emp_id

having count(*)>1;

-- Salary

SELECT salary_id, emp_id, salary, salary_date, count(*)
FROM cleaned_salaries
GROUP BY salary_id, emp_id, salary, salary_date

having count(*)>1;

-- Attendance

SELECT emp_id, attendance_date, status, count(*)
FROM cleaned_attendance
GROUP BY emp_id, attendance_date, status

having count(*)>1;

-- Departments 

SELECT dept_id, dept_name, count(*)
FROM cleaned_departments
GROUP BY dept_id, dept_name

having count(*)>1;