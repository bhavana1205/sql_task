-- =====================================================
-- Drop Tables (if already exist)
-- =====================================================

DROP TABLE IF EXISTS emp_classic_new;
DROP TABLE IF EXISTS dept_classic_new;

-- =====================================================
-- Create Department Table
-- =====================================================

CREATE TABLE dept_classic_new (
    deptno INT PRIMARY KEY,
    dname VARCHAR(30),
    loc VARCHAR(30)
);

-- =====================================================
-- Insert Department Records
-- =====================================================

INSERT INTO dept_classic_new VALUES
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');

-- =====================================================
-- Create Employee Table
-- =====================================================

CREATE TABLE emp_classic_new (
    empno INT PRIMARY KEY,
    ename VARCHAR(30),
    job VARCHAR(30),
    mgr INT,
    hiredate DATE,
    sal DECIMAL(10,2),
    comm DECIMAL(10,2),
    deptno INT,
    FOREIGN KEY (deptno) REFERENCES dept_classic_new(deptno)
);

-- =====================================================
-- Insert Employee Records
-- =====================================================

INSERT INTO emp_classic_new VALUES
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
-- Verify the Data
-- =====================================================

SELECT * FROM dept_classic_new;

SELECT * FROM emp_classic_new;


-- =====================================================
-- GROUP BY - 1
-- WAQTD number of employees present in the Employee table.
-- =====================================================

SELECT COUNT(*) AS Total_Employees
FROM emp_classic_new;

-- =====================================================
-- GROUP BY - 2
-- WAQTD number of employees working in each department.
-- =====================================================

SELECT deptno,
COUNT(*) AS Total_Employees
FROM emp_classic_new
GROUP BY deptno;

-- =====================================================
-- GROUP BY - 3
-- WAQTD number of employees along with total salary
-- needed to pay each department.
-- =====================================================

SELECT deptno,
COUNT(*) AS Total_Employees,
SUM(sal) AS Total_Salary
FROM emp_classic_new
GROUP BY deptno;

-- =====================================================
-- GROUP BY - 4
-- WAQTD total number of employees working in each
-- department whose names contain 'A'.
-- =====================================================

SELECT deptno,
COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE ename LIKE '%A%'
GROUP BY deptno;

-- =====================================================
-- GROUP BY - 5
-- WAQTD maximum salary, minimum salary and
-- department number.
-- =====================================================

SELECT deptno,
MAX(sal) AS Maximum_Salary,
MIN(sal) AS Minimum_Salary
FROM emp_classic_new
GROUP BY deptno;

-- =====================================================
-- GROUP BY - 6
-- WAQTD employees hired after 31-Dec-1980,
-- before 01-Jan-1987 and salary between
-- 1000 and 5000.
-- =====================================================

SELECT deptno,
COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE hiredate>'1980-12-31'
AND hiredate<'1987-01-01'
AND sal BETWEEN 1000 AND 5000
GROUP BY deptno;

-- =====================================================
-- GROUP BY - 7
-- WAQTD total salary needed to pay employees
-- of each job.
-- =====================================================

SELECT job,
SUM(sal) AS Total_Salary
FROM emp_classic_new
GROUP BY job;

-- =====================================================
-- GROUP BY - 8
-- WAQTD salaries along with the number of
-- times each salary appears.
-- =====================================================

SELECT sal,
COUNT(*) AS Frequency
FROM emp_classic_new
GROUP BY sal;

-- =====================================================
-- GROUP BY - 9
-- WAQTD number of employees working in each
-- department if at least 4 employees work.
-- =====================================================

SELECT deptno,
COUNT(*) AS Total_Employees
FROM emp_classic_new
GROUP BY deptno
HAVING COUNT(*)>=4;

-- =====================================================
-- HAVING - 1
-- WAQTD department number and number of clerks
-- if at least 2 clerks work.
-- =====================================================

SELECT deptno,
COUNT(*) AS Total_Clerks
FROM emp_classic_new
WHERE job='CLERK'
GROUP BY deptno
HAVING COUNT(*)>=2;

-- =====================================================
-- HAVING - 2
-- WAQTD department number and total salary
-- if at least 4 employees work.
-- =====================================================

SELECT deptno,
SUM(sal) AS Total_Salary
FROM emp_classic_new
GROUP BY deptno
HAVING COUNT(*)>=4;

-- =====================================================
-- HAVING - 3
-- WAQTD employees earning more than 1200
-- in each job where total salary >3800.
-- =====================================================

SELECT job,
COUNT(*) AS Total_Employees,
SUM(sal) AS Total_Salary
FROM emp_classic_new
WHERE sal>1200
GROUP BY job
HAVING SUM(sal)>3800;

-- =====================================================
-- HAVING - 4
-- WAQTD department number and managers
-- if exactly 2 managers.
-- =====================================================

SELECT deptno,
COUNT(*) AS Total_Managers
FROM emp_classic_new
WHERE job='MANAGER'
GROUP BY deptno
HAVING COUNT(*)=2;

