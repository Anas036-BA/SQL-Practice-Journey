-- SQL Practice Day 02
---------------------------------------------------------------------------------------------------------------------------
-- Find employees earning above average salary.
---------------------------------------------------------------------------------------------------------------------------
SELECT 
    e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > (SELECT 
            AVG(salary)
        FROM
            salaries);

---------------------------------------------------------------------------------------------------------------------------
-- Display employee names with their salaries.
---------------------------------------------------------------------------------------------------------------------------
SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        LEFT JOIN
    salaries s ON e.emp_no = s.emp_no;
---------------------------------------------------------------------------------------------------------------------------    
-- Show employees with their department numbers.
---------------------------------------------------------------------------------------------------------------------------
SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no
FROM
    employees e
        LEFT JOIN
    dept_emp d ON e.emp_no = d.emp_no;
---------------------------------------------------------------------------------------------------------------------------    
-- Display employee names with their job titles.
---------------------------------------------------------------------------------------------------------------------------
SELECT 
    e.emp_no, e.first_name, e.last_name, t.title
FROM
    employees e
        LEFT JOIN
    titles t ON e.emp_no = t.emp_no;
---------------------------------------------------------------------------------------------------------------------------    
-- Find employees working in department d001.
---------------------------------------------------------------------------------------------------------------------------
SELECT 
    e.emp_no, e.first_name, e.last_name, de.dept_no
FROM
    employees e
        RIGHT JOIN
    dept_emp de ON e.emp_no = de.emp_no
WHERE
    de.dept_no = 'd001';

---------------------------------------------------------------------------------------------------------------------------
-- Display employee name, department number, and salary.
---------------------------------------------------------------------------------------------------------------------------
SELECT 
    de.dept_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
        JOIN
    dept_emp de ON e.emp_no = de.emp_no;
 ---------------------------------------------------------------------------------------------------------------------------   
-- Display employees whose current title is 'Manager'.
---------------------------------------------------------------------------------------------------------------------------
SELECT 
    e.first_name, e.last_name, t.title
FROM
    employees e
        RIGHT JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager';
