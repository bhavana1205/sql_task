/* SECTION-1 */
-- =====================================================
-- 1. Create the department_new table.
-- =====================================================

CREATE TABLE department_new (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL,
    location VARCHAR(30) DEFAULT 'Hyderabad'
);

-- =====================================================
-- 2. Create the employee_new table with Primary Key
-- and Foreign Key.
-- =====================================================

CREATE TABLE employee_new (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30) NOT NULL,
    salary DECIMAL(10,2),
    hire_date DATE,
    dept_id INT,
    email VARCHAR(50) UNIQUE,
    age INT CHECK(age>=18),
    FOREIGN KEY (dept_id) REFERENCES department_new(dept_id)
);

-- =====================================================
-- 3. Insert records into department_new table.
-- =====================================================

INSERT INTO department_new VALUES
(10,'HR','Hyderabad'),
(20,'IT','Bangalore'),
(30,'Finance','Mumbai'),
(40,'Marketing','Delhi');

-- =====================================================
-- 4. Insert records into employee_new table.
-- =====================================================

INSERT INTO employee_new VALUES
(101,'Ravi',45000,'2022-01-15',20,'ravi@gmail.com',25),
(102,'Priya',55000,'2021-05-10',10,'priya@gmail.com',28),
(103,'Kiran',60000,'2020-08-20',20,'kiran@gmail.com',30),
(104,'Sneha',40000,'2023-02-01',30,'sneha@gmail.com',24),
(105,'Arjun',70000,'2019-11-11',20,'arjun@gmail.com',35),
(106,'Divya',48000,'2022-06-18',40,'divya@gmail.com',27);

-- =====================================================
-- 5. Add a column phone VARCHAR(15) to employee_new.
-- =====================================================

ALTER TABLE employee_new
ADD phone VARCHAR(15);

-- =====================================================
-- 6. Add a column designation VARCHAR(30) to employee_new.
-- =====================================================

ALTER TABLE employee_new
ADD designation VARCHAR(30);

-- =====================================================
-- 7. Modify salary datatype to DECIMAL(12,2).
-- =====================================================

ALTER TABLE employee_new
MODIFY salary DECIMAL(12,2);

-- =====================================================
-- 8. Rename column phone to mobile_no.
-- =====================================================

ALTER TABLE employee_new
RENAME COLUMN phone TO mobile_no;

-- =====================================================
-- 9. Drop column designation.
-- =====================================================

ALTER TABLE employee_new
DROP COLUMN designation;

-- =====================================================
-- 10. Add UNIQUE constraint on mobile_no.
-- =====================================================

ALTER TABLE employee_new
ADD CONSTRAINT uq_mobile_new UNIQUE(mobile_no);

-- =====================================================
-- 11. Insert a new employee.
-- =====================================================

INSERT INTO employee_new
(emp_id,emp_name,salary,hire_date,dept_id,email,age)
VALUES
(107,'Rahul',50000,'2024-01-15',20,'rahul@gmail.com',26);

-- =====================================================
-- 12. Insert 3 employees in a single query.
-- =====================================================

INSERT INTO employee_new
(emp_id,emp_name,salary,hire_date,dept_id,email,age)
VALUES
(108,'Anjali',42000,'2024-02-10',30,'anjali@gmail.com',24),
(109,'Ramesh',39000,'2024-03-15',10,'ramesh@gmail.com',27),
(110,'Meena',52000,'2024-04-01',40,'meena@gmail.com',25);

-- =====================================================
-- 13. Insert an employee using selected columns.
-- =====================================================

INSERT INTO employee_new
(emp_id,emp_name,salary,dept_id)
VALUES
(111,'Sai',45000,20);

-- =====================================================
-- 14. Increase Ravi's salary by 5000.
-- =====================================================

UPDATE employee_new
SET salary = salary + 5000
WHERE emp_name='Ravi';

-- =====================================================
-- 15. Change department of Sneha to Marketing (Dept 40).
-- =====================================================

UPDATE employee_new
SET dept_id=40
WHERE emp_name='Sneha';

-- =====================================================
-- 16. Update email of employee 101.
-- =====================================================

UPDATE employee_new
SET email='ravi_new@gmail.com'
WHERE emp_id=101;

-- =====================================================
-- 17. Delete employee whose id is 106.
-- =====================================================

DELETE FROM employee_new
WHERE emp_id=106;

-- =====================================================
-- 18. Delete all employees from Finance department.
-- =====================================================

DELETE FROM employee_new
WHERE dept_id=30;

-- =====================================================
-- 19. Delete employees whose salary is less than 45000.
-- =====================================================

DELETE FROM employee_new
WHERE salary<45000;

-- =====================================================
-- 20. Display all employee records.
-- =====================================================

SELECT * FROM employee_new;

-- =====================================================
-- 21. Remove all records without deleting table structure.
-- =====================================================

TRUNCATE TABLE employee_new;

-- =====================================================
-- 22. Delete employee_new table permanently.
-- =====================================================

DROP TABLE employee_new;

-- =====================================================
-- 23. Delete department_new table permanently.
-- =====================================================

DROP TABLE department_new;

-- ==================================================================================================================================
/* SECTION-2 */
-- =====================================================
-- 1. WAQTD display all the names of employees.
-- =====================================================

SELECT emp_name
FROM employee_new;

-- =====================================================
-- 2. WAQTD display salaries of the employees.
-- =====================================================

SELECT salary
FROM employee_new;

-- =====================================================
-- 3. WAQTD display names along with their department numbers.
-- =====================================================

SELECT emp_name, dept_id
FROM employee_new;

-- =====================================================
-- 4. WAQTD display Name, Salary along with their department numbers.
-- =====================================================

SELECT emp_name, salary, dept_id
FROM employee_new;

-- =====================================================
-- 5. WAQTD display salaries of employees without repetition.
-- =====================================================

SELECT DISTINCT salary
FROM employee_new;

-- =====================================================
-- 6. WAQTD display all the details of the employees.
-- =====================================================

SELECT *
FROM employee_new;

-- =====================================================
-- 7. WAQTD display all the details of departments.
-- =====================================================

SELECT *
FROM department_new;

-- =====================================================
-- 8. WAQTD display Name and Employee ID of employees.
-- =====================================================

SELECT emp_name, emp_id
FROM employee_new;

-- =====================================================
-- 9. WAQTD display locations from departments.
-- =====================================================

SELECT location
FROM department_new;

-- =====================================================
-- 10. WAQTD display Name and Hire Date of employees.
-- =====================================================

SELECT emp_name, hire_date
FROM employee_new;

-- =====================================================
-- 11. WAQTD display annual salary with deduction of 23%.
-- =====================================================

SELECT emp_name,
       salary * 12 AS annual_salary,
       (salary * 12) * 0.77 AS salary_after_23_percent_deduction
FROM employee_new;

-- =====================================================
-- 12. WAQTD display employee details along with annual salary.
-- =====================================================

SELECT *,
       salary * 12 AS annual_salary
FROM employee_new;

-- =====================================================
-- 13. WAQTD display employee details along with salary after 59% hike.
-- =====================================================

SELECT *,
       salary * 1.59 AS salary_after_hike
FROM employee_new;

-- =====================================================
-- 14. WAQTD display employee details along with annual and quarterly salary.
-- =====================================================

SELECT *,
       salary * 12 AS annual_salary,
       salary * 3 AS quarterly_salary
FROM employee_new;

-- =====================================================
-- 15. WAQTD display employee name along with annual salary
-- after deducting 92% of quarterly salary.
-- =====================================================

SELECT emp_name,
       salary * 12 AS annual_salary,
       (salary * 12) - ((salary * 3) * 0.92) AS final_annual_salary
FROM employee_new;
-- ==========================================================================================================================================
/* SECTION-3 */
-- =====================================================
-- 1. WAQTD details of employees working in department 10.
-- =====================================================

SELECT *
FROM employee_new
WHERE dept_id = 10;

-- =====================================================
-- 2. WAQTD details of employees working in department 30.
-- =====================================================

SELECT *
FROM employee_new
WHERE dept_id = 30;

-- =====================================================
-- 3. WAQTD details of employees earning salary 3000.
-- =====================================================

SELECT *
FROM employee_new
WHERE salary = 3000;

-- =====================================================
-- 4. WAQTD details of employees hired after 09-JUN-1981.
-- =====================================================

SELECT *
FROM employee_new
WHERE hire_date > '1981-06-09';

-- =====================================================
-- 5. WAQTD names and salaries of employees earning more than 50000.
-- =====================================================

SELECT emp_name, salary
FROM employee_new
WHERE salary > 50000;

-- =====================================================
-- 6. Display details of employees earning salary less than 2500.
-- =====================================================

SELECT *
FROM employee_new
WHERE salary < 2500;

-- =====================================================
-- 7. Display names of employees working in department 20.
-- =====================================================

SELECT emp_name
FROM employee_new
WHERE dept_id = 20;

-- =====================================================
-- 8. Display details of employee whose name is Ravi.
-- =====================================================

SELECT *
FROM employee_new
WHERE emp_name = 'Ravi';

-- =====================================================
-- 9. Display details of employees hired after 2022.
-- =====================================================

SELECT *
FROM employee_new
WHERE YEAR(hire_date) > 2022;

-- =====================================================
-- 10. Display details of employees hired before 2022.
-- =====================================================

SELECT *
FROM employee_new
WHERE YEAR(hire_date) < 2022;

-- =====================================================
-- 11. Display annual salary of employee named Ravi.
-- =====================================================

SELECT emp_name,
       salary * 12 AS annual_salary
FROM employee_new
WHERE emp_name = 'Ravi';

-- =====================================================
-- 12. Display names of employees working in department 30.
-- =====================================================

SELECT emp_name
FROM employee_new
WHERE dept_id = 30;

-- =====================================================
-- 13. Display salaries of employees working in department 20.
-- =====================================================

SELECT salary
FROM employee_new
WHERE dept_id = 20;

-- =====================================================
-- 14. Display details of employees earning more than 2000.
-- =====================================================

SELECT *
FROM employee_new
WHERE salary > 2000;

