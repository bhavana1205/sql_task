-- =====================================================
-- Drop Table if it already exists
-- =====================================================

DROP TABLE IF EXISTS emp_logical_new;

-- =====================================================
-- Create Employee Table
-- =====================================================

CREATE TABLE emp_logical_new (
    empno INT PRIMARY KEY,
    ename VARCHAR(30),
    job VARCHAR(30),
    mgr INT,
    hiredate DATE,
    sal DECIMAL(10,2),
    comm DECIMAL(10,2),
    deptno INT
);

-- =====================================================
-- Insert Records
-- =====================================================

INSERT INTO emp_logical_new VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10),
(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,NULL,20),
(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,NULL,20),
(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);

-- =====================================================
-- Verify Data
-- =====================================================

SELECT * FROM emp_logical_new;


-- =====================================================
-- AND OPERATOR - 1
-- WAQTD details of employees earning salary
-- more than 300 in department 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > 300
AND deptno = 20;

-- =====================================================
-- AND OPERATOR - 2
-- WAQTD names and salaries of employees
-- earning more than 1200 and hired before 1982.
-- =====================================================

SELECT ename,sal
FROM emp_classic_new
WHERE sal > 1200
AND hiredate < '1982-01-01';

-- =====================================================
-- AND OPERATOR - 3
-- WAQTD employees earning more than 1000
-- in department 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > 1000
AND deptno = 20;

-- =====================================================
-- AND OPERATOR - 4
-- WAQTD employees hired after March 1981,
-- salary >1100 and department 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE hiredate > '1981-03-31'
AND sal > 1100
AND deptno = 20;

-- =====================================================
-- AND OPERATOR - 5
-- WAQTD employees earning between
-- 1000 and 2200.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > 1000
AND sal < 2200;

-- =====================================================
-- AND OPERATOR - 6
-- WAQTD employee names hired after 1980,
-- before 1982 and department 10.
-- =====================================================

SELECT ename
FROM emp_classic_new
WHERE hiredate > '1980-12-31'
AND hiredate < '1982-01-01'
AND deptno = 10;

-- =====================================================
-- OR OPERATOR - 1
-- WAQTD employees working in
-- department 10 or 30.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno = 10
OR deptno = 30;

-- =====================================================
-- OR OPERATOR - 2
-- WAQTD employee names and department numbers
-- working as SALESMAN or ANALYST.
-- =====================================================

SELECT ename,deptno
FROM emp_classic_new
WHERE job='SALESMAN'
OR job='ANALYST';

-- =====================================================
-- OR OPERATOR - 3
-- WAQTD employees earning more than 2000
-- or working in department 30.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > 2000
OR deptno = 30;

-- =====================================================
-- NOT OPERATOR - 1
-- WAQTD employees not working
-- in department 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE NOT deptno = 20;

-- =====================================================
-- NOT OPERATOR - 2
-- WAQTD employees not working as
-- MANAGER in department 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE NOT job='MANAGER'
AND deptno=20;

-- =====================================================
-- NOT OPERATOR - 3
-- WAQTD employee name, job and department
-- working as CLERK in department 20 or 30.
-- =====================================================

SELECT ename,job,deptno
FROM emp_classic_new
WHERE job='CLERK'
AND (deptno=20 OR deptno=30);

-- =====================================================
-- NOT OPERATOR - 4
-- WAQTD employees working as CLERK or MANAGER
-- in department 10 or 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE (job='CLERK' OR job='MANAGER')
AND (deptno=10 OR deptno=20);

-- =====================================================
-- NOT OPERATOR - 5
-- WAQTD employees working as MANAGER,
-- ANALYST or SALESMAN in departments
-- 10,20,30 hired after 1980 before 1988.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE job IN('MANAGER','ANALYST','SALESMAN')
AND deptno IN(10,20,30)
AND hiredate>'1980-12-31'
AND hiredate<'1988-01-01';

-- =====================================================
-- NOT OPERATOR - 6
-- WAQTD employees working as
-- CLERK, MANAGER, SALESMAN,
-- PRESIDENT or ANALYST.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE job IN
('CLERK','MANAGER','SALESMAN','PRESIDENT','ANALYST');

-- =====================================================
-- NOT OPERATOR - 7
-- WAQTD employees working in
-- departments 10,20,30 and 40.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno IN(10,20,30,40);



-- =====================================================
-- IN OPERATOR - 1
-- WAQTD details of employees working in
-- Departments 10,20,30 and 40.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE deptno IN (10,20,30,40);

-- =====================================================
-- IN OPERATOR - 2
-- WAQTD names of employees hired after 1980
-- in Department 10 or 20.
-- =====================================================

SELECT ename
FROM emp_logical_new
WHERE hiredate > '1980-12-31'
AND deptno IN (10,20);

