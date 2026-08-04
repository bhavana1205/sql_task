-- =====================================================
-- INNER JOIN - 1
-- Employee details along with department details
-- if the employee is working as CLERK.
-- =====================================================

SELECT e.*, d.*
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno = d.deptno
WHERE e.job = 'CLERK';

-- =====================================================
-- INNER JOIN - 2
-- Employee details along with department details
-- if salary > 1500.
-- =====================================================

SELECT e.*, d.*
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno = d.deptno
WHERE e.sal > 1500;

-- =====================================================
-- INNER JOIN - 3
-- Employee name along with location
-- if location contains 'a'.
-- =====================================================

SELECT e.ename,
       d.loc
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno = d.deptno
WHERE d.loc LIKE '%A%';

-- =====================================================
-- INNER JOIN - 4
-- Employee details with department details
-- if working in department 20 or 30.
-- =====================================================

SELECT e.*, d.*
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno = d.deptno
WHERE e.deptno IN (20,30);

-- =====================================================
-- INNER JOIN - 5
-- Employee details with department details
-- if salary is greater than MARTIN.
-- =====================================================

SELECT e.*, d.*
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE e.sal >
(
SELECT sal
FROM emp_classic_new
WHERE ename='MARTIN'
);

-- =====================================================
-- INNER JOIN - 6
-- Employee name, salary, department number and
-- location hired after 31-Dec-1981
-- in department 10 or 20.
-- =====================================================

SELECT e.ename,
       e.sal,
       e.deptno,
       d.loc
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE e.hiredate>'1981-12-31'
AND e.deptno IN(10,20);

-- =====================================================
-- INNER JOIN - 7
-- Number of employees working in each location.
-- =====================================================

SELECT d.loc,
COUNT(*) AS total_employees
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
GROUP BY d.loc;

-- =====================================================
-- INNER JOIN - 8
-- Department name and hiredate for employees
-- hired after 1983 in ACCOUNTING or RESEARCH.
-- =====================================================

SELECT d.dname,
       e.hiredate
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE YEAR(e.hiredate)>1983
AND d.dname IN('ACCOUNTING','RESEARCH');

-- =====================================================
-- INNER JOIN - 9
-- Employee name and department name
-- getting commission in department 10 or 30.
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE e.comm IS NOT NULL
AND e.deptno IN(10,30);

-- =====================================================
-- INNER JOIN - 10
-- Department name and employee number
-- empno 7839 and 7902 working in NEW YORK.
-- =====================================================

SELECT d.dname,
       e.empno
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE e.empno IN(7839,7902)
AND d.loc='NEW YORK';

-- =====================================================
-- ASSIGNMENT - 1
-- Employee name and location.
-- =====================================================

SELECT e.ename,
       d.loc
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno;

-- =====================================================
-- ASSIGNMENT - 2
-- Department name and salary
-- for ACCOUNTING employees.
-- =====================================================

SELECT d.dname,
       e.sal
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE d.dname='ACCOUNTING';

-- =====================================================
-- ASSIGNMENT - 3
-- Department name and annual salary
-- salary > 2340.
-- =====================================================

SELECT d.dname,
       e.sal*12 AS annual_salary
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE e.sal>2340;

-- =====================================================
-- ASSIGNMENT - 4
-- Employee name and department name
-- having 'A' in department.
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE d.dname LIKE '%A%';

-- =====================================================
-- ASSIGNMENT - 5
-- Employee name and department name
-- working as SALESMAN.
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE e.job='SALESMAN';

-- =====================================================
-- ASSIGNMENT - 6
-- Department name and job
-- starting with 'S'.
-- =====================================================

SELECT d.dname,
       e.job
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE e.job LIKE 'S%'
AND d.dname LIKE 'S%';

-- =====================================================
-- ASSIGNMENT - 7
-- Department name and manager number
-- reporting to 7839.
-- =====================================================

SELECT d.dname,
       e.mgr
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE e.mgr=7839;

-- =====================================================
-- ASSIGNMENT - 8
-- Department name and hiredate
-- hired after 1983 in ACCOUNTING or RESEARCH.
-- =====================================================

SELECT d.dname,
       e.hiredate
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE YEAR(e.hiredate)>1983
AND d.dname IN('ACCOUNTING','RESEARCH');