-- =====================================================
-- 15. Display details of employee whose name is Kiran.
-- =====================================================

SELECT *
FROM employee_new
WHERE emp_name = 'Kiran';

-- =====================================================
-- 16. Display details of employees hired after 01-JAN-2022.
-- =====================================================

SELECT *
FROM employee_new
WHERE hire_date > '2022-01-01';

-- =====================================================
-- 17. Display employee name, salary and annual salary
-- whose annual salary is greater than 12000.
-- =====================================================

SELECT emp_name,
       salary,
       salary * 12 AS annual_salary
FROM employee_new
WHERE salary * 12 > 12000;

-- =====================================================
-- 18. Display employee IDs working in department 30.
-- =====================================================

SELECT emp_id
FROM employee_new
WHERE dept_id = 30;

-- =====================================================
-- 19. Display employee name and hire date before 2021.
-- =====================================================

SELECT emp_name, hire_date
FROM employee_new
WHERE YEAR(hire_date) < 2021;

-- =====================================================
-- 20. Display details of employees working in department 40.
-- =====================================================

SELECT *
FROM employee_new
WHERE dept_id = 40;

-- =====================================================
-- 21. Display employee name and salary whose age is 25.
-- =====================================================

SELECT emp_name, salary
FROM employee_new
WHERE age = 25;

-- =====================================================
-- 22. Display details of employees whose salary is greater than 60000.
-- =====================================================

SELECT *
FROM employee_new
WHERE salary > 60000;

-- =====================================================
-- 23. Display employee IDs hired before 2022.
-- =====================================================

SELECT emp_id
FROM employee_new
WHERE YEAR(hire_date) < 2022;

-- =====================================================
-- 24. Display details of employees whose age is greater than 30.
-- =====================================================

SELECT *
FROM employee_new
WHERE age > 30;

-- =====================================================
-- 25. Display details of employees earning more than 50000 per year.
-- =====================================================

SELECT *
FROM employee_new
WHERE salary * 12 > 50000;

-- ======================================================================================================================================
/* SECTION-4 */
-- =====================================================
-- 1. Write a query to display employee details along
-- with their annual salaries.
-- =====================================================

SELECT *,
       salary * 12 AS annual_salary
FROM employee_new;

-- =====================================================
-- 2. Write a query to display employee name along
-- with the hike of ₹700 if the employee is earning
-- an annual salary more than ₹25,000.
-- =====================================================

SELECT emp_name,
       salary + 700 AS salary_after_hike
FROM employee_new
WHERE salary * 12 > 25000;

-- =====================================================
-- 3. Write a query to display details of employees
-- whose quarterly salary is less than ₹7,500.
-- =====================================================

SELECT *
FROM employee_new
WHERE salary * 3 < 7500;

-- =====================================================
-- 4. WAQTD employee names and annual salary after
-- adding a monthly bonus of ₹500.
-- =====================================================

SELECT emp_name,
       (salary + 500) * 12 AS annual_salary
FROM employee_new;

-- =====================================================
-- 5. WAQTD employee details whose annual salary after
-- a deduction of ₹1000 is greater than ₹20,000.
-- =====================================================

SELECT *
FROM employee_new
WHERE (salary * 12) - 1000 > 20000;

-- =====================================================
-- 6. WAQTD employee names and salary after increasing
-- salary by 20%.
-- =====================================================

SELECT emp_name,
       salary * 1.20 AS increased_salary
FROM employee_new;

-- =====================================================
-- 7. WAQTD employee names and annual salary after
-- adding a monthly bonus of ₹500.
-- =====================================================

SELECT emp_name,
       (salary + 500) * 12 AS annual_salary
FROM employee_new;

-- =====================================================
-- 8. WAQTD employee details whose annual salary after
-- a deduction of ₹1000 is greater than ₹20,000.
-- =====================================================

SELECT *
FROM employee_new
WHERE (salary * 12) - 1000 > 20000;

-- =====================================================
-- 9. WAQTD employee names and salary after increasing
-- salary by 20%.
-- =====================================================

SELECT emp_name,
       salary * 1.20 AS increased_salary
FROM employee_new;

-- =====================================================
-- 10. WAQTD employee names and salary after decreasing
-- salary by 10%.
-- =====================================================

SELECT emp_name,
       salary * 0.90 AS decreased_salary
FROM employee_new;

-- =====================================================
-- 11. WAQTD employee details whose annual salary after
-- a 15% increment is greater than ₹40,000.
-- =====================================================

SELECT *
FROM employee_new
WHERE (salary * 12 * 1.15) > 40000;

-- =====================================================
-- 12. WAQTD employee names along with annual salary,
-- quarterly salary and half-yearly salary.
-- =====================================================

SELECT emp_name,
       salary * 12 AS annual_salary,
       salary * 3 AS quarterly_salary,
       salary * 6 AS half_yearly_salary
FROM employee_new;

-- =====================================================
-- 13. WAQTD employee details whose annual salary is
-- between ₹20,000 and ₹40,000.
-- =====================================================

SELECT *
FROM employee_new
WHERE salary * 12 BETWEEN 20000 AND 40000;

-- =====================================================
-- 14. WAQTD employee names whose salary after adding
-- ₹1000 becomes greater than ₹3000.
-- =====================================================

SELECT emp_name
FROM employee_new
WHERE salary + 1000 > 3000;

-- ======================================================================================================================================================
/* SECTION-5 LOGICAL -AND OP*/

-- =====================================================
-- 1. WAQTD details of the employees who are earning
-- a salary more than 300 in department number 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > 300
AND deptno = 20;

-- =====================================================
-- 2. WAQTD names of the employees along with their
-- salaries who are earning more than 1200 and
-- were hired before 1982.
-- =====================================================

SELECT ename, sal
FROM emp_classic_new
WHERE sal > 1200
AND hiredate < '1982-01-01';

-- =====================================================
-- 3. WAQTD details of the employees who are earning
-- a salary more than 1000 and belong to department 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > 1000
AND deptno = 20;

-- =====================================================
-- 4. WAQTD details of the employees hired after
-- March 1981, earning more than 1100 and
-- working in department 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE hiredate > '1981-03-31'
AND sal > 1100
AND deptno = 20;

-- =====================================================
-- 5. WAQTD details of employees earning more than
-- 1000 but less than 2200.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > 1000
AND sal < 2200;

-- =====================================================
-- 6. WAQTD names of employees hired after 1980
-- but before 1982 and working in department 10.
-- =====================================================

SELECT ename
FROM emp_classic_new
WHERE hiredate > '1980-12-31'
AND hiredate < '1982-01-01'
AND deptno = 10;
/* OR OPER */
-- =====================================================
-- 1. WAQTD details of employees working in
-- department 10 or 30.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno = 10
OR deptno = 30;

-- =====================================================
-- 2. WAQTD names and department numbers of employees
-- working as SALESMAN or ANALYST.
-- =====================================================

SELECT ename, deptno
FROM emp_classic_new
WHERE job = 'SALESMAN'
OR job = 'ANALYST';

-- =====================================================
-- 3. WAQTD details of employees earning more than
-- 2000 or working in department 30.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > 2000
OR deptno = 30;
/* NOT OP*/
-- =====================================================
-- 1. WAQTD details of employees who are not
-- working in department 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE NOT deptno = 20;

-- =====================================================
-- 2. WAQTD details of employees not working as
-- MANAGER in department 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno = 20
AND NOT job = 'MANAGER';

-- =====================================================
-- 3. WAQTD name, designation and department number
-- of employees working as CLERK in department 20 or 30.
-- =====================================================

SELECT ename, job, deptno
FROM emp_classic_new
WHERE job = 'CLERK'
AND (deptno = 20 OR deptno = 30);

-- =====================================================
-- 4. WAQTD details of employees working as
-- CLERK or MANAGER in department 10 or 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE (job = 'CLERK' OR job = 'MANAGER')
AND (deptno = 10 OR deptno = 20);

-- =====================================================
-- 5. WAQTD details of employees working as
-- MANAGER, ANALYST or SALESMAN
-- in departments 10,20 or 30
-- and hired after 1980 but before 1988.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE job IN ('MANAGER','ANALYST','SALESMAN')
AND deptno IN (10,20,30)
AND hiredate BETWEEN '1981-01-01' AND '1987-12-31';

-- =====================================================
-- 6. WAQTD details of employees working as
-- CLERK, MANAGER, SALESMAN,
-- PRESIDENT or ANALYST.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE job IN
('CLERK','MANAGER','SALESMAN','PRESIDENT','ANALYST');

-- =====================================================
-- 7. WAQTD details of employees working in
-- departments 10,20,30 and 40.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno IN (10,20,30,40);


-- ======================================================================================================================================
/* SECTION-6 Special Operators (IN, NOT IN, BETWEEN, LIKE, IS NULL, NOT LIKE).*/

-- =====================================================
-- 1. WAQTD details of employees working in
-- Departments 10, 20, 30 and 40.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno IN (10,20,30,40);

-- =====================================================
-- 2. WAQTD names of employees hired after 1980
-- in Department 10 or 20.
-- =====================================================

SELECT ename
FROM emp_classic_new
WHERE hiredate > '1980-12-31'
AND deptno IN (10,20);

-- =====================================================
-- 3. WAQTD details of employees working as
-- Analyst or President in Department 10 or 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE job IN ('ANALYST','PRESIDENT')
AND deptno IN (10,20);

-- =====================================================
-- 4. WAQTD details of employees working in
-- Departments 10,20 or 30 and earning
-- salary 3000,2450,1300,1500 or 1600.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno IN (10,20,30)
AND sal IN (3000,2450,1300,1500,1600);

-- =====================================================
-- 1. WAQTD details of employees who are not
-- working as Manager or Clerk
-- in Departments 10 and 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE job NOT IN ('MANAGER','CLERK')
AND deptno IN (10,20);

-- =====================================================
-- 2. WAQTD names of employees hired after 1980
-- and not in Department 10 or 20.
-- =====================================================

SELECT ename
FROM emp_classic_new
WHERE hiredate > '1980-12-31'
AND deptno NOT IN (10,20);

-- =====================================================
-- 1. WAQTD details of employees earning salary
-- between 1000 and 3000.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal BETWEEN 1000 AND 3000;