-- =====================================================
-- IN OPERATOR - 3
-- WAQTD details of employees working as
-- ANALYST or PRESIDENT in Department 10 or 20.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE job IN ('ANALYST','PRESIDENT')
AND deptno IN (10,20);

-- =====================================================
-- IN OPERATOR - 4
-- WAQTD employees in departments 10,20,30
-- earning salary 3000,2450,1300,1500 or 1600.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE deptno IN (10,20,30)
AND sal IN (3000,2450,1300,1500,1600);

-- =====================================================
-- NOT IN OPERATOR - 1
-- WAQTD employees not working as
-- Manager or Clerk in Departments 10 and 20.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE job NOT IN ('MANAGER','CLERK')
AND deptno IN (10,20);

-- =====================================================
-- NOT IN OPERATOR - 2
-- WAQTD names of employees hired after 1980
-- and not in Department 10 or 20.
-- =====================================================

SELECT ename
FROM emp_logical_new
WHERE hiredate > '1980-12-31'
AND deptno NOT IN (10,20);

-- =====================================================
-- BETWEEN OPERATOR - 1
-- WAQTD employees earning salary
-- between 1000 and 3000.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE sal BETWEEN 1000 AND 3000;

-- =====================================================
-- BETWEEN OPERATOR - 2
-- WAQTD employees hired between
-- 1981 and 1986.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE hiredate BETWEEN '1981-01-01' AND '1986-12-31';

-- =====================================================
-- BETWEEN OPERATOR - 3
-- WAQTD employee name and salary
-- between 1000 and 3000.
-- =====================================================

SELECT ename,sal
FROM emp_logical_new
WHERE sal BETWEEN 1000 AND 3000;

-- =====================================================
-- BETWEEN OPERATOR - 4
-- WAQTD employees hired between
-- 1982 and 1987.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE hiredate BETWEEN '1982-01-01' AND '1987-12-31';

-- =====================================================
-- BETWEEN OPERATOR - 5
-- WAQTD employees hired between
-- 1982 and 1986 and salary
-- between 1300 and 3000.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE hiredate BETWEEN '1982-01-01' AND '1986-12-31'
AND sal BETWEEN 1300 AND 3000;

-- =====================================================
-- NOT BETWEEN OPERATOR - 1
-- WAQTD employees not earning salary
-- between 1000 and 3000.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE sal NOT BETWEEN 1000 AND 3000;

-- =====================================================
-- NOT BETWEEN OPERATOR - 2
-- WAQTD employees hired between
-- 1981 and 1987,
-- not earning salary between
-- 2300 and 5000,
-- working as Salesman, Analyst,
-- Clerk or Manager,
-- in departments 10,20,30.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE hiredate BETWEEN '1981-01-01' AND '1987-12-31'
AND sal NOT BETWEEN 2300 AND 5000
AND job IN ('SALESMAN','ANALYST','CLERK','MANAGER')
AND deptno IN (10,20,30);


-- =====================================================
-- IS NULL - 1
-- WAQTD details of employees who are not earning commission.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE comm IS NULL;

-- =====================================================
-- IS NULL - 2
-- WAQTD details of employees who are not having a Manager.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE mgr IS NULL;

-- =====================================================
-- IS NOT NULL - 3
-- WAQTD names of employees who are earning commission.
-- =====================================================

SELECT ename
FROM emp_logical_new
WHERE comm IS NOT NULL;

-- =====================================================
-- LIKE - 1
-- WAQTD details of employees whose second character is 'A'.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE ename LIKE '_A%';

-- =====================================================
-- LIKE - 2
-- WAQTD names and salaries whose second character is 'L'.
-- =====================================================

SELECT ename,sal
FROM emp_logical_new
WHERE ename LIKE '_L%';

-- =====================================================
-- LIKE - 3
-- WAQTD details of employees whose names end with 'S'.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE ename LIKE '%S';

-- =====================================================
-- LIKE - 4
-- WAQTD details of employees whose names contain
-- character 'A' exactly two times.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE LENGTH(ename)-LENGTH(REPLACE(ename,'A',''))=2;

-- =====================================================
-- LIKE - 5
-- WAQTD employees whose second character is 'A'.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE ename LIKE '_A%';

-- =====================================================
-- LIKE - 6
-- WAQTD names of employees whose third character is 'R'.
-- =====================================================

SELECT ename
FROM emp_logical_new
WHERE ename LIKE '__R%';

-- =====================================================
-- LIKE - 7
-- WAQTD employees whose first character is 'S'
-- and second character is 'M'.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE ename LIKE 'SM%';

-- =====================================================
-- LIKE - 8
-- WAQTD names whose last character is 'N'
-- and second last character is 'O'.
-- =====================================================

SELECT ename
FROM emp_logical_new
WHERE ename LIKE '%ON';

-- =====================================================
-- LIKE - 9
-- WAQTD employees whose fourth character is 'T'.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE ename LIKE '___T%';

