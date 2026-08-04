SELECT DATABASE();
SHOW TABLES;

DESC employee;
DESC department;

/* Create a view to display employees whose salary is greater than 3000 */
CREATE VIEW HighSalaryEmployees AS
SELECT emp_id, emp_name, salary, dept_id
FROM employee
WHERE salary > 3000;

SELECT * FROM HighSalaryEmployees;

/* 2. Create a view that displays employee details along with their department name */

CREATE VIEW EmployeeDepartment AS
SELECT
e.emp_id,
e.emp_name,
e.age,
e.salary,
e.experience,
d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id;

SELECT * FROM EmployeeDepartment;

/* 3. Create a view to display the total salary of each department */
CREATE VIEW DepartmentSalary AS
SELECT
dept_id,
SUM(salary) AS total_salary
FROM employee
GROUP BY dept_id;

SELECT * FROM DepartmentSalary;

/*CTE (Common Table Expressions)
1. Display employees whose salary is greater than the company's average salary*/
WITH AvgSalary AS
(
SELECT AVG(salary) AS avg_salary
FROM employee
)
SELECT emp_id, emp_name, salary
FROM employee
WHERE salary > (SELECT avg_salary FROM AvgSalary);

/*2. Calculate the average salary of each department*/
WITH DeptAverage AS
(
SELECT
dept_id,
AVG(salary) AS avg_salary
FROM employee
GROUP BY dept_id
)
SELECT * FROM DeptAverage;

/*3. Display the highest-paid employee(s) in each department*/
WITH MaxSalary AS
(
SELECT
dept_id,
MAX(salary) AS max_salary
FROM employee
GROUP BY dept_id
)
SELECT
e.emp_id,
e.emp_name,
e.salary,
e.dept_id
FROM employee e
JOIN MaxSalary m
ON e.dept_id = m.dept_id
AND e.salary = m.max_salary;

/*Set Operators
1. Display all unique department numbers from the employee and department tables using UNION*/
SELECT dept_id
FROM employee

UNION

SELECT dept_id
FROM department;

/*2. Display all department numbers from the employee and department tables, including duplicates, using UNION ALL*/
SELECT dept_id
FROM employee

UNION ALL

SELECT dept_id
FROM department;

/*3. Display department numbers that exist in the employee table but not in the department table

Using NOT EXISTS*/
SELECT DISTINCT e.dept_id
FROM employee e
WHERE NOT EXISTS
(
SELECT 1
FROM department d
WHERE e.dept_id = d.dept_id
);

SELECT DISTINCT e.dept_id
FROM employee e
LEFT JOIN department d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;