-- =====================================================
-- 2. WAQTD details of employees hired
-- between 1981 and 1986.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE hiredate BETWEEN '1981-01-01'
AND '1986-12-31';

-- =====================================================
-- 3. WAQTD employee name and salary of employees
-- earning salary between 1000 and 3000.
-- =====================================================

SELECT ename,sal
FROM emp_classic_new
WHERE sal BETWEEN 1000 AND 3000;

-- =====================================================
-- 4. WAQTD details of employees hired
-- between 1982 and 1987.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE hiredate BETWEEN '1982-01-01'
AND '1987-12-31';

-- =====================================================
-- 5. WAQTD details of employees hired between
-- 1982 and 1986 and earning salary between
-- 1300 and 3000.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE hiredate BETWEEN '1982-01-01'
AND '1986-12-31'
AND sal BETWEEN 1300 AND 3000;

-- =====================================================
-- 1. WAQTD details of employees not earning
-- salary between 1000 and 3000.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal NOT BETWEEN 1000 AND 3000;

-- =====================================================
-- 2. WAQTD details of employees hired between
-- 1981 and 1987, not earning salary between
-- 2300 and 5000, working as Salesman,
-- Analyst, Clerk or Manager,
-- belonging to Departments 10,20 or 30.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE hiredate BETWEEN '1981-01-01'
AND '1987-12-31'
AND sal NOT BETWEEN 2300 AND 5000
AND job IN ('SALESMAN','ANALYST','CLERK','MANAGER')
AND deptno IN (10,20,30);

-- =====================================================
-- 1. WAQTD details of employees
-- who are not earning commission.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE comm IS NULL;

-- =====================================================
-- 2. WAQTD details of employees
-- who are not having a Manager.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE mgr IS NULL;

-- =====================================================
-- 3. WAQTD names of employees
-- who are earning commission.
-- =====================================================

SELECT ename
FROM emp_classic_new
WHERE comm IS NOT NULL;


-- =====================================================
-- 1. WAQTD details of employees whose second
-- character is 'A'.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE ename LIKE '_A%';

-- =====================================================
-- 2. WAQTD names and salaries of employees whose
-- second character is 'L'.
-- =====================================================

SELECT ename,sal
FROM emp_classic_new
WHERE ename LIKE '_L%';

-- =====================================================
-- 3. WAQTD details of employees whose names
-- end with 'S'.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE ename LIKE '%S';

-- =====================================================
-- 4. WAQTD details of employees whose names
-- contain 'A' exactly two times.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE ename LIKE '%A%A%'
AND LENGTH(ename)-LENGTH(REPLACE(ename,'A',''))=2;

-- =====================================================
-- 5. WAQTD details of employees whose second
-- character is 'A'.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE ename LIKE '_A%';

-- =====================================================
-- 6. WAQTD names of employees whose third
-- character is 'R'.
-- =====================================================

SELECT ename
FROM emp_classic_new
WHERE ename LIKE '__R%';

-- =====================================================
-- 7. WAQTD details of employees whose first
-- character is 'S' and second character is 'M'.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE ename LIKE 'SM%';

-- =====================================================
-- 8. WAQTD names of employees whose last
-- character is 'N' and second last is 'O'.
-- =====================================================

SELECT ename
FROM emp_classic_new
WHERE ename LIKE '%ON';

-- =====================================================
-- 9. WAQTD employees whose fourth character is 'T'.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE ename LIKE '___T%';

-- =====================================================
-- 10. WAQTD employees whose fifth character is 'H'.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE ename LIKE '____H%';

-- =====================================================
-- 11. WAQTD employees whose names contain 'A'
-- but do not end with 'A'.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE ename LIKE '%A%'
AND ename NOT LIKE '%A';

-- =====================================================
-- 12. WAQTD employees whose salary contains
-- exactly 4 digits.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal BETWEEN 1000 AND 9999;

-- =====================================================
-- 1. WAQTD names of employees whose name
-- does not contain character 'A'.
-- =====================================================

SELECT ename
FROM emp_classic_new
WHERE ename NOT LIKE '%A%';

-- =====================================================
-- 2. WAQTD details of employees whose name
-- contains character 'A' or 'E'.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE ename LIKE '%A%'
OR ename LIKE '%E%';


-- =============================================================================================================================================================
/* SECTION-7 Aggregate Functions (31 Questions).*/

-- =====================================================
-- 1. WAQTD minimum salary given to employees.
-- =====================================================

SELECT MIN(sal) AS minimum_salary
FROM emp_classic_new;

-- =====================================================
-- 2. WAQTD maximum salary given to employees.
-- =====================================================

SELECT MAX(sal) AS maximum_salary
FROM emp_classic_new;

-- =====================================================
-- 3. WAQTD total salary needed to pay all employees.
-- =====================================================

SELECT SUM(sal) AS total_salary
FROM emp_classic_new;

-- =====================================================
-- 4. WAQTD average salary needed to pay all employees.
-- =====================================================

SELECT AVG(sal) AS average_salary
FROM emp_classic_new;

-- =====================================================
-- 5. WAQTD total number of employees present
-- in the EMP table.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new;

-- =====================================================
-- 6. WAQTD number of employees earning salary
-- and commission.
-- =====================================================

SELECT COUNT(comm) AS employees_with_commission
FROM emp_classic_new;

-- =====================================================
-- 7. WAQTD total number of employees
-- working in department 10.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new
WHERE deptno=10;

-- =====================================================
-- 8. WAQTD maximum salary given to employees
-- in department 30.
-- =====================================================

SELECT MAX(sal) AS maximum_salary
FROM emp_classic_new
WHERE deptno=30;

-- =====================================================
-- 9. WAQTD number of distinct jobs
-- present in the EMP table.
-- =====================================================

SELECT COUNT(DISTINCT job) AS total_jobs
FROM emp_classic_new;

-- =====================================================
-- 10. WAQTD number of employees whose name
-- contains character 'A'.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new
WHERE ename LIKE '%A%';

-- =====================================================
-- 11. WAQTD number of employees whose first
-- character is 'A'.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new
WHERE ename LIKE 'A%';

-- =====================================================
-- 12. WAQTD number of employees having
-- 'A' in their names.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new
WHERE ename LIKE '%A%';

-- =====================================================
-- 13. WAQTD number of employees having
-- character 'Z' in their names.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new
WHERE ename LIKE '%Z%';

-- =====================================================
-- 14. WAQTD number of employees having
-- 'S' in their names.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new
WHERE ename LIKE '%S%';

-- =====================================================
-- 15. WAQTD total salary needed to pay employees
-- whose names have two consecutive 'L's.
-- =====================================================

SELECT SUM(sal) AS total_salary
FROM emp_classic_new
WHERE ename LIKE '%LL%';
-- =====================================================
-- 16. WAQTD number of employees whose name
-- contains character 'A'.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new
WHERE ename LIKE '%A%';

-- =====================================================
-- 17. WAQTD number of employees whose first
-- character is 'A'.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new
WHERE ename LIKE 'A%';

-- =====================================================
-- 18. WAQTD number of employees having
-- 'A' in their names.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new
WHERE ename LIKE '%A%';

-- =====================================================
-- 19. WAQTD number of employees having
-- character 'Z' in their names.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new
WHERE ename LIKE '%Z%';

-- =====================================================
-- 20. WAQTD number of employees having
-- 'S' in their names.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new
WHERE ename LIKE '%S%';

-- =====================================================
-- 21. WAQTD total salary needed to pay employees
-- whose names have two consecutive 'L's.
-- =====================================================

SELECT SUM(sal) AS total_salary
FROM emp_classic_new
WHERE ename LIKE '%LL%';

-- =====================================================
-- 22. WAQTD maximum salary, minimum salary and
-- number of employees working in departments
-- 10 and 30 whose:
-- Job contains 'E' or 'A'
-- Name contains 'A' or 'O'
-- Hired in 1981 or 1982
-- Salary has 4 digits.
-- =====================================================

SELECT
MAX(sal) AS maximum_salary,
MIN(sal) AS minimum_salary,
COUNT(*) AS total_employees
FROM emp_classic_new
WHERE deptno IN (10,30)
AND (job LIKE '%E%' OR job LIKE '%A%')
AND (ename LIKE '%A%' OR ename LIKE '%O%')
AND YEAR(hiredate) IN (1981,1982)
AND sal BETWEEN 1000 AND 9999;

-- =====================================================
-- 23. WAQTD number of employees in department 30
-- whose:
-- Job contains 'E'
-- Hired in 1981
-- Salary between 901 and 2999.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new
WHERE deptno=30
AND job LIKE '%E%'
AND YEAR(hiredate)=1981
AND sal BETWEEN 901 AND 2999;

-- =====================================================
-- 24. WAQTD total salary needed to pay employees
-- hired in February.
-- =====================================================

SELECT SUM(sal) AS total_salary
FROM emp_classic_new
WHERE MONTH(hiredate)=2;

-- =====================================================
-- 25. WAQTD total number of employees whose
-- designation contains 'C'
-- and hired in the year 1981.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new
WHERE job LIKE '%C%'
AND YEAR(hiredate)=1981;

-- =====================================================
-- 26. WAQTD total number of employees working
-- in departments 10,20 and 30.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new
WHERE deptno IN (10,20,30);

-- =====================================================
-- 27. WAQTD number of employees working
-- in each department.
-- =====================================================

SELECT deptno,
COUNT(*) AS total_employees
FROM emp_classic_new
GROUP BY deptno;

-- =====================================================
-- 28. WAQTD maximum salary given to employees
-- working as Analyst.
-- =====================================================

SELECT MAX(sal) AS maximum_salary
FROM emp_classic_new
WHERE job='ANALYST';

-- =====================================================
-- 29. WAQTD total salary given to employees
-- working as Clerk in department 30.
-- =====================================================

SELECT SUM(sal) AS total_salary
FROM emp_classic_new
WHERE job='CLERK'
AND deptno=30;

-- =====================================================
-- 30. WAQTD average salary given to Clerks.
-- =====================================================