-- =====================================================
-- ASSIGNMENT - 9
-- Employee name and department name
-- getting commission in department 10 or 30.
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE e.comm IS NOT NULL
AND e.deptno IN(10,30);

-- =====================================================
-- ASSIGNMENT - 10
-- Department name and employee number
-- empno 7839 and 7902 working in NEW YORK.
-- =====================================================

SELECT d.dname,
       e.empno
FROM emp_classic_new e
INNER JOIN dept_classic_new d
ON e.deptno=d.deptno
WHERE e.empno IN(7839,7902)
AND d.loc='NEW YORK';

-- =====================================================
-- CROSS JOIN - 1
-- Display every employee with every department.
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
CROSS JOIN dept_classic_new d;

-- =====================================================
-- CROSS JOIN - 2
-- Display every employee with every department location.
-- =====================================================

SELECT e.ename,
       d.loc
FROM emp_classic_new e
CROSS JOIN dept_classic_new d;

-- =====================================================
-- CROSS JOIN - 3
-- Display employee name and every department name.
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
CROSS JOIN dept_classic_new d;

-- =====================================================
-- CROSS JOIN - 4
-- Display employee name and every department location.
-- =====================================================

SELECT e.ename,
       d.loc
FROM emp_classic_new e
CROSS JOIN dept_classic_new d;

-- =====================================================
-- CROSS JOIN - 5
-- Display all employee and department details.
-- =====================================================

SELECT *
FROM emp_classic_new e
CROSS JOIN dept_classic_new d;

-- =====================================================
-- CROSS JOIN - 6
-- Display CLERK employees with every department.
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
CROSS JOIN dept_classic_new d
WHERE e.job='CLERK';

-- =====================================================
-- CROSS JOIN - 7
-- Display employees earning more than 2000
-- with every department.
-- =====================================================

SELECT e.ename,
       e.sal,
       d.dname
FROM emp_classic_new e
CROSS JOIN dept_classic_new d
WHERE e.sal>2000;

-- =====================================================
-- CROSS JOIN - 8
-- Display employees hired after 1981
-- with every department.
-- =====================================================

SELECT e.ename,
       e.hiredate,
       d.dname
FROM emp_classic_new e
CROSS JOIN dept_classic_new d
WHERE e.hiredate>'1981-12-31';

-- =====================================================
-- CROSS JOIN - 9
-- Display every MANAGER with every location.
-- =====================================================

SELECT e.ename,
       d.loc
FROM emp_classic_new e
CROSS JOIN dept_classic_new d
WHERE e.job='MANAGER';

-- =====================================================
-- CROSS JOIN - 10
-- Display employees with salary >1500
-- and every location.
-- =====================================================

SELECT e.ename,
       e.sal,
       d.loc
FROM emp_classic_new e
CROSS JOIN dept_classic_new d
WHERE e.sal>1500;

-- =====================================================
-- CROSS JOIN - 11
-- Display every department with every employee.
-- =====================================================

SELECT d.dname,
       e.ename
FROM dept_classic_new d
CROSS JOIN emp_classic_new e;

-- =====================================================
-- CROSS JOIN - 12
-- Display department names and employee salaries.
-- =====================================================

SELECT d.dname,
       e.sal
FROM dept_classic_new d
CROSS JOIN emp_classic_new e;

-- =====================================================
-- CROSS JOIN - 13
-- Display employee name and department number.
-- =====================================================

SELECT e.ename,
       d.deptno
FROM emp_classic_new e
CROSS JOIN dept_classic_new d;

-- =====================================================
-- CROSS JOIN - 14
-- Display all employee names ordered alphabetically.
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
CROSS JOIN dept_classic_new d
ORDER BY e.ename;

-- =====================================================
-- CROSS JOIN - 15
-- Display all possible employee-department combinations.
-- =====================================================

SELECT *
FROM emp_classic_new
CROSS JOIN dept_classic_new;

-- =====================================================
-- NATURAL JOIN - 1
-- Display employee details along with department details.
-- =====================================================

SELECT *
FROM emp_classic_new
NATURAL JOIN dept_classic_new;

-- =====================================================
-- NATURAL JOIN - 2
-- Display employee name, department name and location.
-- =====================================================

SELECT ename,
       dname,
       loc
FROM emp_classic_new
NATURAL JOIN dept_classic_new;

