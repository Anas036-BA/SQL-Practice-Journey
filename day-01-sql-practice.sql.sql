-- SQL Practice Day 01
-- Topics: WHERE, LIKE, BETWEEN, GROUP BY, INSERT, UPDATE
------------------------------------------------------------------------------------------
-- Insert all employees hired after 2015 into new_employees table.
------------------------------------------------------------------------------------------
select * from employees where hire_date > '2015-01-01';

Create table new_employees
(emp_no int,
 birth_date varchar(100),
 first_name varchar(100),
 last_name varchar(100),
 gender char(10),
 hire_date date);
 
 insert into new_employees(emp_no,birth_date,first_name,last_name,gender,hire_date) values
 (10002,'1964-06-02','Bezalel',	'Simmel',	'F','2020-01-01'),
(10006,	'1953-04-20','Arjun','Preusig',	'F','2020-01-01');


------------------------------------------------------------------------------------------
-- Insert top 5 highest salaries into salary_backup table.
------------------------------------------------------------------------------------------
SELECT 
    emp_no, MAX(salary) AS Maximum_Salary
FROM
    salaries
GROUP BY emp_no
LIMIT 5;

CREATE TABLE salary_backup (
    emp_no INT,
    maximum_Salary INT
);

insert into salary_backup value(10001,	88958),
(10002	,72527),
(10003	,43699),
(10004	,74057),
(10005	,94692);
---------------------------------------------------------------------------------------
-- Update the first_name of employee 10001 to 'Anas'.
---------------------------------------------------------------------------------------
UPDATE employees 
SET 
    first_name = 'Anas'
WHERE
    emp_no = 10001;
--------------------------------------------------------------------------------------    
-- Update gender of employee 10005 to 'M'.   
 -------------------------------------------------------------------------------------
 UPDATE employees 
SET 
    gender = 'M'
WHERE
    emp_no = '10002';
    
----------------------------------------------------------------------------------------
-- HR wants details of employees hired after 2015.
----------------------------------------------------------------------------------------
SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2015-12-31';
    
--------------------------------------------------------------------------------------
-- Find female employees whose first name starts with ‘A’.
  --------------------------------------------------------------------------------------  
    SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' AND first_name LIKE 'A%';
    
    
---------------------------------------------------------------------------------------    
-- Find departments having more than 100 employees.
--------------------------------------------------------------------------------------
SELECT 
    COUNT(emp_no) AS Total_Employees, dept_no AS Departments
FROM
    dept_emp
GROUP BY dept_no
HAVING COUNT(emp_no) > 100;

--------------------------------------------------------------------------------------
-- Find top 3 departments with highest employee count.
--------------------------------------------------------------------------------------
SELECT 
    *
FROM
    titles;
SELECT 
    dept_no, COUNT(emp_no) AS Total_Employees
FROM
    dept_emp
GROUP BY dept_no
ORDER BY Total_employees DESC
LIMIT 3;

-----------------------------------------------------------------------------------------
-- Retrieve employees hired between 2000 and 2010.    
------------------------------------------------------------------------------------------
 SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN 2000 - 01 - 01 AND 2010 - 12 - 31;
    
-----------------------------------------------------------------------------------------   
-- Find employees whose last name ends with ‘son’.
-----------------------------------------------------------------------------------------
   SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%son';

 