SELECT AVG(sal) AS average_salary
FROM emp_classic_new
WHERE job='CLERK';

-- =====================================================
-- 31. WAQTD minimum salary given to Managers
-- or Clerks working in department 10.
-- =====================================================

SELECT MIN(sal) AS minimum_salary
FROM emp_classic_new
WHERE job IN ('MANAGER','CLERK')
AND deptno=10;


-- ==========================================================================================================================================

/* SECTION-8 GROUP BY (Using emp_classic_new)*/
-- =====================================================
-- 1. WAQTD number of employees present in the Employee table.
-- =====================================================

SELECT COUNT(*) AS total_employees
FROM emp_classic_new;

-- =====================================================
-- 2. WAQTD number of employees working in each department.
-- =====================================================

SELECT deptno,
COUNT(*) AS total_employees
FROM emp_classic_new
GROUP BY deptno;

-- =====================================================
-- 3. WAQTD number of employees along with the total
-- salary needed to pay each department.
-- =====================================================

SELECT deptno,
COUNT(*) AS total_employees,
SUM(sal) AS total_salary
FROM emp_classic_new
GROUP BY deptno;

-- =====================================================
-- 4. WAQTD total number of employees working in each
-- department whose names contain the character 'A'.
-- =====================================================

SELECT deptno,
COUNT(*) AS total_employees
FROM emp_classic_new
WHERE ename LIKE '%A%'
GROUP BY deptno;

-- =====================================================
-- 5. WAQTD maximum salary along with minimum salary
-- and department number for each department.
-- =====================================================

SELECT deptno,
MAX(sal) AS maximum_salary,
MIN(sal) AS minimum_salary
FROM emp_classic_new
GROUP BY deptno;

-- =====================================================
-- 6. WAQTD total number of employees working in each
-- department who were hired after 31-Dec-1980,
-- before 01-Jan-1987 and earning a salary
-- between 1000 and 5000.
-- =====================================================

SELECT deptno,
COUNT(*) AS total_employees
FROM emp_classic_new
WHERE hiredate BETWEEN '1981-01-01' AND '1986-12-31'
AND sal BETWEEN 1000 AND 5000
GROUP BY deptno;

-- =====================================================
-- 7. WAQTD total salary needed to pay employees
-- of each job.
-- =====================================================

SELECT job,
SUM(sal) AS total_salary
FROM emp_classic_new
GROUP BY job;

-- =====================================================
-- 8. WAQTD salaries along with the number of
-- times each salary appears in the Employee table.
-- =====================================================

SELECT sal,
COUNT(*) AS frequency
FROM emp_classic_new
GROUP BY sal;

-- =====================================================
-- 9. WAQTD number of employees working in each
-- department if at least 4 employees are
-- working in that department.
-- =====================================================

SELECT deptno,
COUNT(*) AS total_employees
FROM emp_classic_new
GROUP BY deptno
HAVING COUNT(*) >= 4;

-- ===============================================================================================================================================================
/* SECTION-9 HAVING Clause (10 Questions)*/
-- =====================================================
-- 1. WAQTD department number and number of employees
-- working in each department if there are at least
-- 2 Clerks in each department.
-- =====================================================

SELECT deptno,
COUNT(*) AS total_employees
FROM emp_classic_new
WHERE job='CLERK'
GROUP BY deptno
HAVING COUNT(*)>=2;

-- =====================================================
-- 2. WAQTD department number and total salary needed
-- to pay all employees in each department if there
-- are at least 4 employees in that department.
-- =====================================================

SELECT deptno,
SUM(sal) AS total_salary
FROM emp_classic_new
GROUP BY deptno
HAVING COUNT(*)>=4;

-- =====================================================
-- 3. WAQTD number of employees earning more than
-- 1200 in each job and the total salary needed
-- to pay employees of that job, where the total
-- salary exceeds 3800.
-- =====================================================

SELECT job,
COUNT(*) AS total_employees,
SUM(sal) AS total_salary
FROM emp_classic_new
WHERE sal>1200
GROUP BY job
HAVING SUM(sal)>3800;

-- =====================================================
-- 4. WAQTD department number and number of Managers
-- in each department if there are exactly 2 Managers.
-- =====================================================

SELECT deptno,
COUNT(*) AS total_managers
FROM emp_classic_new
WHERE job='MANAGER'
GROUP BY deptno
HAVING COUNT(*)=2;

-- =====================================================
-- 5. WAQTD job and maximum salary of employees in
-- each job if the maximum salary exceeds 2600.
-- =====================================================

SELECT job,
MAX(sal) AS maximum_salary
FROM emp_classic_new
GROUP BY job
HAVING MAX(sal)>2600;

-- =====================================================
-- 6. WAQTD salaries that are repeated in the
-- Employee table.
-- =====================================================

SELECT sal,
COUNT(*) AS frequency
FROM emp_classic_new
GROUP BY sal
HAVING COUNT(*)>1;

-- =====================================================
-- 7. WAQTD hire dates that are duplicated in the
-- Employee table.
-- =====================================================

SELECT hiredate,
COUNT(*) AS frequency
FROM emp_classic_new
GROUP BY hiredate
HAVING COUNT(*)>1;

-- =====================================================
-- 8. WAQTD average salary of each department if
-- the average salary is less than 3000.
-- =====================================================

SELECT deptno,
AVG(sal) AS average_salary
FROM emp_classic_new
GROUP BY deptno
HAVING AVG(sal)<3000;

-- =====================================================
-- 9. WAQTD department numbers having at least
-- 3 employees whose names contain 'A' or 'S'.
-- =====================================================

SELECT deptno,
COUNT(*) AS total_employees
FROM emp_classic_new
WHERE ename LIKE '%A%'
OR ename LIKE '%S%'
GROUP BY deptno
HAVING COUNT(*)>=3;

-- =====================================================
-- 10. WAQTD minimum and maximum salaries of each
-- job if the minimum salary is greater than 1000
-- and the maximum salary is less than 5000.
-- =====================================================

SELECT job,
MIN(sal) AS minimum_salary,
MAX(sal) AS maximum_salary
FROM emp_classic_new
GROUP BY job
HAVING MIN(sal)>1000
AND MAX(sal)<5000;

-- =================================================================================================================================================================

/* SECTION-10 ORDER BY Clause (Using emp_classic_new)*/

-- =====================================================
-- 1. WAQTD details of employees based on their
-- salaries in ascending order.
-- =====================================================

SELECT *
FROM emp_classic_new
ORDER BY sal ASC;

-- =====================================================
-- 2. WAQTD details of employees based on their
-- salaries in descending order.
-- =====================================================

SELECT *
FROM emp_classic_new
ORDER BY sal DESC;

-- =====================================================
-- 3. WAQTD number of employees working in each
-- department if their names contain the
-- character 'A' or 'E', arranged in ascending
-- order of employee count.
-- =====================================================

SELECT deptno,
COUNT(*) AS total_employees
FROM emp_classic_new
WHERE ename LIKE '%A%'
OR ename LIKE '%E%'
GROUP BY deptno
ORDER BY total_employees ASC;

-- =====================================================
-- 4. WAQTD employee details ordered by
-- department number in ascending order
-- and salary in descending order.
-- =====================================================

SELECT *
FROM emp_classic_new
ORDER BY deptno ASC, sal DESC;


/* SECTION-11 Assignment on GROUP BY (10 Questions).*/

-- =====================================================
-- 1. WAQTD number of employees working in each
-- department except PRESIDENT.
-- =====================================================

SELECT deptno,
COUNT(*) AS total_employees
FROM emp_classic_new
WHERE job <> 'PRESIDENT'
GROUP BY deptno;

-- =====================================================
-- 2. WAQTD total salary needed to pay all
-- employees in each job.
-- =====================================================

SELECT job,
SUM(sal) AS total_salary
FROM emp_classic_new
GROUP BY job;

-- =====================================================
-- 3. WAQTD number of employees working as
-- MANAGER in each department.
-- =====================================================

SELECT deptno,
COUNT(*) AS total_managers
FROM emp_classic_new
WHERE job='MANAGER'
GROUP BY deptno;

-- =====================================================
-- 4. WAQTD average salary of each department
-- excluding department 20.
-- =====================================================

SELECT deptno,
AVG(sal) AS average_salary
FROM emp_classic_new
WHERE deptno<>20
GROUP BY deptno;

-- =====================================================
-- 5. WAQTD number of employees having
-- the character 'A' in their names in each job.
-- =====================================================

SELECT job,
COUNT(*) AS total_employees
FROM emp_classic_new
WHERE ename LIKE '%A%'
GROUP BY job;

-- =====================================================
-- 6. WAQTD number of employees and average salary
-- of employees whose salary is greater than
-- 2000 in each department.
-- =====================================================

SELECT deptno,
COUNT(*) AS total_employees,
AVG(sal) AS average_salary
FROM emp_classic_new
WHERE sal>2000
GROUP BY deptno;

-- =====================================================
-- 7. WAQTD total salary needed to pay SALESMEN
-- and number of SALESMEN in each department.
-- =====================================================

SELECT deptno,
COUNT(*) AS total_salesmen,
SUM(sal) AS total_salary
FROM emp_classic_new
WHERE job='SALESMAN'
GROUP BY deptno;

-- =====================================================
-- 8. WAQTD number of employees and maximum salary
-- in each job.
-- =====================================================

SELECT job,
COUNT(*) AS total_employees,
MAX(sal) AS maximum_salary
FROM emp_classic_new
GROUP BY job;

-- =====================================================
-- 9. WAQTD maximum salary given to an employee
-- in each department.
-- =====================================================

SELECT deptno,
MAX(sal) AS maximum_salary
FROM emp_classic_new
GROUP BY deptno;

-- =====================================================
-- 10. WAQTD number of times salaries are present
-- in the Employee table.
-- =====================================================

SELECT sal,
COUNT(*) AS frequency
FROM emp_classic_new
GROUP BY sal;

-- ==================================================================================================================================================================
/* SECTION-12 SHOPPING DATABASE (Part 1)*/

-- =====================================================
-- 1. Create customers_new table.
-- =====================================================

CREATE TABLE customers_new(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    city VARCHAR(30),
    gender VARCHAR(10),
    age INT
);

