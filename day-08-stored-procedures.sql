-------------------------------------------------------------------------------------------------------------------------------------
-- Create a procedure that displays all employees.
-------------------------------------------------------------------------------------------------------------------------------------
delimiter $$
create procedure  show_employees ()
begin
select * from employees ;
end $$
delimiter ;

call show_employees();

-------------------------------------------------------------------------------------------------------------------------------------
-- Create a procedure that displays the first 20 employees.
-------------------------------------------------------------------------------------------------------------------------------------
delimiter $$
create procedure first_20_emp()
begin 
select * from employees 
limit 20;
end $$
delimiter ;

call first_20_emp();

-------------------------------------------------------------------------------------------------------------------------------------
-- Create a procedure that displays all records from the salaries table.
-------------------------------------------------------------------------------------------------------------------------------------
delimiter $$
create procedure salary_records()
begin
select * from salaries; 
end $$
delimiter ;

call salary_records();

-------------------------------------------------------------------------------------------------------------------------------------
-- Create a procedure that accepts emp_no and displays employee details.
-------------------------------------------------------------------------------------------------------------------------------------
delimiter $$
create procedure display_emp(in d_emp_no int)
begin 
select * from employees 
where emp_no = d_emp_no;
end $$
delimiter ;

CALL display_emp(10001);

-------------------------------------------------------------------------------------------------------------------------------------
-- Create a procedure that accepts salary and displays employees earning more than that salary.
-------------------------------------------------------------------------------------------------------------------------------------
delimiter $$ 
create procedure employee_earnings ( in e_salary int)
begin 
select * from salaries 
where salary > e_salary;
end $$
delimiter ;

CALL employee_earnings(80000);

-------------------------------------------------------------------------------------------------------------------------------------
-- Create a procedure that returns the total number of employees.
-------------------------------------------------------------------------------------------------------------------------------------
delimiter $$

create procedure total_numbers(out total_emp int)
begin
select count(*) into total_emp from employees;
end $$
delimiter ;

CALL total_numbers(@emp_count) ;
SELECT @emp_count;

-------------------------------------------------------------------------------------------------------------------------------------
-- Create a procedure that returns the maximum salary.
-------------------------------------------------------------------------------------------------------------------------------------
delimiter $$ 
create procedure max_salarry( out S_salary int)
begin 
select max(salary)into S_salary from salaries ;
end $$
delimiter ;
CALL max_salarry(@max_sal);
SELECT @max_sal;

-------------------------------------------------------------------------------------------------------------------------------------
-- Accept an emp_no and return that employee's salary.
-------------------------------------------------------------------------------------------------------------------------------------
delimiter $$
create procedure emp_return (in e_emp_no int, out return_salary int)
begin 
select salary into return_salary from salaries where emp_no = e_emp_no;
end $$
delimiter ;

CALL emp_return(10006, @salary);
SELECT @salary;