-- =====================================================
-- NATURAL JOIN - 3
-- Display employee name and department name
-- for CLERK employees.
-- =====================================================

SELECT ename,
       dname
FROM emp_classic_new
NATURAL JOIN dept_classic_new
WHERE job='CLERK';

-- =====================================================
-- NATURAL JOIN - 4
-- Display employee name, salary and location
-- if salary >1500.
-- =====================================================

SELECT ename,
       sal,
       loc
FROM emp_classic_new
NATURAL JOIN dept_classic_new
WHERE sal>1500;

-- =====================================================
-- NATURAL JOIN - 5
-- Display employee name, department name
-- and hiredate after 31-Dec-1981.
-- =====================================================

SELECT ename,
       dname,
       hiredate
FROM emp_classic_new
NATURAL JOIN dept_classic_new
WHERE hiredate>'1981-12-31';

-- =====================================================
-- NATURAL JOIN - 6
-- Display employee name and department location.
-- =====================================================

SELECT ename,
       loc
FROM emp_classic_new
NATURAL JOIN dept_classic_new;

-- =====================================================
-- NATURAL JOIN - 7
-- Display employee name, job and department name.
-- =====================================================

SELECT ename,
       job,
       dname
FROM emp_classic_new
NATURAL JOIN dept_classic_new;

-- =====================================================
-- NATURAL JOIN - 8
-- Display employee name and annual salary.
-- =====================================================

SELECT ename,
       sal*12 AS annual_salary,
       dname
FROM emp_classic_new
NATURAL JOIN dept_classic_new;

-- =====================================================
-- NATURAL JOIN - 9
-- Display employees working in SALES department.
-- =====================================================

SELECT ename,
       dname
FROM emp_classic_new
NATURAL JOIN dept_classic_new
WHERE dname='SALES';

-- =====================================================
-- NATURAL JOIN - 10
-- Display employees working in DALLAS.
-- =====================================================

SELECT ename,
       loc
FROM emp_classic_new
NATURAL JOIN dept_classic_new
WHERE loc='DALLAS';

-- =====================================================
-- NATURAL JOIN - 11
-- Display employee name and commission.
-- =====================================================

SELECT ename,
       comm,
       dname
FROM emp_classic_new
NATURAL JOIN dept_classic_new;

-- =====================================================
-- NATURAL JOIN - 12
-- Display managers with department names.
-- =====================================================

SELECT ename,
       dname
FROM emp_classic_new
NATURAL JOIN dept_classic_new
WHERE job='MANAGER';

-- =====================================================
-- NATURAL JOIN - 13
-- Display employee name and salary
-- ordered by salary descending.
-- =====================================================

SELECT ename,
       sal,
       dname
FROM emp_classic_new
NATURAL JOIN dept_classic_new
ORDER BY sal DESC;

-- =====================================================
-- NATURAL JOIN - 14
-- Display employee name and department location
-- ordered by employee name.
-- =====================================================

SELECT ename,
       loc
FROM emp_classic_new
NATURAL JOIN dept_classic_new
ORDER BY ename;

-- =====================================================
-- NATURAL JOIN - 15
-- Display all employee and department records.
-- =====================================================

SELECT *
FROM emp_classic_new
NATURAL JOIN dept_classic_new;

-- =====================================================
-- LEFT JOIN - 1
-- Display all employees along with their department
-- names, including employees without departments.
-- =====================================================

SELECT e.*, d.dname
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- LEFT JOIN - 2
-- Display employee name, job, salary,
-- department name and location.
-- =====================================================

SELECT e.ename,
       e.job,
       e.sal,
       d.dname,
       d.loc
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- LEFT JOIN - 3
-- Display employees whose department
-- information is not available.
-- =====================================================

SELECT e.*
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno = d.deptno
WHERE d.deptno IS NULL;

-- =====================================================
-- LEFT JOIN - 4
-- Display employee name and department name.
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- LEFT JOIN - 5
-- Display employee name, department number
-- and department name.
-- =====================================================

SELECT e.ename,
       e.deptno,
       d.dname
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- LEFT JOIN - 6
-- Display SALES employees and employees
-- without departments.
-- =====================================================

SELECT e.ename,
       d.dname
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno = d.deptno
WHERE d.dname='SALES'
OR d.dname IS NULL;

