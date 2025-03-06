# HR Database SQL Project 🚀

This repository contains solutions to 20 SQL queries based on the **HR database**.  
The project covers fundamental SQL queries, functions, and joins.

---

## 📌 **Project Overview**
This project is designed to test and improve SQL query skills using the **HR database**.  
The solutions include:
- Basic SQL queries
- Aggregation functions
- Joins & relationships
- Normalization & optimization

---

## 📊 **SQL Queries & Setup**
-- 1. Retrieve all details of employees
-SELECT * FROM employees;

-- 2. Display first name, last name, and email of all employees
-SELECT first_name, last_name, email FROM employees;

-- 3. Retrieve the distinct job titles from the jobs table
-SELECT DISTINCT job_title FROM jobs;

-- 4. Find the total number of employees
-SELECT COUNT(*) AS total_employees FROM employees;

-- 5. Retrieve employees hired after January 1, 2015
-SELECT * FROM employees WHERE hire_date > '2015-01-01';

-- 6. Employees with salary greater than 5000
-SELECT * FROM employees WHERE salary > 5000;

-- 7. Employees with job titles containing ‘Manager’
-SELECT * FROM employees WHERE job_title LIKE '%Manager%';

-- 8. Employees whose first name starts with ‘A’ and ends with ‘n’
-SELECT * FROM employees WHERE first_name LIKE 'A%n';

-- 9. Employees without a commission
-SELECT * FROM employees WHERE commission_pct IS NULL;

-- 10. Retrieve the top 5 highest-paid employees
-SELECT * FROM employees ORDER BY salary DESC LIMIT 5;

-- 11. Find the average salary of all employees
-SELECT AVG(salary) AS average_salary FROM employees;

-- 12. Total employees in each department
-SELECT department_id, COUNT(*) AS total_employees FROM employees GROUP BY department_id;

-- 13. Employee's first name and its length
-SELECT first_name, LENGTH(first_name) AS name_length FROM employees;

-- 14. Convert hire_date to display only the year
-SELECT first_name, last_name, YEAR(hire_date) AS hire_year FROM employees;

-- 15. Minimum and maximum salary for each job title
-SELECT job_title, MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM employees GROUP BY job_title;

-- 16. Employees and their department names
-SELECT e.first_name, e.last_name, d.department_name 
-FROM employees e
-JOIN departments d ON e.department_id = d.department_id;

-- 17. Employees, job titles, and department locations
-SELECT e.first_name, e.last_name, j.job_title, l.city 
-FROM employees e
-JOIN jobs j ON e.job_id = j.job_id
-JOIN departments d ON e.department_id = d.department_id
-JOIN locations l ON d.location_id = l.location_id;

-- 18. Department names with employee count
-SELECT d.department_name, COUNT(e.employee_id) AS employee_count 
-FROM departments d
-LEFT JOIN employees e ON d.department_id = e.department_id
-GROUP BY d.department_name;

-- 19. Employees with the same job as their manager
-SELECT e.first_name, e.last_name 
-FROM employees e
-JOIN employees m ON e.manager_id = m.employee_id
-WHERE e.job_id = m.job_id;

-- 20. Employees who worked in different jobs in the past
-SELECT e.first_name, e.last_name 
-FROM employees e
-JOIN job_history jh ON e.employee_id = jh.employee_id
-GROUP BY e.first_name, e.last_name
-HAVING COUNT(DISTINCT jh.job_id) > 1;

-- GitHub Repository Setup
-- 1. Create a GitHub repository: 2.-HR-database-case-study-Using-SQL-
-- 2. Upload SQL code manually or push from local:

-- Clone the repository
git clone https://github.com/Sum-it07/2.-HR-database-case-study-Using-SQL-.git

-- Navigate to the project directory
cd hr-database-sql-project

-- Add the SQL file
git add hr_database_queries.sql

-- Commit the changes
git commit -m "Added HR database SQL solutions"

-- Push to GitHub
git push origin main

-- How to Use
-- Clone this repository
git clone https://github.com/Sum-it07/2.-HR-database-case-study-Using-SQL-.git

-- Import the HR database into MySQL and run queries
