
------------------------------------------------------------------------------------------------------------------------------------------------
-- Find employees with same first_name.
------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    e1.emp_no, 
    e1.first_name, 
    e2.emp_no, 
    e2.first_name
FROM
    employees e1
        JOIN
    employees e2 
ON e1.first_name = e2.first_name
AND e1.emp_no = e2.emp_no;
------------------------------------------------------------------------------------------------------------------------------------------------
-- Find employees with same last_name.
------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    e1.emp_no, 
    e1.last_name,
    e2.emp_no, 
    e2.last_name
FROM
    employees e1
        JOIN
    employees e2 
    ON e1.last_name = e2.last_name
	AND e1.emp_no = e2.emp_no;
------------------------------------------------------------------------------------------------------------------------------------------------    
-- Find employees hired in same year.
------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    e1.emp_no, 
    e1.hire_date, 
    e2.emp_no, 
    e2.hire_date
FROM
    employees e1
        JOIN
    employees e2 
    ON year(e1.hire_date) = year(e2.hire_date)
	AND e1.emp_no < e2.emp_no;
------------------------------------------------------------------------------------------------------------------------------------------------    
-- Find employees having same title.
------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    t1.emp_no, 
    t1.title,
    t2.emp_no,
    t2.title
FROM
    titles t1
        JOIN
    titles t2 ON t1.title = t2.title
	AND t1.emp_no < t2.emp_no;
------------------------------------------------------------------------------------------------------------------------------------------------    
-- Find duplicate employee names.
------------------------------------------------------------------------------------------------------------------------------------------------
SELECT
    e1.emp_no,
    e1.first_name,
    e1.last_name,
    e2.emp_no,
    e2.first_name,
    e2.last_name
FROM employees e1
JOIN employees e2
ON e1.first_name = e2.first_name
AND e1.last_name = e2.last_name
AND e1.emp_no < e2.emp_no;
------------------------------------------------------------------------------------------------------------------------------------------------
-- Find employees having same first_name and last_name.
------------------------------------------------------------------------------------------------------------------------------------------------
 SELECT 
    e1.emp_no,
    e1.first_name,
    e1.last_name,
    e2.emp_no,
    e2.first_name,
    e2.last_name
FROM
    employees e1
        JOIN
    employees e2 ON e1.first_name = e2.first_name
        AND e1.last_name = e2.last_name
        AND e1.emp_no < e2.emp_no;
 ------------------------------------------------------------------------------------------------------------------------------------------------       
 -- Find pairs of employees working in the same department.       
 ------------------------------------------------------------------------------------------------------------------------------------------------
 SELECT 
    d1.emp_no, 
    d1.dept_no, 
    d2.emp_no,
    d2.dept_no
FROM
    dept_emp d1
        JOIN
    dept_emp d2 ON d1.dept_no = d2.dept_no
        AND d1.emp_no < d2.emp_no;
        

