-- =====================================================
-- LEFT JOIN - 7
-- Display employee name, hiredate,
-- department name and location.
-- =====================================================

SELECT e.ename,
       e.hiredate,
       d.dname,
       d.loc
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- LEFT JOIN - 8
-- Display employee and department details
-- ordered by employee name.
-- =====================================================

SELECT e.*,
       d.*
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno = d.deptno
ORDER BY e.ename;

-- =====================================================
-- LEFT JOIN - 9
-- Display employee name, salary,
-- department name and location
-- where salary >2500.
-- =====================================================

SELECT e.ename,
       e.sal,
       d.dname,
       d.loc
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno = d.deptno
WHERE e.sal > 2500;

-- =====================================================
-- LEFT JOIN - 10
-- Display all employees whether or not
-- they belong to a department.
-- =====================================================

SELECT *
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- RIGHT JOIN - 1
-- Display all departments along with
-- employees working in them.
-- =====================================================

SELECT d.*,
       e.ename
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- RIGHT JOIN - 2
-- Display department number,
-- department name and employee name.
-- =====================================================

SELECT d.deptno,
       d.dname,
       e.ename
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- RIGHT JOIN - 3
-- Display department names and locations,
-- even if no employees exist.
-- =====================================================

SELECT d.dname,
       d.loc
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- RIGHT JOIN - 4
-- Display department name,
-- employee name and salary.
-- =====================================================

SELECT d.dname,
       e.ename,
       e.sal
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- RIGHT JOIN - 5
-- Display departments having no employees.
-- =====================================================

SELECT d.*
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno = d.deptno
WHERE e.empno IS NULL;

-- =====================================================
-- RIGHT JOIN - 6
-- Display department name,
-- employee name, job and hiredate.
-- =====================================================

SELECT d.dname,
       e.ename,
       e.job,
       e.hiredate
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- RIGHT JOIN - 7
-- Display department name and
-- total employees.
-- =====================================================

SELECT d.dname,
       COUNT(e.empno) AS total_employees
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno = d.deptno
GROUP BY d.dname;

-- =====================================================
-- RIGHT JOIN - 8
-- Display department name,
-- employee name and salary
-- where salary >3000,
-- including departments without employees.
-- =====================================================

SELECT d.dname,
       e.ename,
       e.sal
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno = d.deptno
WHERE e.sal > 3000
OR e.empno IS NULL;

-- =====================================================
-- RIGHT JOIN - 9
-- Display all department details
-- and employee information.
-- =====================================================

SELECT *
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno = d.deptno;

-- =====================================================
-- RIGHT JOIN - 10
-- Display every department
-- whether or not employees work there.
-- =====================================================

SELECT *
FROM dept_classic_new d
LEFT JOIN emp_classic_new e
ON d.deptno = e.deptno;

-- =====================================================
-- FULL OUTER JOIN - 1
-- Display all employees and all departments,
-- including unmatched records.
-- =====================================================

SELECT *
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno=d.deptno

UNION

SELECT *
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno=d.deptno;

-- =====================================================
-- FULL OUTER JOIN - 2
-- Employee name and department name.
-- =====================================================

SELECT e.ename,d.dname
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno=d.deptno

UNION

SELECT e.ename,d.dname
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno=d.deptno;

-- =====================================================
-- FULL OUTER JOIN - 3
-- Employee name, job, department name and location.
-- =====================================================

SELECT e.ename,e.job,d.dname,d.loc
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno=d.deptno

UNION

SELECT e.ename,e.job,d.dname,d.loc
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno=d.deptno;

-- =====================================================
-- FULL OUTER JOIN - 4
-- All employee details and department details.
-- =====================================================

SELECT *
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno=d.deptno

UNION

SELECT *
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno=d.deptno;

-- =====================================================
-- FULL OUTER JOIN - 5
-- Department names and employee names.
-- =====================================================

SELECT d.dname,e.ename
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno=d.deptno

UNION

SELECT d.dname,e.ename
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno=d.deptno;

-- =====================================================
-- FULL OUTER JOIN - 6
-- Employee name, salary,
-- department name and location.
-- =====================================================

SELECT e.ename,e.sal,d.dname,d.loc
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno=d.deptno

UNION

SELECT e.ename,e.sal,d.dname,d.loc
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno=d.deptno;