-- =====================================================
-- 2. Insert records into customers_new table.
-- =====================================================

INSERT INTO customers_new VALUES
(101,'Rahul','Hyderabad','Male',24),
(102,'Priya','Chennai','Female',22),
(103,'Kiran','Bangalore','Male',28),
(104,'Anjali','Hyderabad','Female',25),
(105,'Rohit','Mumbai','Male',30),
(106,'Sneha','Delhi','Female',27),
(107,'Arjun','Chennai','Male',23),
(108,'Divya','Pune','Female',26),
(109,'Karthik','Hyderabad','Male',29),
(110,'Meena','Bangalore','Female',24);

-- =====================================================
-- 3. Create products_new table.
-- =====================================================

CREATE TABLE products_new(
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2)
);

-- =====================================================
-- 4. Insert records into products_new table.
-- =====================================================

INSERT INTO products_new VALUES
('P101','Laptop','Electronics',65000),
('P102','Mobile','Electronics',30000),
('P103','Shoes','Fashion',2500),
('P104','Watch','Accessories',5000),
('P105','Headphones','Electronics',3500),
('P106','Bag','Fashion',2000),
('P107','Tablet','Electronics',45000),
('P108','Keyboard','Electronics',1500),
('P109','Backpack','Accessories',1800),
('P110','T-Shirt','Fashion',1200);

-- =====================================================
-- 5. Create orders_new table.
-- =====================================================

CREATE TABLE orders_new(
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id VARCHAR(10),
    quantity INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES customers_new(customer_id),
    FOREIGN KEY(product_id) REFERENCES products_new(product_id)
);

-- =====================================================
-- 6. Insert records into orders_new table.
-- =====================================================

INSERT INTO orders_new VALUES
(1001,101,'P101',1,65000,'2025-01-10'),
(1002,102,'P103',2,5000,'2025-01-12'),
(1003,103,'P104',1,5000,'2025-02-15'),
(1004,101,'P105',2,7000,'2025-02-20'),
(1005,105,'P102',1,30000,'2025-03-01'),
(1006,104,'P106',3,6000,'2025-03-10'),
(1007,108,'P103',1,2500,'2025-04-05'),
(1008,106,'P105',1,3500,'2025-04-08'),
(1009,107,'P104',2,10000,'2025-05-01'),
(1010,101,'P102',1,30000,'2025-05-15'),
(1011,103,'P108',2,3000,'2025-05-20'),
(1012,109,'P107',1,45000,'2025-06-02'),
(1013,102,'P109',2,3600,'2025-06-10'),
(1014,104,'P110',4,4800,'2025-06-15'),
(1015,105,'P105',2,7000,'2025-06-18');

-- =====================================================
-- 7. Display all records from customers_new table.
-- =====================================================

SELECT * FROM customers_new;

-- =====================================================
-- 8. Display all records from products_new table.
-- =====================================================

SELECT * FROM products_new;

-- =====================================================
-- 9. Display all records from orders_new table.
-- =====================================================

SELECT * FROM orders_new;

-- =====================================================
-- 10. Display only customer names.
-- =====================================================

SELECT customer_name
FROM customers_new;

-- =====================================================
-- 11. Display customer names and cities.
-- =====================================================

SELECT customer_name, city
FROM customers_new;

-- =====================================================
-- 12. Display product names and prices.
-- =====================================================

SELECT product_name, price
FROM products_new;

-- =====================================================
-- 13. Display order ID and order amount.
-- =====================================================

SELECT order_id, amount
FROM orders_new;

-- =====================================================
-- 14. Display all unique cities.
-- =====================================================

SELECT DISTINCT city
FROM customers_new;

-- =====================================================
-- 15. Display all unique product categories.
-- =====================================================

SELECT DISTINCT category
FROM products_new;

-- =====================================================
-- 16. Display all unique customer genders.
-- =====================================================

SELECT DISTINCT gender
FROM customers_new;

/* Section 12 – Shopping Database (Part 2) */
-- =====================================================
-- 17. Display customers who belong to Hyderabad.
-- =====================================================

SELECT *
FROM customers_new
WHERE city='Hyderabad';

-- =====================================================
-- 18. Display customers whose age is greater than 25.
-- =====================================================

SELECT *
FROM customers_new
WHERE age>25;

-- =====================================================
-- 19. Display products whose price is greater than 5000.
-- =====================================================

SELECT *
FROM products_new
WHERE price>5000;

-- =====================================================
-- 20. Display products belonging to Electronics category.
-- =====================================================

SELECT *
FROM products_new
WHERE category='Electronics';

-- =====================================================
-- 21. Display orders whose amount is greater than 10000.
-- =====================================================

SELECT *
FROM orders_new
WHERE amount>10000;

-- =====================================================
-- 22. Display customers whose names start with 'R'.
-- =====================================================

SELECT *
FROM customers_new
WHERE customer_name LIKE 'R%';

-- =====================================================
-- 23. Display customers whose names end with 'A'.
-- =====================================================

SELECT *
FROM customers_new
WHERE customer_name LIKE '%A';

-- =====================================================
-- 24. Display products whose names contain 'o'.
-- =====================================================

SELECT *
FROM products_new
WHERE product_name LIKE '%o%';

-- =====================================================
-- 25. Display customers whose city is Hyderabad or Chennai.
-- =====================================================

SELECT *
FROM customers_new
WHERE city IN ('Hyderabad','Chennai');

-- =====================================================
-- 26. Display products whose price is between 2000 and 10000.
-- =====================================================

SELECT *
FROM products_new
WHERE price BETWEEN 2000 AND 10000;

-- =====================================================
-- 27. Display orders placed during March 2025.
-- =====================================================

SELECT *
FROM orders_new
WHERE order_date BETWEEN '2025-03-01' AND '2025-03-31';

-- =====================================================
-- 28. Display customers whose age is not between 20 and 25.
-- =====================================================

SELECT *
FROM customers_new
WHERE age NOT BETWEEN 20 AND 25;

-- =====================================================
-- 29. Display products not belonging to Fashion category.
-- =====================================================

SELECT *
FROM products_new
WHERE category<>'Fashion';

-- =====================================================
-- 30. Display all customers ordered by name.
-- =====================================================

SELECT *
FROM customers_new
ORDER BY customer_name ASC;

-- =====================================================
-- 31. Display all products ordered by price (High to Low).
-- =====================================================

SELECT *
FROM products_new
ORDER BY price DESC;

-- =====================================================
-- 32. Display orders ordered by amount.
-- =====================================================

SELECT *
FROM orders_new
ORDER BY amount ASC;

-- =====================================================
-- 33. Display top 5 costliest products.
-- =====================================================

SELECT *
FROM products_new
ORDER BY price DESC
LIMIT 5;

-- =====================================================
-- 34. Display top 3 cheapest products.
-- =====================================================

SELECT *
FROM products_new
ORDER BY price ASC
LIMIT 3;

-- =====================================================
-- 35. Display total number of customers.
-- =====================================================

SELECT COUNT(*) AS total_customers
FROM customers_new;

-- =====================================================
-- 36. Display total number of products.
-- =====================================================

SELECT COUNT(*) AS total_products
FROM products_new;

-- =====================================================
-- 37. Display total number of orders.
-- =====================================================

SELECT COUNT(*) AS total_orders
FROM orders_new;

-- =====================================================
-- 38. Display maximum product price.
-- =====================================================

SELECT MAX(price) AS maximum_price
FROM products_new;

-- =====================================================
-- 39. Display minimum product price.
-- =====================================================

SELECT MIN(price) AS minimum_price
FROM products_new;

-- =====================================================
-- 40. Display average product price.
-- =====================================================

SELECT AVG(price) AS average_price
FROM products_new;

-- =====================================================
-- 41. Display total value of all products.
-- =====================================================

SELECT SUM(price) AS total_price
FROM products_new;

-- =====================================================
-- 42. Display highest order amount.
-- =====================================================

SELECT MAX(amount) AS highest_order
FROM orders_new;

-- =====================================================
-- 43. Display lowest order amount.
-- =====================================================

SELECT MIN(amount) AS lowest_order
FROM orders_new;

-- =====================================================
-- 44. Display average order amount.
-- =====================================================

SELECT AVG(amount) AS average_order
FROM orders_new;

-- =====================================================
-- 45. Display total sales amount.
-- =====================================================

SELECT SUM(amount) AS total_sales
FROM orders_new;

-- =====================================================
-- 46. Display number of customers in each city.
-- =====================================================

SELECT city,
COUNT(*) AS total_customers
FROM customers_new
GROUP BY city;

-- =====================================================
-- 47. Display number of products in each category.
-- =====================================================

SELECT category,
COUNT(*) AS total_products
FROM products_new
GROUP BY category;

-- =====================================================
-- 48. Display total sales amount for each customer.
-- =====================================================

SELECT customer_id,
SUM(amount) AS total_sales
FROM orders_new
GROUP BY customer_id;

-- =====================================================
-- 49. Display average order amount for each customer.
-- =====================================================

SELECT customer_id,
AVG(amount) AS average_order
FROM orders_new
GROUP BY customer_id;

-- =====================================================
-- 50. Display total quantity ordered by each customer.
-- =====================================================

SELECT customer_id,
SUM(quantity) AS total_quantity
FROM orders_new
GROUP BY customer_id;

/* Part 3 (Questions 51–80: HAVING, JOINS, and advanced queries). */

-- =====================================================
-- 51. Display cities having more than one customer.
-- =====================================================

SELECT city,
COUNT(*) AS total_customers
FROM customers_new
GROUP BY city
HAVING COUNT(*) > 1;

-- =====================================================
-- 52. Display categories having more than two products.
-- =====================================================

SELECT category,
COUNT(*) AS total_products
FROM products_new
GROUP BY category
HAVING COUNT(*) > 2;

-- =====================================================
-- 53. Display customers whose total purchase amount
-- is greater than ₹30000.
-- =====================================================

SELECT customer_id,
SUM(amount) AS total_purchase
FROM orders_new
GROUP BY customer_id
HAVING SUM(amount) > 30000;

