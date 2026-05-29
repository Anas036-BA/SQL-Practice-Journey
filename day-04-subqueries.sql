-- SQL Practice Day 04
-------------------------------------------------------------------------------------------------------------------------------------------------
-- Find employees earning above average salary.
-------------------------------------------------------------------------------------------------------------------------------------------------
 SELECT 
    concat(e.first_name,' ', e.last_name) as Employees, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > (SELECT 
            AVG(salary) AS Average_salary
        FROM
            salaries)
-------------------------------------------------------------------------------------------------------------------------------------------------            
-- Find employees earning below average salary.     
-------------------------------------------------------------------------------------------------------------------------------------------------
SELECT concat(e.first_name,' ', e.last_name) as Employees, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary < (SELECT 
            AVG(salary) AS Average_salary
        FROM
            salaries);
 --------------------------------------------------------------------------------------------------------------------------------------------------- Find employees with maximum salary.  
-------------------------------------------------------------------------------------------------------------------------------------------------
 SELECT 
    e.emp_no, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary = (SELECT 
            MAX(salary)
        FROM
            salaries);
------------------------------------------------------------------------------------------------------------------------------------------------ -- Find employees with minimum salary.
-------------------------------------------------------------------------------------------------------------------------------------------------           
  SELECT 
    e.emp_no, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary = (SELECT 
            MIN(salary)
        FROM
            salaries);
------------------------------------------------------------------------------------------------------------------------------------------------------           
 -- Find departments with employee count above average.
 ------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    dept_no, COUNT(emp_no) AS Employee_count
FROM
    dept_emp
GROUP BY dept_no
HAVING COUNT(emp_no) > (SELECT 
        AVG(Total_emp)
    FROM
        (SELECT 
            dept_no, COUNT(emp_no) AS Total_emp
        FROM
            dept_emp
        GROUP BY dept_no) AS dept_count);
------------------------------------------------------------------------------------------------------------------------------------------------------        
-- Find employees who do not have salary records.
------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT IN (SELECT 
            emp_no
        FROM
            salaries);
------------------------------------------------------------------------------------------------------------------------------------------------------            
-- Find employees who do not have department records.
------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    e.emp_no
FROM
    employees e
        LEFT JOIN
    dept_emp de ON e.emp_no = de.emp_no
WHERE
    de.emp_no IS NULL;
------------------------------------------------------------------------------------------------------------------------------------------------------    
-- Find employees working in multiple departments
------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    emp_no, COUNT(dept_no)
FROM
    dept_emp
GROUP BY emp_no
HAVING COUNT(dept_no) > 1;
------------------------------------------------------------------------------------------------------------------------------------------------------
-- Find second highest salary.
------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT
    (salary)
FROM
    salaries
ORDER BY salary DESC
LIMIT 1 offset 1;

        
