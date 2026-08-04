-- =====================================================
-- Create Department Table
-- =====================================================

DROP TABLE IF EXISTS emp_classic_new;
DROP TABLE IF EXISTS dept_classic_new;

CREATE TABLE dept_classic_new(
    deptno INT PRIMARY KEY,
    dname VARCHAR(30),
    loc VARCHAR(30)
);

INSERT INTO dept_classic_new VALUES
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');

-- =====================================================
-- Create Employee Table
-- =====================================================

CREATE TABLE emp_classic_new(
    empno INT PRIMARY KEY,
    ename VARCHAR(30),
    job VARCHAR(30),
    mgr INT,
    hiredate DATE,
    sal DECIMAL(10,2),
    comm DECIMAL(10,2),
    deptno INT,
    FOREIGN KEY(deptno) REFERENCES dept_classic_new(deptno)
);

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
-- Verify Data
-- =====================================================

SELECT * FROM dept_classic_new;

SELECT * FROM emp_classic_new;



-- =====================================================
-- 1. Display the employees working in the department
-- located in CHICAGO.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno = (
    SELECT deptno
    FROM dept_classic_new
    WHERE loc = 'CHICAGO'
);

-- =====================================================
-- 2. Display the employees working in the department
-- located in DALLAS.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno = (
    SELECT deptno
    FROM dept_classic_new
    WHERE loc = 'DALLAS'
);

-- =====================================================
-- 3. Display the employees whose salary is greater
-- than BLAKE's salary.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > (
    SELECT sal
    FROM emp_classic_new
    WHERE ename = 'BLAKE'
);

-- =====================================================
-- 4. Display the employees whose salary is less
-- than CLARK's salary.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal < (
    SELECT sal
    FROM emp_classic_new
    WHERE ename = 'CLARK'
);

-- =====================================================
-- 5. Display the employees whose manager is KING.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE mgr = (
    SELECT empno
    FROM emp_classic_new
    WHERE ename = 'KING'
);

-- =====================================================
-- 6. Display the employees earning more than
-- the minimum salary in the company.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > (
    SELECT MIN(sal)
    FROM emp_classic_new
);

-- =====================================================
-- 7. Display the employees earning less than
-- the maximum salary in the company.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal < (
    SELECT MAX(sal)
    FROM emp_classic_new
);

-- =====================================================
-- 8. Display the employees working in departments
-- located in NEW YORK, DALLAS, or CHICAGO.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno IN (
    SELECT deptno
    FROM dept_classic_new
    WHERE loc IN ('NEW YORK','DALLAS','CHICAGO')
);

-- =====================================================
-- 9. Display the employees whose department number
-- exists in the DEPT table.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE deptno IN (
    SELECT deptno
    FROM dept_classic_new
);

-- =====================================================
-- 10. Display the employees whose salary matches
-- any employee in department 20.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal IN (
    SELECT sal
    FROM emp_classic_new
    WHERE deptno = 20
);

-- =====================================================
-- 11. Display the employees whose salary is less
-- than any employee in SALES.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal < ANY (
    SELECT sal
    FROM emp_classic_new
    WHERE deptno = (
        SELECT deptno
        FROM dept_classic_new
        WHERE dname='SALES'
    )
);

-- =====================================================
-- 12. Display the employees earning more than
-- any employee having commission.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > ANY (
    SELECT sal
    FROM emp_classic_new
    WHERE comm IS NOT NULL
);

-- =====================================================
-- 13. Display the employees hired before any
-- employee in RESEARCH.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE hiredate < ANY (
    SELECT hiredate
    FROM emp_classic_new
    WHERE deptno = (
        SELECT deptno
        FROM dept_classic_new
        WHERE dname='RESEARCH'
    )
);

-- =====================================================
-- 14. Display the employees earning more than
-- any ANALYST.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > ANY (
    SELECT sal
    FROM emp_classic_new
    WHERE job='ANALYST'
);

-- =====================================================
-- 15. Display the employees earning less than
-- any PRESIDENT.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal < ANY (
    SELECT sal
    FROM emp_classic_new
    WHERE job='PRESIDENT'
);

-- =====================================================
-- 16. Display the employees earning less than
-- all employees in SALES.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal < ALL (
    SELECT sal
    FROM emp_classic_new
    WHERE deptno = (
        SELECT deptno
        FROM dept_classic_new
        WHERE dname='SALES'
    )
);

-- =====================================================
-- 17. Display the employees earning more than
-- all employees receiving commission.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > ALL (
    SELECT sal
    FROM emp_classic_new
    WHERE comm IS NOT NULL
);

-- =====================================================
-- 18. Display the employees hired before all
-- employees in RESEARCH.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE hiredate < ALL (
    SELECT hiredate
    FROM emp_classic_new
    WHERE deptno = (
        SELECT deptno
        FROM dept_classic_new
        WHERE dname='RESEARCH'
    )
);

-- =====================================================
-- 19. Display the employees earning more than
-- all ANALYSTs.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal > ALL (
    SELECT sal
    FROM emp_classic_new
    WHERE job='ANALYST'
);

-- =====================================================
-- 20. Display the employees earning less than
-- all PRESIDENTs.
-- =====================================================

SELECT *
FROM emp_classic_new
WHERE sal < ALL (
    SELECT sal
    FROM emp_classic_new
    WHERE job='PRESIDENT'
);

-- =====================================================
-- 21. Display departments having more than
-- one employee.
-- =====================================================

SELECT deptno,
       COUNT(*) AS total_employees
FROM emp_classic_new
GROUP BY deptno
HAVING COUNT(*) > 1;