-- =====================================================
-- 54. Display customer IDs having more than one order.
-- =====================================================

SELECT customer_id,
COUNT(*) AS total_orders
FROM orders_new
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- =====================================================
-- 55. Display categories whose average product
-- price is greater than ₹5000.
-- =====================================================

SELECT category,
AVG(price) AS average_price
FROM products_new
GROUP BY category
HAVING AVG(price) > 5000;

-- =====================================================
-- 56. Display customer name and city.
-- =====================================================

SELECT customer_name,
city
FROM customers_new;

-- =====================================================
-- 57. Display product name and price.
-- =====================================================

SELECT product_name,
price
FROM products_new;

-- =====================================================
-- 58. Display customer name and order amount.
-- =====================================================

SELECT c.customer_name,
o.amount
FROM customers_new c
INNER JOIN orders_new o
ON c.customer_id=o.customer_id;

-- =====================================================
-- 59. Display customer name, product name and amount.
-- =====================================================

SELECT c.customer_name,
p.product_name,
o.amount
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id;

-- =====================================================
-- 60. Display all orders with customer details.
-- =====================================================

SELECT *
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id;

-- =====================================================
-- 61. Display all orders with product details.
-- =====================================================

SELECT *
FROM orders_new o
JOIN products_new p
ON o.product_id=p.product_id;

-- =====================================================
-- 62. Display customer name, city, product name,
-- quantity and amount.
-- =====================================================

SELECT c.customer_name,
c.city,
p.product_name,
o.quantity,
o.amount
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id;

-- =====================================================
-- 63. Display customers who purchased Electronics.
-- =====================================================

SELECT DISTINCT c.customer_name
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id
WHERE p.category='Electronics';

-- =====================================================
-- 64. Display customers who purchased Fashion products.
-- =====================================================

SELECT DISTINCT c.customer_name
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id
WHERE p.category='Fashion';

-- =====================================================
-- 65. Display products purchased by Rahul.
-- =====================================================

SELECT p.product_name
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id
WHERE c.customer_name='Rahul';

-- =====================================================
-- 66. Display total purchase amount of each customer.
-- =====================================================

SELECT c.customer_name,
SUM(o.amount) AS total_purchase
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name;

-- =====================================================
-- 67. Display total quantity ordered for each product.
-- =====================================================

SELECT p.product_name,
SUM(o.quantity) AS total_quantity
FROM products_new p
JOIN orders_new o
ON p.product_id=o.product_id
GROUP BY p.product_name;

-- =====================================================
-- 68. Display average purchase amount of each customer.
-- =====================================================

SELECT c.customer_name,
AVG(o.amount) AS average_purchase
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name;

-- =====================================================
-- 69. Display highest order amount of each customer.
-- =====================================================

SELECT c.customer_name,
MAX(o.amount) AS highest_order
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name;

-- =====================================================
-- 70. Display lowest order amount of each customer.
-- =====================================================

SELECT c.customer_name,
MIN(o.amount) AS lowest_order
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name;

-- =====================================================
-- 71. Display total sales for each category.
-- =====================================================

SELECT p.category,
SUM(o.amount) AS total_sales
FROM products_new p
JOIN orders_new o
ON p.product_id=o.product_id
GROUP BY p.category;

-- =====================================================
-- 72. Display number of orders for each category.
-- =====================================================

SELECT p.category,
COUNT(*) AS total_orders
FROM products_new p
JOIN orders_new o
ON p.product_id=o.product_id
GROUP BY p.category;

-- =====================================================
-- 73. Display customer names who placed more than one order.
-- =====================================================

SELECT c.customer_name,
COUNT(*) AS total_orders
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name
HAVING COUNT(*) > 1;

-- =====================================================
-- 74. Display products ordered more than once.
-- =====================================================

SELECT p.product_name,
COUNT(*) AS total_orders
FROM products_new p
JOIN orders_new o
ON p.product_id=o.product_id
GROUP BY p.product_name
HAVING COUNT(*) > 1;

-- =====================================================
-- 75. Display categories with total sales above ₹20000.
-- =====================================================

SELECT p.category,
SUM(o.amount) AS total_sales
FROM products_new p
JOIN orders_new o
ON p.product_id=o.product_id
GROUP BY p.category
HAVING SUM(o.amount) > 20000;

-- =====================================================
-- 76. Display cities with customers who placed orders.
-- =====================================================

SELECT DISTINCT c.city
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id;

-- =====================================================
-- 77. Display customers who have not placed any order.
-- =====================================================

SELECT c.customer_name
FROM customers_new c
LEFT JOIN orders_new o
ON c.customer_id=o.customer_id
WHERE o.order_id IS NULL;

-- =====================================================
-- 78. Display products that have never been ordered.
-- =====================================================

SELECT p.product_name
FROM products_new p
LEFT JOIN orders_new o
ON p.product_id=o.product_id
WHERE o.order_id IS NULL;

-- =====================================================
-- 79. Display total revenue generated by all orders.
-- =====================================================

SELECT SUM(amount) AS total_revenue
FROM orders_new;

-- =====================================================
-- 80. Display customer name, product name,
-- quantity, amount and order date.
-- =====================================================

SELECT c.customer_name,
p.product_name,
o.quantity,
o.amount,
o.order_date
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id;

-- ===========================================================================================================================================
/* Section 13 – SQL JOINS (INNER, LEFT, RIGHT, FULL, SELF, CROSS, NATURAL) using emp_classic_new and dept_classic_new. */

-- =====================================================
-- 1. WAQTD display employee name along with department name.
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- 2. WAQTD display employee name, salary and department name.
-- =====================================================

SELECT e.ename,
       e.sal,
       d.dname
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- 3. WAQTD display employee name, job and department location.
-- =====================================================

SELECT e.ename,
       e.job,
       d.loc
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- 4. WAQTD display all employee details with department details.
-- =====================================================

SELECT *
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- 5. WAQTD display employee names working in SALES department.
-- =====================================================

SELECT e.ename
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno = d.deptno
WHERE d.dname='SALES';

-- =====================================================
-- 6. WAQTD display employee names working in ACCOUNTING.
-- =====================================================

SELECT e.ename
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE d.dname='ACCOUNTING';

-- =====================================================
-- 7. WAQTD display employee names working in DALLAS.
-- =====================================================

SELECT e.ename
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE d.loc='DALLAS';

-- =====================================================
-- 8. WAQTD display employee names and department names
-- whose salary is greater than 2000.
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE e.sal>2000;

-- =====================================================
-- 9. WAQTD display employee names,
-- department names and locations.
-- =====================================================

SELECT e.ename,
       d.dname,
       d.loc
FROM emp_classic_new e
JOIN dept_classic_new d
ON e.deptno=d.deptno;

-- =====================================================
-- 10. WAQTD display employee names,
-- department names ordered by department.
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
JOIN dept_classic_new d
ON e.deptno=d.deptno
ORDER BY d.dname;

-- =====================================================
-- 11. WAQTD display employee names
-- whose department is RESEARCH.
-- =====================================================

SELECT e.ename
FROM emp_classic_new e
JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE d.dname='RESEARCH';

-- =====================================================
-- 12. WAQTD display employee names
-- and department locations where salary >1500.
-- =====================================================

SELECT e.ename,
       d.loc
FROM emp_classic_new e
JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE e.sal>1500;

-- =====================================================
-- 13. WAQTD display employee names
-- hired after 1981 with department names.
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE YEAR(e.hiredate)>1981;

-- =====================================================
-- 14. WAQTD display employee names,
-- salary and department names
-- ordered by salary descending.
-- =====================================================

SELECT e.ename,
       e.sal,
       d.dname
FROM emp_classic_new e
JOIN dept_classic_new d
ON e.deptno=d.deptno
ORDER BY e.sal DESC;

-- =====================================================
-- 15. WAQTD display employee names,
-- job and department names.
-- =====================================================

SELECT e.ename,
       e.job,
       d.dname
FROM emp_classic_new e
JOIN dept_classic_new d
ON e.deptno=d.deptno;

-- =====================================================
-- 16. WAQTD display all departments along with employees.
-- (LEFT JOIN)
-- =====================================================

SELECT d.deptno,
       d.dname,
       e.ename
FROM dept_classic_new d
LEFT JOIN emp_classic_new e
ON d.deptno=e.deptno;

-- =====================================================
-- 17. WAQTD display all employees along with department details.
-- (RIGHT JOIN)
-- =====================================================

SELECT e.ename,
       d.dname,
       d.loc
FROM dept_classic_new d
RIGHT JOIN emp_classic_new e
ON d.deptno=e.deptno;

-- =====================================================
-- 18. WAQTD display departments having no employees.
-- =====================================================

SELECT d.*
FROM dept_classic_new d
LEFT JOIN emp_classic_new e
ON d.deptno=e.deptno
WHERE e.empno IS NULL;

-- =====================================================
-- 19. WAQTD display employees without department.
-- =====================================================

SELECT e.*
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE d.deptno IS NULL;

-- =====================================================
-- 20. WAQTD display employee name and manager name.
-- (SELF JOIN)
-- =====================================================

SELECT e.ename AS Employee,
       m.ename AS Manager
FROM emp_classic_new e
LEFT JOIN emp_classic_new m
ON e.mgr=m.empno;

-- =====================================================
-- 21. WAQTD display employee name, manager name and job.
-- =====================================================

SELECT e.ename,
       m.ename AS Manager,
       e.job
FROM emp_classic_new e
LEFT JOIN emp_classic_new m
ON e.mgr=m.empno;

-- =====================================================
-- 22. WAQTD display employees working under KING.
-- =====================================================

SELECT e.ename
FROM emp_classic_new e
JOIN emp_classic_new m
ON e.mgr=m.empno
WHERE m.ename='KING';

-- =====================================================
-- 23. WAQTD display managers and number of employees under them.
-- =====================================================

SELECT m.ename AS Manager,
       COUNT(e.empno) AS Total_Employees
FROM emp_classic_new m
LEFT JOIN emp_classic_new e
ON m.empno=e.mgr
GROUP BY m.empno,m.ename;

-- =====================================================
-- 24. WAQTD display employee name and manager name
-- ordered by manager.
-- =====================================================