-- =====================================================
-- FULL OUTER JOIN - 7
-- Department number and employee number.
-- =====================================================

SELECT d.deptno,e.empno
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno=d.deptno

UNION

SELECT d.deptno,e.empno
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno=d.deptno;

-- =====================================================
-- FULL OUTER JOIN - 8
-- Display every employee and every department.
-- =====================================================

SELECT *
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno=d.deptno

UNION

SELECT *
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno=d.deptno;

-- =====================================================
-- FULL OUTER JOIN - 9
-- Employee name,
-- department name and location.
-- =====================================================

SELECT e.ename,d.dname,d.loc
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno=d.deptno

UNION

SELECT e.ename,d.dname,d.loc
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno=d.deptno;

-- =====================================================
-- FULL OUTER JOIN - 10
-- Display every record from both tables.
-- =====================================================

SELECT *
FROM emp_classic_new e
LEFT JOIN dept_classic_new d
ON e.deptno=d.deptno

UNION

SELECT *
FROM emp_classic_new e
RIGHT JOIN dept_classic_new d
ON e.deptno=d.deptno;

-- =====================================================
-- SELF JOIN - 1
-- Employee name along with Manager name.
-- =====================================================

SELECT e.ename AS Employee_Name,
       m.ename AS Manager_Name
FROM emp_classic_new e
LEFT JOIN emp_classic_new m
ON e.mgr=m.empno;

-- =====================================================
-- SELF JOIN - 2
-- Employee name, Manager name and Manager salary
-- if employee salary >1300.
-- =====================================================

SELECT e.ename,
       m.ename,
       m.sal
FROM emp_classic_new e
JOIN emp_classic_new m
ON e.mgr=m.empno
WHERE e.sal>1300;

-- =====================================================
-- SELF JOIN - 3
-- Employee details along with Manager salary
-- if employee earns more than manager.
-- =====================================================

SELECT e.*,
       m.sal AS Manager_Salary
FROM emp_classic_new e
JOIN emp_classic_new m
ON e.mgr=m.empno
WHERE e.sal>m.sal;

-- =====================================================
-- SELF JOIN - 4
-- Number of employees reporting
-- to each manager.
-- =====================================================

SELECT m.ename AS Manager_Name,
COUNT(e.empno) AS Total_Employees
FROM emp_classic_new m
LEFT JOIN emp_classic_new e
ON m.empno=e.mgr
GROUP BY m.empno,m.ename;

-- =====================================================
-- SELF JOIN - 5
-- Employee name, Manager name,
-- Employee salary and Manager salary
-- if employee earns more than manager.
-- =====================================================

SELECT e.ename AS Employee_Name,
       m.ename AS Manager_Name,
       e.sal AS Employee_Salary,
       m.sal AS Manager_Salary
FROM emp_classic_new e
JOIN emp_classic_new m
ON e.mgr=m.empno
WHERE e.sal>m.sal;


-- =====================================================
-- INNER JOIN - 1
-- Display customer details along with order details.
-- =====================================================

SELECT c.*, o.*
FROM customers_new c
INNER JOIN orders_new o
ON c.customer_id=o.customer_id;

-- =====================================================
-- INNER JOIN - 2
-- Display customer name and product name.
-- =====================================================

SELECT c.customer_name,
       p.product_name
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id;

-- =====================================================
-- INNER JOIN - 3
-- Display customer name, city and order amount.
-- =====================================================

SELECT c.customer_name,
       c.city,
       o.amount
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id;

-- =====================================================
-- INNER JOIN - 4
-- Display customer name, product name and quantity.
-- =====================================================

SELECT c.customer_name,
       p.product_name,
       o.quantity
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id;

-- =====================================================
-- INNER JOIN - 5
-- Display customer name, category and product price.
-- =====================================================

SELECT c.customer_name,
       p.category,
       p.price
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id;

-- =====================================================
-- INNER JOIN - 6
-- Customers who purchased Electronics products.
-- =====================================================

SELECT DISTINCT c.customer_name
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id
WHERE p.category='Electronics';

-- =====================================================
-- INNER JOIN - 7
-- Hyderabad customers and purchased products.
-- =====================================================

SELECT c.customer_name,
       p.product_name
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id
WHERE c.city='Hyderabad';

-- =====================================================
-- INNER JOIN - 8
-- Orders placed after 2025-04-01.
-- =====================================================