-- =====================================================
-- LIKE - 10
-- WAQTD employees whose fifth character is 'H'.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE ename LIKE '____H%';

-- =====================================================
-- LIKE - 11
-- WAQTD employees whose names contain 'A'
-- but do not end with 'A'.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE ename LIKE '%A%'
AND ename NOT LIKE '%A';

-- =====================================================
-- LIKE - 12
-- WAQTD employees whose salary has exactly 4 digits.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE sal BETWEEN 1000 AND 9999;

-- =====================================================
-- NOT LIKE - 1
-- WAQTD names of employees whose names
-- do not contain 'A'.
-- =====================================================

SELECT ename
FROM emp_logical_new
WHERE ename NOT LIKE '%A%';

-- =====================================================
-- NOT LIKE - 2
-- WAQTD details of employees whose names
-- contain 'A' or 'E'.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE ename LIKE '%A%'
OR ename LIKE '%E%';

-- =====================================================
-- ASSIGNMENT - 1
-- List all employees whose commission is NULL.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE comm IS NULL;

-- =====================================================
-- ASSIGNMENT - 2
-- List all employees who do not have
-- a reporting manager.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE mgr IS NULL;

-- =====================================================
-- ASSIGNMENT - 3
-- List all Salesmen in Department 30.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE job='SALESMAN'
AND deptno=30;

-- =====================================================
-- ASSIGNMENT - 4
-- List all Salesmen in Department 30
-- having salary greater than 1500.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE job='SALESMAN'
AND deptno=30
AND sal>1500;

-- =====================================================
-- ASSIGNMENT - 5
-- List all employees whose names
-- start with 'S' or 'A'.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE ename LIKE 'S%'
OR ename LIKE 'A%';

-- =====================================================
-- ASSIGNMENT - 6
-- List all employees except those
-- working in Departments 10 and 20.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE deptno NOT IN(10,20);

-- =====================================================
-- ASSIGNMENT - 7
-- List all employees whose names
-- do not start with 'S'.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE ename NOT LIKE 'S%';

-- =====================================================
-- ASSIGNMENT - 8
-- List all employees having reporting
-- managers in Department 10.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE mgr IS NOT NULL
AND deptno=10;

-- =====================================================
-- ASSIGNMENT - 9
-- List all employees whose commission
-- is NULL and working as CLERK.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE comm IS NULL
AND job='CLERK';

-- =====================================================
-- ASSIGNMENT - 10
-- List employees who do not have
-- reporting managers in Department 10 or 30.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE mgr IS NULL
AND deptno IN(10,30);

-- =====================================================
-- ASSIGNMENT - 11
-- List Salesmen in Department 30
-- with salary greater than 2450.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE job='SALESMAN'
AND deptno=30
AND sal>2450;

-- =====================================================
-- ASSIGNMENT - 12
-- List Analysts in Department 20
-- having salary greater than 2500.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE job='ANALYST'
AND deptno=20
AND sal>2500;

-- =====================================================
-- ASSIGNMENT - 13
-- List employees whose names
-- start with 'M' or 'J'.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE ename LIKE 'M%'
OR ename LIKE 'J%';

-- =====================================================
-- ASSIGNMENT - 14
-- List employees along with
-- Annual Salary except Department 30.
-- =====================================================

SELECT empno,
       ename,
       sal,
       sal*12 AS Annual_Salary
FROM emp_logical_new
WHERE deptno<>30;

-- =====================================================
-- ASSIGNMENT - 15
-- List employees whose names
-- do not end with 'ES' or 'R'.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE ename NOT LIKE '%ES'
AND ename NOT LIKE '%R';

-- =====================================================
-- ASSIGNMENT - 16
-- List employees having reporting
-- managers in Department 10
-- along with 10% salary hike.
-- =====================================================

SELECT empno,
       ename,
       sal,
       sal*1.10 AS Hiked_Salary
FROM emp_logical_new
WHERE mgr IS NOT NULL
AND deptno=10;

-- =====================================================
-- ASSIGNMENT - 17
-- Display Salesmen having
-- 'E' as last but one character
-- and salary having exactly 4 digits.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE job='SALESMAN'
AND ename LIKE '%E_'
AND sal BETWEEN 1000 AND 9999;

-- =====================================================
-- ASSIGNMENT - 18
-- Display employees who joined
-- after the year 1981.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE YEAR(hiredate)>1981;

-- =====================================================
-- ASSIGNMENT - 19
-- Display employees who joined
-- in the month of February.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE MONTH(hiredate)=2;

-- =====================================================
-- ASSIGNMENT - 20
-- Display employees who are
-- not Managers or Clerks,
-- belong to Departments 10 or 20,
-- and salary between 1000 and 3000.
-- =====================================================

SELECT *
FROM emp_logical_new
WHERE job NOT IN('MANAGER','CLERK')
AND deptno IN(10,20)
AND sal BETWEEN 1000 AND 3000;