SELECT e.ename,
       m.ename AS Manager
FROM emp_classic_new e
LEFT JOIN emp_classic_new m
ON e.mgr=m.empno
ORDER BY Manager;

-- =====================================================
-- 25. WAQTD display all employee and department combinations.
-- (CROSS JOIN)
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
CROSS JOIN dept_classic_new d;

-- =====================================================
-- 26. WAQTD display employee and department details
-- using NATURAL JOIN.
-- =====================================================

SELECT *
FROM emp_classic_new
NATURAL JOIN dept_classic_new;

-- =====================================================
-- 27. WAQTD display employee names and locations
-- using NATURAL JOIN.
-- =====================================================

SELECT ename,
       loc
FROM emp_classic_new
NATURAL JOIN dept_classic_new;

-- =====================================================
-- 28. WAQTD display employee names,
-- department names and locations.
-- =====================================================

SELECT e.ename,
       d.dname,
       d.loc
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno;

-- =====================================================
-- 29. WAQTD display employees whose salary
-- is greater than department average salary.
-- =====================================================

SELECT e.*
FROM emp_classic_new e
JOIN
(
SELECT deptno,
AVG(sal) avg_sal
FROM emp_classic_new
GROUP BY deptno
) a
ON e.deptno=a.deptno
WHERE e.sal>a.avg_sal;

-- =====================================================
-- 30. WAQTD display department names
-- and total employees.
-- =====================================================

SELECT d.dname,
COUNT(e.empno) Total_Employees
FROM dept_classic_new d
LEFT JOIN emp_classic_new e
ON d.deptno=e.deptno
GROUP BY d.dname;

-- ============================================================================================================================================================

/* Section 14 – Subqueries (30+ Questions) */

-- =====================================================
-- 1. WAQTD display employees earning more than SMITH.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal >
(
SELECT sal
FROM emp_classic_new
WHERE ename='SMITH'
);

-- =====================================================
-- 2. WAQTD display employees working in the same
-- department as ALLEN.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno =
(
SELECT deptno
FROM emp_classic_new
WHERE ename='ALLEN'
);

-- =====================================================
-- 3. WAQTD display employees hired before KING.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE hiredate <
(
SELECT hiredate
FROM emp_classic_new
WHERE ename='KING'
);

-- =====================================================
-- 4. WAQTD display employees earning the maximum salary.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal =
(
SELECT MAX(sal)
FROM emp_classic_new
);

-- =====================================================
-- 5. WAQTD display employees earning the minimum salary.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal =
(
SELECT MIN(sal)
FROM emp_classic_new
);

-- =====================================================
-- 6. WAQTD display employees earning above average salary.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal >
(
SELECT AVG(sal)
FROM emp_classic_new
);

-- =====================================================
-- 7. WAQTD display employees working in SALES department.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno =
(
SELECT deptno
FROM dept_classic_new
WHERE dname='SALES'
);

-- =====================================================
-- 8. WAQTD display employees working in ACCOUNTING.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno =
(
SELECT deptno
FROM dept_classic_new
WHERE dname='ACCOUNTING'
);

-- =====================================================
-- 9. WAQTD display employees working in DALLAS.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno =
(
SELECT deptno
FROM dept_classic_new
WHERE loc='DALLAS'
);

-- =====================================================
-- 10. WAQTD display employees earning more than JONES.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal >
(
SELECT sal
FROM emp_classic_new
WHERE ename='JONES'
);

-- =====================================================
-- 11. WAQTD display employees earning less than SCOTT.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal <
(
SELECT sal
FROM emp_classic_new
WHERE ename='SCOTT'
);

-- =====================================================
-- 12. WAQTD display employees working in the same
-- job as CLARK.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE job =
(
SELECT job
FROM emp_classic_new
WHERE ename='CLARK'
);

-- =====================================================
-- 13. WAQTD display employees earning the second
-- highest salary.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal =
(
SELECT MAX(sal)
FROM emp_classic_new
WHERE sal <
(
SELECT MAX(sal)
FROM emp_classic_new
)
);

-- =====================================================
-- 14. WAQTD display employees working in the department
-- having maximum department number.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno =
(
SELECT MAX(deptno)
FROM dept_classic_new
);

-- =====================================================
-- 15. WAQTD display employees working in the department
-- having minimum department number.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno =
(
SELECT MIN(deptno)
FROM dept_classic_new
);
-- =====================================================
-- 16. WAQTD display employees working in departments
-- where Managers are working.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno IN
(
SELECT deptno
FROM emp_classic_new
WHERE job='MANAGER'
);

-- =====================================================
-- 17. WAQTD display employees earning salary equal
-- to any Clerk's salary.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal IN
(
SELECT sal
FROM emp_classic_new
WHERE job='CLERK'
);

-- =====================================================
-- 18. WAQTD display employees earning more than
-- ALL Clerks.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > ALL
(
SELECT sal
FROM emp_classic_new
WHERE job='CLERK'
);

-- =====================================================
-- 19. WAQTD display employees earning more than
-- ANY Salesman.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > ANY
(
SELECT sal
FROM emp_classic_new
WHERE job='SALESMAN'
);

-- =====================================================
-- 20. WAQTD display employees working in departments
-- located in NEW YORK.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno IN
(
SELECT deptno
FROM dept_classic_new
WHERE loc='NEW YORK'
);

-- =====================================================
-- 21. WAQTD display employees whose salary is
-- greater than department average salary.
-- =====================================================

SELECT *
FROM emp_classic_new e
WHERE sal >
(
SELECT AVG(sal)
FROM emp_classic_new
WHERE deptno=e.deptno
);

-- =====================================================
-- 22. WAQTD display employees having the maximum
-- salary in each department.
-- =====================================================

SELECT *
FROM emp_classic_new e
WHERE sal=
(
SELECT MAX(sal)
FROM emp_classic_new
WHERE deptno=e.deptno
);

-- =====================================================
-- 23. WAQTD display employees having the minimum
-- salary in each department.
-- =====================================================

SELECT *
FROM emp_classic_new e
WHERE sal=
(
SELECT MIN(sal)
FROM emp_classic_new
WHERE deptno=e.deptno
);

-- =====================================================
-- 24. WAQTD display departments having employees.
-- =====================================================

SELECT *
FROM dept_classic_new d
WHERE EXISTS
(
SELECT *
FROM emp_classic_new e
WHERE d.deptno=e.deptno
);

-- =====================================================
-- 25. WAQTD display departments having no employees.
-- =====================================================

SELECT *
FROM dept_classic_new d
WHERE NOT EXISTS
(
SELECT *
FROM emp_classic_new e
WHERE d.deptno=e.deptno
);

-- =====================================================
-- 26. WAQTD display employees whose salary is greater
-- than the average salary of their job.
-- =====================================================

SELECT *
FROM emp_classic_new e
WHERE sal>
(
SELECT AVG(sal)
FROM emp_classic_new
WHERE job=e.job
);

-- =====================================================
-- 27. WAQTD display employees whose hire date is
-- earlier than the average hire date of their department.
-- =====================================================

SELECT *
FROM emp_classic_new e
WHERE hiredate<
(
SELECT AVG(hiredate)
FROM emp_classic_new
WHERE deptno=e.deptno
);

-- =====================================================
-- 28. WAQTD display employees whose salary is equal
-- to the highest salary of their job.
-- =====================================================

SELECT *
FROM emp_classic_new e
WHERE sal=
(
SELECT MAX(sal)
FROM emp_classic_new
WHERE job=e.job
);

-- =====================================================
-- 29. WAQTD display employees working in the same
-- department as KING except KING.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno=
(
SELECT deptno
FROM emp_classic_new
WHERE ename='KING'
)
AND ename<>'KING';

-- =====================================================
-- 30. WAQTD display employees earning more than
-- the employee whose empno is 7566.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal>
(
SELECT sal
FROM emp_classic_new
WHERE empno=7566
);
-- =============================================================================================================================================================
/* Section 15 – Window Functions using emp_classic_new */

-- =====================================================
-- 1. WAQTD display employee details with ROW_NUMBER().
-- =====================================================

SELECT empno,
       ename,
       job,
       sal,
       ROW_NUMBER() OVER(ORDER BY sal DESC) AS row_num
FROM emp_classic_new;

-- =====================================================
-- 2. WAQTD display employee details with RANK().
-- =====================================================

SELECT empno,
       ename,
       sal,
       RANK() OVER(ORDER BY sal DESC) AS emp_rank
FROM emp_classic_new;

-- =====================================================
-- 3. WAQTD display employee details with DENSE_RANK().
-- =====================================================

SELECT empno,
       ename,
       sal,
       DENSE_RANK() OVER(ORDER BY sal DESC) AS dense_rank
FROM emp_classic_new;

-- =====================================================
-- 4. WAQTD display top 3 highest paid employees.
-- =====================================================

SELECT *
FROM
(
SELECT *,
DENSE_RANK() OVER(ORDER BY sal DESC) rnk
FROM emp_classic_new
) t
WHERE rnk<=3;

-- =====================================================
-- 5. WAQTD display second highest salary employee.
-- =====================================================

SELECT *
FROM
(
SELECT *,
DENSE_RANK() OVER(ORDER BY sal DESC) rnk
FROM emp_classic_new
) t
WHERE rnk=2;

-- =====================================================
-- 6. WAQTD display third highest salary employee.
-- =====================================================

SELECT *
FROM
(
SELECT *,
DENSE_RANK() OVER(ORDER BY sal DESC) rnk
FROM emp_classic_new
) t
WHERE rnk=3;

-- =====================================================
-- 7. WAQTD display ROW_NUMBER department wise.
-- =====================================================

SELECT empno,
       ename,
       deptno,
       sal,
ROW_NUMBER() OVER
(PARTITION BY deptno ORDER BY sal DESC) row_no
FROM emp_classic_new;

-- =====================================================
-- 8. WAQTD display RANK department wise.
-- =====================================================

SELECT empno,
       ename,
       deptno,
       sal,
RANK() OVER
(PARTITION BY deptno ORDER BY sal DESC) emp_rank
FROM emp_classic_new;