SELECT c.customer_name,
       o.order_date
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
WHERE o.order_date>'2025-04-01';

-- =====================================================
-- INNER JOIN - 9
-- Product name, category and quantity.
-- =====================================================

SELECT p.product_name,
       p.category,
       o.quantity
FROM orders_new o
JOIN products_new p
ON o.product_id=p.product_id;

-- =====================================================
-- INNER JOIN - 10
-- Amount greater than 10000.
-- =====================================================

SELECT c.customer_name,
       p.product_name,
       o.amount
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id
WHERE o.amount>10000;

-- =====================================================
-- INNER JOIN - 11
-- Quantity greater than 1.
-- =====================================================

SELECT c.customer_name,
       p.product_name
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id
WHERE o.quantity>1;

-- =====================================================
-- INNER JOIN - 12
-- Female customers.
-- =====================================================

SELECT c.customer_name,
       p.product_name,
       c.city
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id
WHERE c.gender='Female';

-- =====================================================
-- INNER JOIN - 13
-- Fashion products.
-- =====================================================

SELECT c.customer_name,
       p.product_name
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id
WHERE p.category='Fashion';

-- =====================================================
-- INNER JOIN - 14
-- Price greater than 5000.
-- =====================================================

SELECT c.customer_name,
       p.product_name,
       p.price
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id
WHERE p.price>5000;

-- =====================================================
-- INNER JOIN - 15
-- Orders placed in June 2025.
-- =====================================================

SELECT c.customer_name,
       p.product_name,
       o.order_date
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id
WHERE MONTH(o.order_date)=6
AND YEAR(o.order_date)=2025;

-- =====================================================
-- INNER JOIN - 16
-- Number of orders by each customer.
-- =====================================================

SELECT c.customer_name,
COUNT(*) total_orders
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name;

-- =====================================================
-- INNER JOIN - 17
-- Total amount spent.
-- =====================================================

SELECT c.customer_name,
SUM(o.amount) total_amount
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name;

-- =====================================================
-- INNER JOIN - 18
-- Number of customers for each product.
-- =====================================================

SELECT p.product_name,
COUNT(DISTINCT c.customer_id) total_customers
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id
GROUP BY p.product_name;

-- =====================================================
-- INNER JOIN - 19
-- Total quantity sold.
-- =====================================================

SELECT p.product_name,
SUM(o.quantity) total_quantity
FROM orders_new o
JOIN products_new p
ON o.product_id=p.product_id
GROUP BY p.product_name;

-- =====================================================
-- INNER JOIN - 20
-- Ordered by customer name.
-- =====================================================

SELECT c.customer_name,
       p.product_name
FROM customers_new c
JOIN orders_new o
ON c.customer_id=o.customer_id
JOIN products_new p
ON o.product_id=p.product_id
ORDER BY c.customer_name;

-- =====================================================
-- NATURAL JOIN - 1
-- Customer details and order details.
-- =====================================================

SELECT *
FROM customers_new
NATURAL JOIN orders_new;

-- =====================================================
-- NATURAL JOIN - 2
-- Customer name and amount.
-- =====================================================

SELECT customer_name,
       amount
FROM customers_new
NATURAL JOIN orders_new;

-- =====================================================
-- NATURAL JOIN - 3
-- Customer name and order date.
-- =====================================================

SELECT customer_name,
       order_date
FROM customers_new
NATURAL JOIN orders_new;

-- =====================================================
-- NATURAL JOIN - 4
-- Customer name and product name.
-- =====================================================

SELECT customer_name,
       product_name
FROM customers_new
NATURAL JOIN orders_new
NATURAL JOIN products_new;

-- =====================================================
-- NATURAL JOIN - 5
-- Customer name, category and price.
-- =====================================================

SELECT customer_name,
       category,
       price
FROM customers_new
NATURAL JOIN orders_new
NATURAL JOIN products_new;

-- =====================================================
-- NATURAL JOIN - 6
-- Customer name and product name for Chennai customers.
-- =====================================================

SELECT customer_name, product_name
FROM customers_new
NATURAL JOIN orders_new
NATURAL JOIN products_new
WHERE city='Chennai';

-- =====================================================
-- NATURAL JOIN - 7
-- Female customers and product names.
-- =====================================================

