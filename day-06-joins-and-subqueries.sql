-------------------------------------------------------------------------------------------------------------------------------------------------
-- Find employees whose salary is greater than the company's average salary.
-------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    e.emp_no, CONCAT(e.first_name, ' ', e.last_name) as Employees, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > (SELECT 
            AVG(salary)
        FROM
            salaries);
-------------------------------------------------------------------------------------------------------------------------------------------------            
-- Find employees who earn the highest salary in their department.
-------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    e.emp_no,
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
            MAX(s2.salary)
        FROM
            salaries s2
                JOIN
            dept_emp de2 ON s2.emp_no = de2.emp_no
        WHERE
            de2.emp_no = de.emp_no);
-------------------------------------------------------------------------------------------------------------------------------------------------            
-- Find employees who have never been assigned to any department.
-------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    emp_no
FROM
    employees
WHERE
    emp_no NOT IN (
        SELECT emp_no
        FROM dept_emp
    );
-------------------------------------------------------------------------------------------------------------------------------------------------    
-- Find employees who have held more than one job title.
-------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    e.emp_no, COUNT(t.title) as Tot_title
FROM
    employees e
        LEFT JOIN
    titles t ON e.emp_no = t.emp_no
GROUP BY e.emp_no
HAVING COUNT(t.title) > 1;
-------------------------------------------------------------------------------------------------------------------------------------------------
-- Find the department with the highest average salary.
-------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    d.dept_no, AVG(s.salary) as Average_salary
FROM
    dept_emp d
        LEFT JOIN
    salaries s ON d.emp_no = s.emp_no
GROUP BY d.dept_no
ORDER BY AVG(s.salary) DESC
LIMIT 1;


