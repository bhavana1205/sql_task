-- =====================================================
-- Drop Table if it already exists
-- =====================================================

DROP TABLE IF EXISTS emp_aggregate_new;

-- =====================================================
-- Create Employee Table
-- =====================================================

CREATE TABLE emp_aggregate_new (
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
-- Insert Employee Records
-- =====================================================

INSERT INTO emp_aggregate_new VALUES
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

SELECT * FROM emp_aggregate_new;


-- =====================================================
-- 1. WAQTD minimum salary given to employees.
-- =====================================================

SELECT MIN(sal) AS Minimum_Salary
FROM emp_classic_new;

-- =====================================================
-- 2. WAQTD maximum salary given to employees.
-- =====================================================

SELECT MAX(sal) AS Maximum_Salary
FROM emp_classic_new;

-- =====================================================
-- 3. WAQTD total salary needed to pay all employees.
-- =====================================================

SELECT SUM(sal) AS Total_Salary
FROM emp_classic_new;

-- =====================================================
-- 4. WAQTD average salary needed to pay all employees.
-- =====================================================

SELECT AVG(sal) AS Average_Salary
FROM emp_classic_new;

-- =====================================================
-- 5. WAQTD total number of employees present.
-- =====================================================

SELECT COUNT(*) AS Total_Employees
FROM emp_classic_new;

-- =====================================================
-- 6. WAQTD number of employees earning salary and commission.
-- =====================================================

SELECT COUNT(*) AS Employees_With_Commission
FROM emp_classic_new
WHERE comm IS NOT NULL;

-- =====================================================
-- 7. WAQTD total number of employees working in department 10.
-- =====================================================

SELECT COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE deptno=10;

-- =====================================================
-- 8. WAQTD maximum salary given to employees in department 30.
-- =====================================================

SELECT MAX(sal) AS Maximum_Salary
FROM emp_classic_new
WHERE deptno=30;

-- =====================================================
-- 9. WAQTD number of distinct jobs present.
-- =====================================================

SELECT COUNT(DISTINCT job) AS Total_Jobs
FROM emp_classic_new;

-- =====================================================
-- 10. WAQTD number of employees whose name contains 'A'.
-- =====================================================

SELECT COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE ename LIKE '%A%';

-- =====================================================
-- 11. WAQTD number of employees whose first character is 'A'.
-- =====================================================

SELECT COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE ename LIKE 'A%';

-- =====================================================
-- 12. WAQTD number of employees having 'A' in their names.
-- =====================================================

SELECT COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE ename LIKE '%A%';

-- =====================================================
-- 13. WAQTD number of employees having character 'Z'.
-- =====================================================

SELECT COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE ename LIKE '%Z%';

-- =====================================================
-- 14. WAQTD number of employees having 'S' in their names.
-- =====================================================

SELECT COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE ename LIKE '%S%';

-- =====================================================
-- 15. WAQTD total salary of employees
-- whose names have consecutive 'LL'.
-- =====================================================

SELECT SUM(sal) AS Total_Salary
FROM emp_classic_new
WHERE ename LIKE '%LL%';

-- =====================================================
-- 16. WAQTD number of employees whose name contains 'A'.
-- =====================================================

SELECT COUNT(*)
FROM emp_classic_new
WHERE ename LIKE '%A%';

-- =====================================================
-- 17. WAQTD number of employees whose first character is 'A'.
-- =====================================================

SELECT COUNT(*)
FROM emp_classic_new
WHERE ename LIKE 'A%';

-- =====================================================
-- 18. WAQTD number of employees having 'A' in their names.
-- =====================================================

SELECT COUNT(*)
FROM emp_classic_new
WHERE ename LIKE '%A%';

-- =====================================================
-- 19. WAQTD number of employees having character 'Z'.
-- =====================================================

SELECT COUNT(*)
FROM emp_classic_new
WHERE ename LIKE '%Z%';

-- =====================================================
-- 20. WAQTD number of employees having 'S' in their names.
-- =====================================================

SELECT COUNT(*)
FROM emp_classic_new
WHERE ename LIKE '%S%';

-- =====================================================
-- 21. WAQTD total salary of employees
-- whose names have consecutive 'LL'.
-- =====================================================

SELECT SUM(sal)
FROM emp_classic_new
WHERE ename LIKE '%LL%';

-- =====================================================
-- 22. WAQTD maximum salary, minimum salary and
-- number of employees in departments 10 & 30
-- satisfying given conditions.
-- =====================================================

SELECT
MAX(sal) AS Maximum_Salary,
MIN(sal) AS Minimum_Salary,
COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE deptno IN(10,30)
AND (job LIKE '%E%' OR job LIKE '%A%')
AND (ename LIKE '%A%' OR ename LIKE '%O%')
AND YEAR(hiredate) IN(1981,1982)
AND sal BETWEEN 1000 AND 9999;

-- =====================================================
-- 23. WAQTD number of employees in department 30
-- satisfying given conditions.
-- =====================================================

SELECT COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE deptno=30
AND job LIKE '%E%'
AND YEAR(hiredate)=1981
AND sal BETWEEN 901 AND 2999;

-- =====================================================
-- 24. WAQTD total salary needed to pay
-- employees hired in February.
-- =====================================================

SELECT SUM(sal) AS Total_Salary
FROM emp_classic_new
WHERE MONTH(hiredate)=2;

-- =====================================================
-- 25. WAQTD total employees whose designation
-- contains 'C' and hired in 1981.
-- =====================================================

SELECT COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE job LIKE '%C%'
AND YEAR(hiredate)=1981;

-- =====================================================
-- 26. WAQTD total employees working
-- in departments 10,20 and 30.
-- =====================================================

SELECT COUNT(*) AS Total_Employees
FROM emp_classic_new
WHERE deptno IN(10,20,30);

-- =====================================================
-- 27. WAQTD number of employees
-- working in each department.
-- =====================================================

SELECT deptno,
COUNT(*) AS Total_Employees
FROM emp_classic_new
GROUP BY deptno;

-- =====================================================
-- 28. WAQTD maximum salary
-- of ANALYST.
-- =====================================================

SELECT MAX(sal) AS Maximum_Salary
FROM emp_classic_new
WHERE job='ANALYST';

-- =====================================================
-- 29. WAQTD total salary of CLERKS
-- in department 30.
-- =====================================================

SELECT SUM(sal) AS Total_Salary
FROM emp_classic_new
WHERE job='CLERK'
AND deptno=30;

-- =====================================================
-- 30. WAQTD average salary
-- of CLERKS.
-- =====================================================

SELECT AVG(sal) AS Average_Salary
FROM emp_classic_new
WHERE job='CLERK';

-- =====================================================
-- 31. WAQTD minimum salary given to
-- Managers or Clerks working in department 10.
-- =====================================================

SELECT MIN(sal) AS Minimum_Salary
FROM emp_classic_new
WHERE deptno=10
AND job IN('MANAGER','CLERK');