SELECT customer_name, product_name
FROM customers_new
NATURAL JOIN orders_new
NATURAL JOIN products_new
WHERE gender='Female';

-- =====================================================
-- NATURAL JOIN - 8
-- Accessories products.
-- =====================================================

SELECT customer_name, product_name
FROM customers_new
NATURAL JOIN orders_new
NATURAL JOIN products_new
WHERE category='Accessories';

-- =====================================================
-- NATURAL JOIN - 9
-- Quantity greater than 2.
-- =====================================================

SELECT customer_name, product_name
FROM customers_new
NATURAL JOIN orders_new
NATURAL JOIN products_new
WHERE quantity>2;

-- =====================================================
-- NATURAL JOIN - 10
-- Orders after 2025-05-01.
-- =====================================================

SELECT customer_name,
       product_name
FROM customers_new
NATURAL JOIN orders_new
NATURAL JOIN products_new
WHERE order_date>'2025-05-01';

-- =====================================================
-- NATURAL JOIN - 11
-- Customer name and total orders.
-- =====================================================

SELECT customer_name,
COUNT(*) total_orders
FROM customers_new
NATURAL JOIN orders_new
GROUP BY customer_name;

-- =====================================================
-- NATURAL JOIN - 12
-- Product name and total quantity sold.
-- =====================================================

SELECT product_name,
SUM(quantity) total_quantity
FROM orders_new
NATURAL JOIN products_new
GROUP BY product_name;

-- =====================================================
-- NATURAL JOIN - 13
-- Customer name and total amount spent.
-- =====================================================

SELECT customer_name,
SUM(amount) total_amount
FROM customers_new
NATURAL JOIN orders_new
GROUP BY customer_name;

-- =====================================================
-- NATURAL JOIN - 14
-- Product category and total products ordered.
-- =====================================================

SELECT category,
COUNT(*) total_orders
FROM orders_new
NATURAL JOIN products_new
GROUP BY category;

-- =====================================================
-- NATURAL JOIN - 15
-- Customer name, city and product name.
-- =====================================================

SELECT customer_name,
       city,
       product_name
FROM customers_new
NATURAL JOIN orders_new
NATURAL JOIN products_new;

-- =====================================================
-- CROSS JOIN - 1
-- Every customer with every product.
-- =====================================================

SELECT customer_name,
       product_name
FROM customers_new
CROSS JOIN products_new;

-- =====================================================
-- CROSS JOIN - 2
-- Every customer with every category.
-- =====================================================

SELECT customer_name,
       category
FROM customers_new
CROSS JOIN products_new;

-- =====================================================
-- CROSS JOIN - 3
-- Customer name and every product price.
-- =====================================================

SELECT customer_name,
       price
FROM customers_new
CROSS JOIN products_new;

-- =====================================================
-- CROSS JOIN - 4
-- Customer details with product details.
-- =====================================================

SELECT *
FROM customers_new
CROSS JOIN products_new;

-- =====================================================
-- CROSS JOIN - 5
-- Customer city and every product.
-- =====================================================

SELECT city,
       product_name
FROM customers_new
CROSS JOIN products_new;

-- =====================================================
-- CROSS JOIN - 6
-- Female customers with every product.
-- =====================================================

SELECT customer_name,
       product_name
FROM customers_new
CROSS JOIN products_new
WHERE gender='Female';

-- =====================================================
-- CROSS JOIN - 7
-- Male customers with every Electronics product.
-- =====================================================

SELECT customer_name,
       product_name
FROM customers_new
CROSS JOIN products_new
WHERE gender='Male'
AND category='Electronics';

-- =====================================================
-- CROSS JOIN - 8
-- Customer name and every Fashion product.
-- =====================================================

SELECT customer_name,
       product_name
FROM customers_new
CROSS JOIN products_new
WHERE category='Fashion';

-- =====================================================
-- CROSS JOIN - 9
-- Customer name and every product
-- costing more than 5000.
-- =====================================================

SELECT customer_name,
       product_name
FROM customers_new
CROSS JOIN products_new
WHERE price>5000;

-- =====================================================
-- CROSS JOIN - 10
-- Customer name and every Accessories product.
-- =====================================================

SELECT customer_name,
       product_name
FROM customers_new
CROSS JOIN products_new
WHERE category='Accessories';