-- =====================================================
-- HAVING - 5
-- WAQTD job and maximum salary if maximum salary >2600.
-- =====================================================

SELECT job,
MAX(sal) AS Maximum_Salary
FROM emp_classic_new
GROUP BY job
HAVING MAX(sal)>2600;

-- =====================================================
-- HAVING - 6
-- WAQTD repeated salaries.
-- =====================================================

SELECT sal,
COUNT(*) AS Frequency
FROM emp_classic_new
GROUP BY sal
HAVING COUNT(*)>1;

-- =====================================================
-- HAVING - 7
-- WAQTD duplicated hire dates.
-- =====================================================

SELECT hiredate,
COUNT(*) AS Frequency
FROM emp_classic_new
GROUP BY hiredate
HAVING COUNT(*)>1;

-- =====================================================
-- HAVING - 8
-- WAQTD average salary less than 3000.
-- =====================================================

SELECT deptno,
AVG(sal) AS Average_Salary
FROM emp_classic_new
GROUP BY deptno
HAVING AVG(sal)<3000;

-- =====================================================
-- HAVING - 9
-- WAQTD departments having at least
-- 3 employees with A or S.
-- =====================================================

SELECT deptno,
COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE ename LIKE '%A%'
OR ename LIKE '%S%'
GROUP BY deptno
HAVING COUNT(*)>=3;

-- =====================================================
-- HAVING - 10
-- WAQTD minimum and maximum salary
-- if min>1000 and max<5000.
-- =====================================================

SELECT job,
MIN(sal) AS Minimum_Salary,
MAX(sal) AS Maximum_Salary
FROM emp_classic_new
GROUP BY job
HAVING MIN(sal)>1000
AND MAX(sal)<5000;

-- =====================================================
-- ORDER BY - 1
-- WAQTD employee details by salary ascending.
-- =====================================================

SELECT *
FROM emp_classic_new
ORDER BY sal ASC;

-- =====================================================
-- ORDER BY - 2
-- WAQTD employee details by salary descending.
-- =====================================================

SELECT *
FROM emp_classic_new
ORDER BY sal DESC;

-- =====================================================
-- ORDER BY - 3
-- WAQTD employee count in each department
-- having A or E ordered by count.
-- =====================================================

SELECT deptno,
COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE ename LIKE '%A%'
OR ename LIKE '%E%'
GROUP BY deptno
ORDER BY Total_Employees ASC;

-- =====================================================
-- ORDER BY - 4
-- WAQTD employee details ordered by
-- department ascending and salary descending.
-- =====================================================

SELECT *
FROM emp_classic_new
ORDER BY deptno ASC,sal DESC;

-- =====================================================
-- ASSIGNMENT - 1
-- Employees in each department except PRESIDENT.
-- =====================================================

SELECT deptno,
COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE job<>'PRESIDENT'
GROUP BY deptno;

-- =====================================================
-- ASSIGNMENT - 2
-- Total salary of each job.
-- =====================================================

SELECT job,
SUM(sal) AS Total_Salary
FROM emp_classic_new
GROUP BY job;

-- =====================================================
-- ASSIGNMENT - 3
-- Managers in each department.
-- =====================================================

SELECT deptno,
COUNT(*) AS Total_Managers
FROM emp_classic_new
WHERE job='MANAGER'
GROUP BY deptno;

-- =====================================================
-- ASSIGNMENT - 4
-- Average salary excluding department 20.
-- =====================================================

SELECT deptno,
AVG(sal) AS Average_Salary
FROM emp_classic_new
WHERE deptno<>20
GROUP BY deptno;

-- =====================================================
-- ASSIGNMENT - 5
-- Employees having A in each job.
-- =====================================================

SELECT job,
COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE ename LIKE '%A%'
GROUP BY job;

-- =====================================================
-- ASSIGNMENT - 6
-- Employees and average salary
-- where salary>2000.
-- =====================================================

SELECT deptno,
COUNT(*) AS Total_Employees,
AVG(sal) AS Average_Salary
FROM emp_classic_new
WHERE sal>2000
GROUP BY deptno;

-- =====================================================
-- ASSIGNMENT - 7
-- Total salary and number of Salesmen.
-- =====================================================

SELECT deptno,
COUNT(*) AS Total_Salesmen,
SUM(sal) AS Total_Salary
FROM emp_classic_new
WHERE job='SALESMAN'
GROUP BY deptno;

-- =====================================================
-- ASSIGNMENT - 8
-- Employees and maximum salary.
-- =====================================================

SELECT job,
COUNT(*) AS Total_Employees,
MAX(sal) AS Maximum_Salary
FROM emp_classic_new
GROUP BY job;

-- =====================================================
-- ASSIGNMENT - 9
-- Maximum salary in each department.
-- =====================================================

SELECT deptno,
MAX(sal) AS Maximum_Salary
FROM emp_classic_new
GROUP BY deptno;

-- =====================================================
-- ASSIGNMENT - 10
-- Number of times salaries appear.
-- =====================================================

SELECT sal,
COUNT(*) AS Frequency
FROM emp_classic_new
GROUP BY sal;