-- =====================================================
-- 9. WAQTD display DENSE_RANK department wise.
-- =====================================================

SELECT empno,
       ename,
       deptno,
       sal,
DENSE_RANK() OVER
(PARTITION BY deptno ORDER BY sal DESC) dense_rank
FROM emp_classic_new;

-- =====================================================
-- 10. WAQTD display highest salary employee
-- from each department.
-- =====================================================

SELECT *
FROM
(
SELECT *,
DENSE_RANK() OVER
(PARTITION BY deptno ORDER BY sal DESC) rnk
FROM emp_classic_new
) t
WHERE rnk=1;

-- =====================================================
-- 11. WAQTD display previous employee salary
-- using LAG().
-- =====================================================

SELECT empno,
       ename,
       sal,
LAG(sal) OVER(ORDER BY sal) previous_salary
FROM emp_classic_new;

-- =====================================================
-- 12. WAQTD display next employee salary
-- using LEAD().
-- =====================================================

SELECT empno,
       ename,
       sal,
LEAD(sal) OVER(ORDER BY sal) next_salary
FROM emp_classic_new;

-- =====================================================
-- 13. WAQTD display FIRST_VALUE salary.
-- =====================================================

SELECT empno,
       ename,
       sal,
FIRST_VALUE(sal)
OVER(ORDER BY sal DESC) highest_salary
FROM emp_classic_new;

-- =====================================================
-- 14. WAQTD display LAST_VALUE salary.
-- =====================================================

SELECT empno,
       ename,
       sal,
LAST_VALUE(sal)
OVER(
ORDER BY sal
ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
) lowest_salary
FROM emp_classic_new;

-- =====================================================
-- 15. WAQTD divide employees into 4 groups
-- using NTILE().
-- =====================================================

SELECT empno,
       ename,
       sal,
NTILE(4) OVER(ORDER BY sal DESC) grp
FROM emp_classic_new;

-- =====================================================
-- 16. WAQTD display cumulative salary.
-- =====================================================

SELECT empno,
       ename,
       sal,
SUM(sal) OVER(ORDER BY sal) cumulative_salary
FROM emp_classic_new;

-- =====================================================
-- 17. WAQTD display average salary department wise.
-- =====================================================

SELECT empno,
       ename,
       deptno,
       sal,
AVG(sal) OVER(PARTITION BY deptno) avg_salary
FROM emp_classic_new;

-- =====================================================
-- 18. WAQTD display total salary department wise.
-- =====================================================

SELECT empno,
       ename,
       deptno,
       sal,
SUM(sal) OVER(PARTITION BY deptno) total_salary
FROM emp_classic_new;

-- =====================================================
-- 19. WAQTD display maximum salary department wise.
-- =====================================================

SELECT empno,
       ename,
       deptno,
       sal,
MAX(sal) OVER(PARTITION BY deptno) max_salary
FROM emp_classic_new;

-- =====================================================
-- 20. WAQTD display minimum salary department wise.
-- =====================================================

SELECT empno,
       ename,
       deptno,
       sal,
MIN(sal) OVER(PARTITION BY deptno) min_salary
FROM emp_classic_new;

-- ====================================================================================================================================================

/* SECTION 16 – VIEWS (Using emp_classic_new & dept_classic_new) */
-- =====================================================
-- 1. Create a view to display employees
-- whose salary is greater than 3000.
-- =====================================================

CREATE VIEW HighSalaryEmployees AS
SELECT *
FROM emp_classic_new
WHERE sal > 3000;

SELECT * FROM HighSalaryEmployees;

-- =====================================================
-- 2. Create a view to display employee details
-- along with department name.
-- =====================================================

CREATE VIEW EmployeeDepartmentView AS
SELECT e.empno,
       e.ename,
       e.job,
       e.sal,
       d.dname
FROM emp_classic_new e
JOIN dept_classic_new d
ON e.deptno=d.deptno;

SELECT * FROM EmployeeDepartmentView;

-- =====================================================
-- 3. Create a view to display total salary
-- of each department.
-- =====================================================

CREATE VIEW DepartmentSalaryView AS
SELECT deptno,
       SUM(sal) AS total_salary
FROM emp_classic_new
GROUP BY deptno;

SELECT * FROM DepartmentSalaryView;
-- =============================================================================================================================================================
/* SECTION 17 – CTE (Common Table Expressions) */
-- =====================================================
-- 1. Display employees whose salary is greater
-- than company average salary.
-- =====================================================

WITH AvgSalary AS
(
SELECT AVG(sal) avg_sal
FROM emp_classic_new
)
SELECT *
FROM emp_classic_new,AvgSalary
WHERE sal>avg_sal;

-- =====================================================
-- 2. Calculate average salary of each department.
-- =====================================================

WITH DeptAvg AS
(
SELECT deptno,
AVG(sal) avg_salary
FROM emp_classic_new
GROUP BY deptno
)
SELECT *
FROM DeptAvg;

-- =====================================================
-- 3. Display highest paid employee(s)
-- in each department.
-- =====================================================

WITH MaxSalary AS
(
SELECT deptno,
MAX(sal) max_sal
FROM emp_classic_new
GROUP BY deptno
)
SELECT e.*
FROM emp_classic_new e
JOIN MaxSalary m
ON e.deptno=m.deptno
AND e.sal=m.max_sal;

-- =============================================================================================================================================================
/* SECTION 18 – TRIGGERS (Using New Tables) */
-- =====================================================
-- 1. Create employee_trigger_new table.
-- =====================================================

CREATE TABLE employee_trigger_new(
empid INT PRIMARY KEY,
ename VARCHAR(50),
designation VARCHAR(50),
email VARCHAR(100),
salary DECIMAL(10,2)
);

CREATE TABLE employee_history_new(
id INT AUTO_INCREMENT PRIMARY KEY,
message VARCHAR(200),
created_on DATETIME
);

CREATE TABLE salary_log_new(
id INT AUTO_INCREMENT PRIMARY KEY,
empid INT,
old_salary DECIMAL(10,2),
new_salary DECIMAL(10,2),
updated_on DATETIME
);

CREATE TABLE employee_backup_new(
empid INT,
ename VARCHAR(50),
designation VARCHAR(50),
email VARCHAR(100),
salary DECIMAL(10,2),
deleted_on DATETIME
);

-- =====================================================
-- Prevent negative salary.
-- =====================================================

DELIMITER //

CREATE TRIGGER trg_negative_salary_new
BEFORE INSERT
ON employee_trigger_new
FOR EACH ROW
BEGIN
IF NEW.salary<0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Salary Cannot Be Negative';
END IF;
END//

DELIMITER ;

-- =====================================================
-- Store employee history after insert.
-- =====================================================

DELIMITER //

CREATE TRIGGER trg_history_new
AFTER INSERT
ON employee_trigger_new
FOR EACH ROW
BEGIN
INSERT INTO employee_history_new(message,created_on)
VALUES(CONCAT('Employee ',NEW.ename,' Added Successfully'),
NOW());
END//

DELIMITER ;

-- =====================================================
-- Store salary changes.
-- =====================================================

DELIMITER //

CREATE TRIGGER trg_salary_log_new
AFTER UPDATE
ON employee_trigger_new
FOR EACH ROW
BEGIN
IF OLD.salary<>NEW.salary THEN
INSERT INTO salary_log_new
(empid,old_salary,new_salary,updated_on)
VALUES
(OLD.empid,OLD.salary,NEW.salary,NOW());
END IF;
END//

DELIMITER ;

-- =====================================================
-- Prevent salary reduction.
-- =====================================================

DELIMITER //

CREATE TRIGGER trg_no_reduce_new
BEFORE UPDATE
ON employee_trigger_new
FOR EACH ROW
BEGIN
IF NEW.salary<OLD.salary THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Salary Cannot Be Reduced';
END IF;
END//

DELIMITER ;

-- =====================================================
-- Backup deleted employee.
-- =====================================================

DELIMITER //

CREATE TRIGGER trg_backup_new
AFTER DELETE
ON employee_trigger_new
FOR EACH ROW
BEGIN
INSERT INTO employee_backup_new
VALUES
(
OLD.empid,
OLD.ename,
OLD.designation,
OLD.email,
OLD.salary,
NOW()
);
END//

DELIMITER ;


-- =============================================================================================================================================================
 /* SECTION 19 – TCL (Transaction Control Language) */
 -- =====================================================
-- 1. Start Transaction and Commit.
-- =====================================================

START TRANSACTION;

INSERT INTO employee_trigger_new
VALUES
(101,'Rahul','Developer','rahul@gmail.com',30000);

COMMIT;

-- =====================================================
-- 2. Start Transaction and Rollback.
-- =====================================================

START TRANSACTION;

INSERT INTO employee_trigger_new
VALUES
(102,'Anjali','Tester','anjali@gmail.com',25000);

ROLLBACK;

-- =====================================================
-- 3. Demonstrate SAVEPOINT.
-- =====================================================

START TRANSACTION;

INSERT INTO employee_trigger_new
VALUES
(103,'Ravi','Developer','ravi@gmail.com',35000);

SAVEPOINT sp1;

INSERT INTO employee_trigger_new
VALUES
(104,'Kiran','Manager','kiran@gmail.com',50000);

ROLLBACK TO sp1;

COMMIT;

-- =====================================================
-- 4. RELEASE SAVEPOINT.
-- =====================================================

START TRANSACTION;

SAVEPOINT sp2;

RELEASE SAVEPOINT sp2;

COMMIT;

-- =====================================================
-- 5. READ UNCOMMITTED.
-- =====================================================

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

START TRANSACTION;

SELECT * FROM employee_trigger_new;

COMMIT;

-- =====================================================
-- 6. READ COMMITTED.
-- =====================================================

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT * FROM employee_trigger_new;

COMMIT;

-- =====================================================
-- 7. REPEATABLE READ.
-- =====================================================

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

START TRANSACTION;

SELECT * FROM employee_trigger_new;

COMMIT;

-- =====================================================
-- 8. SERIALIZABLE.
-- =====================================================

SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

START TRANSACTION;

SELECT * FROM employee_trigger_new;

COMMIT;
