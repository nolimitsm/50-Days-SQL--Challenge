USE 50_days_sql_challenge;

-- emp / salaries / performance

-- employees table

WITH CTE AS (
    
SELECT * , row_number() over (PARTITION BY emp_id, emp_name, city

ORDER BY emp_id) as rn

FROM cleaned_employees)

DELETE FROM cleaned_employees
WHERE emp_id in
(SELECT emp_id FROM cte WHERE rn>1);

-- salaries table

WITH CTE as ( SELECT * , row_number() over (

    PARTITION BY salary_id, emp_id
    ORDER BY salary_id ) as rn
    from cleaned_salaries )

delete from cleaned_salaries
WHERE salary_id in (
    SELECT salary_id FROM cte WHERE rn>1

);


-- performance table

WITH CTE as ( SELECT *, row_number() over(

    PARTITION BY emp_id, rating_2022, rating_2023, rating_2024
    ORDER BY emp_id ) as rn
    FROM cleaned_performance )

DELETE FROM cleaned_performance
WHERE emp_id in (
    SELECT emp_id FROM CTE WHERE rn>1
);

-- check for text inconsistency

SELECT DISTINCT city
FROM cleaned_employees;

SELECT DISTINCT dept_name
FROM cleaned_departments;

SELECT DISTINCT emp_id
FROM cleaned_performance;

UPDATE cleaned_employees
SET CITY = CONCAT(UPPER(LEFT(TRIM(CITY),1)),  
Lower(substring(trim(city),2)));

UPDATE cleaned_employees
SET city = case 

WHEN city IN('Dlhi', 'Dlehi ncr', 'New delhi') THEN 'DELHI'
WHEN city IN ('Hydbd') then 'Hydrabad'
WHEN city IN('Bangalore') THEN 'Bengaluru'

else city
end;