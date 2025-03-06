/* SQL Project
 Solve below questions using “hr” database.
 Students need to submit sql file of solution
 Students also need to upload this project with solution on Git Hub
Fundamentals of Structured Query Language - 1
1. Retrieve all details of employees.
2. Display the first name, last name, and email of all employees.
3. Retrieve the distinct job titles from the jobs table.
4. Find the total number of employees in the company.
5. Retrieve the employees who were hired after January 1, 2015.
Fundamentals of Structured Query Language - 2
6. List all employees who have a salary greater than 5000.
7. Retrieve employees with job titles containing the word ‘Manager.’
8. Retrieve all employees whose first name starts with ‘A’ and ends with ‘n.’
9. Display the employees who do not have a commission.
10. Retrieve the top 5 highest-paid employees.
SQL Functions
11. Find the average salary of all employees.
12. Retrieve the total number of employees working in each department.
13. Display the employee's first name and the length of their first name.
14. Convert the hire_date of employees to display only the year.
15. Retrieve the minimum and maximum salary for each job title. 
SQL Tables, Joins
16. Retrieve the employee names along with their department names.
17. List the employees along with their job titles and the location of their department.
18. Retrieve the department names along with the count of employees in each department.
19. Find employees who have the same job as their manager.
20. Display the names of employees who worked in different jobs in the past (use
job_history). 
*/


-- 1. Retrieve all details of employees.
use hr;
select * from employees;

-- 2. Display the first name, last name, and email of all employees.
select first_name,last_name,email from employees;

-- 3. Retrieve the distinct job titles from the jobs table.
select distinct(job_id) from employees;

-- 4. Find the total number of employees in the company.
select count(*) from employees;

-- 5. Retrieve the employees who were hired after January 1, 2015.
select * from employees where hire_date>'2015-01-01';


-- 6. List all employees who have a salary greater than 5000.
select * from employees where salary>5000;

-- 7. Retrieve employees with job titles containing the word ‘Manager.’
select * from jobs where job_title like '%Manager%';

-- 8. Retrieve all employees whose first name starts with ‘A’ and ends with ‘n.’
select * from employees where first_name like 'A%';

-- 9. Display the employees who do not have a commission.
select * from employees where commission_pct is null;

-- 10. Retrieve the top 5 highest-paid employees.;
select * from employees order by salary desc limit 5;

-- 11. Find the average salary of all employees.
select avg(salary) from employees;

-- 12. Retrieve the total number of employees working in each department.
select department_id,count(*) from employees group by department_id;

-- 13. Display the employees first name and the length of their first name.
select first_name,length(first_name) from employees;

-- 14. Convert the hire_date of employees to display only the year.
select first_name,last_name,year(hire_date) as Hire_year from employees; 

-- 15. Retrieve the minimum and maximum salary for each job title. ;
select min(salary),max(salary),job_id from employees group by job_id;


-- 16. Retrieve the employee names along with their department names.
select first_name,last_name,department_name from employees join departments where employees.department_id=departments.department_id;

-- 17. List the employees along with their job titles and the location of their department.
select first_name,last_name,job_title,street_address,city from employees 
join jobs on employees.job_id=jobs.job_id 
join departments on departments.department_id=employees.department_id 
join locations on locations.location_id=departments.location_id;

-- 18. Retrieve the department names along with the count of employees in each department.
select department_name,count(employee_id) as No_of_Employee from employees join departments on employees.department_id=departments.department_id group by department_name ;

-- 19. Find employees who have the same job as their manager.
select e.first_name,e.last_name from employees e join employees m on m.employee_id=e.manager_id where e.job_id=m.job_id;
select * from job_history;

-- 20. Display the names of employees who worked in different jobs in the past (use job_history). ;
SELECT e.first_name, e.last_name FROM employees e
JOIN job_history jh ON e.employee_id = jh.employee_id
GROUP BY e.first_name, e.last_name
HAVING COUNT(DISTINCT jh.job_id) > 1;

