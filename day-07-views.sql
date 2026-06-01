------------------------------------------------------------------------------------------------------------------------------------------------
-- Create a view showing employee names and salaries.
------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW employee_name_salary_view AS
    SELECT 
        CONCAT(e.first_name, ' ', e.last_name) AS Employees,
        s.salary
    FROM
        employees e
            LEFT JOIN
        salaries s ON e.emp_no = s.emp_no;
        
	SELECT 
    *
FROM
    employee_name_salary_view;
------------------------------------------------------------------------------------------------------------------------------------------------    
-- Create a view showing employee names and department numbers.
------------------------------------------------------------------------------------------------------------------------------------------------
  CREATE VIEW employee_name_dept_view AS
    SELECT 
        CONCAT(e.first_name, ' ', e.last_name) AS Employees,
        d.dept_no
    FROM
        employees e
            LEFT JOIN
        dept_emp d ON e.emp_no = d.emp_no;

       
	SELECT 
    *
FROM
    employee_name_dept_view;
------------------------------------------------------------------------------------------------------------------------------------------------    
-- Create a view showing department employee count.
------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW Tot_emp_in_dept AS
    SELECT 
        dept_no, COUNT(emp_no) AS Total_Employees
    FROM
        dept_emp
    GROUP BY dept_no;

SELECT 
    *
FROM
    Tot_emp_in_dept;
------------------------------------------------------------------------------------------------------------------------------------------------
-- Create a view showing current employees only.
------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW current_employees_view AS
SELECT 
    e.emp_no,
    CONCAT(e.first_name, ' ', e.last_name) AS Employees,
    de.dept_no
FROM
    employees e
JOIN
    dept_emp de
ON
    e.emp_no = de.emp_no
WHERE
    de.to_date = '9999-01-01';

SELECT 
    *
FROM
    current_employees_view;
------------------------------------------------------------------------------------------------------------------------------------------------
-- Create a view showing highest-paid employee in each department.
------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW high_paid_emp AS
    SELECT 
        s.emp_no, d.dept_no, MAX(s.salary) AS High_Paid
    FROM
        salaries s
            LEFT JOIN
        dept_emp d ON s.emp_no = d.emp_no
    GROUP BY d.dept_no , s.emp_no;

SELECT 
    *
FROM
    high_paid_emp;
------------------------------------------------------------------------------------------------------------------------------------------------    
-- Create a view showing employees with more than one title.
------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW employees_with_more_titles AS
    SELECT 
        e.emp_no,
        CONCAT(e.first_name, ' ', e.last_name) AS Employees,
        COUNT(t.title) AS Total_titles
    FROM
        employees e
            LEFT JOIN
        titles t ON e.emp_no = t.emp_no
    GROUP BY e.emp_no
    HAVING COUNT(t.title) > 1;
    
    SELECT 
    *
FROM
    employees_with_more_titles;




