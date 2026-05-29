-- SQL Practice Day 03
-------------------------------------------------------------------------------------------------------------
-- Find employees who do not have salary records.
-------------------------------------------------------------------------------------------------------------
SELECT 
    e.first_name, e.last_name, s.salary
FROM
    employees e
        LEFT JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary IS NULL;
-------------------------------------------------------------------------------------------------------------    
-- Find average salary department-wise.
-------------------------------------------------------------------------------------------------------------
SELECT 
    d.dept_name, AVG(s.salary) AS Average_Salary
FROM
    salaries s
        JOIN
    dept_emp de ON s.emp_no = de.emp_no
        JOIN
    departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name
;
-------------------------------------------------------------------------------------------------------------
-- Find employees whose salary is highest in their department.
-------------------------------------------------------------------------------------------------------------
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS Employees,
    s.salary,
    d.dept_name
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
        JOIN
    dept_emp de ON s.emp_no = de.emp_no
        JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    s.salary = (
        SELECT MAX(s2.salary)
        FROM salaries s2
        JOIN dept_emp de2
        ON s2.emp_no = de2.emp_no
        WHERE de2.dept_no = de.dept_no
    );
 -------------------------------------------------------------------------------------------------------------   
 -- Find average salary title-wise.   
 -------------------------------------------------------------------------------------------------------------
 SELECT 
    t.title, AVG(s.salary) AS Average_salary
FROM
    titles t
        LEFT JOIN
    salaries s ON t.emp_no = s.emp_no
GROUP BY t.title;
-------------------------------------------------------------------------------------------------------------
-- Find employees whose salary is lowest in their department.
-------------------------------------------------------------------------------------------------------------
 SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS Employees,
    s.salary,
    de.dept_no
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
WHERE
    s.salary = (SELECT 
            MIN(s2.salary) AS Min_salary
        FROM
            salaries s2
                JOIN
            dept_emp de2 ON s2.emp_no = de2.emp_no
            where de2.emp_no = d.emp_no);
-------------------------------------------------------------------------------------------------------------            
-- Find employees whose salary is lowest in their department.
-------------------------------------------------------------------------------------------------------------
 SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS Employees,
    s.salary,
    de.dept_no
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
WHERE
    s.salary = (SELECT 
            MIN(s2.salary) AS Min_salary
        FROM
            salaries s2
                JOIN
            dept_emp de2 ON s2.emp_no = de2.emp_no
        WHERE
            de2.dept_no = de.dept_no)
;
        
