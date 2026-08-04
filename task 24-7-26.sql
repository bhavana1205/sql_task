/* WINDOW FUNCTIONS TASK */

CREATE TABLE dept_classic_new (
    deptno INT PRIMARY KEY,
    dname VARCHAR(20),
    loc VARCHAR(20)
);
INSERT INTO dept_classic_new VALUES
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');
CREATE TABLE emp_classic_new (
    empno INT PRIMARY KEY,
    ename VARCHAR(20),
    job VARCHAR(20),
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
-- 1. Display employees department-wise and assign
-- row numbers based on salary
-- (Highest salary gets Row Number 1).
-- =====================================================

SELECT empno,
       ename,
       deptno,
       sal,
       ROW_NUMBER() OVER(PARTITION BY deptno ORDER BY sal DESC) AS row_no
FROM emp_classic_new;

-- =====================================================
-- 2. Display employees ordered by hire date
-- and assign row numbers.
-- =====================================================

SELECT empno,
       ename,
       hiredate,
       ROW_NUMBER() OVER(ORDER BY hiredate) AS row_no
FROM emp_classic_new;

-- =====================================================
-- 3. Rank employees department-wise according to salary.
-- =====================================================

SELECT empno,
       ename,
       deptno,
       sal,
       RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) AS emp_rank
FROM emp_classic_new;

-- =====================================================
-- 4. Rank employees based on commission
-- in descending order.
-- =====================================================

SELECT empno,
       ename,
       comm,
       RANK() OVER(ORDER BY comm DESC) AS commission_rank
FROM emp_classic_new;

-- =====================================================
-- 5. Display dense ranks within each department
-- according to salary.
-- =====================================================

SELECT empno,
       ename,
       deptno,
       sal,
       DENSE_RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) AS dense_rank
FROM emp_classic_new;

-- =====================================================
-- 6. Rank employees according to hire date
-- using DENSE_RANK().
-- =====================================================

SELECT empno,
       ename,
       hiredate,
       DENSE_RANK() OVER(ORDER BY hiredate) AS hire_rank
FROM emp_classic_new;

-- =====================================================
-- 7. Department-wise, display each employee's salary
-- along with the previous salary.
-- =====================================================

SELECT empno,
       ename,
       deptno,
       sal,
       LAG(sal) OVER(PARTITION BY deptno ORDER BY sal) AS previous_salary
FROM emp_classic_new;

-- =====================================================
-- 8. Find employees whose salary is greater
-- than the previous employee's salary.
-- =====================================================

SELECT *
FROM
(
SELECT empno,
       ename,
       sal,
       LAG(sal) OVER(ORDER BY sal) AS previous_salary
FROM emp_classic_new
)t
WHERE sal > previous_salary;

-- =====================================================
-- 9. Department-wise, display each employee
-- and the next employee's salary.
-- =====================================================

SELECT empno,
       ename,
       deptno,
       sal,
       LEAD(sal) OVER(PARTITION BY deptno ORDER BY sal) AS next_salary
FROM emp_classic_new;

-- =====================================================
-- 10. Find employees whose salary is less
-- than the next employee's salary.
-- =====================================================

SELECT *
FROM
(
SELECT empno,
       ename,
       sal,
       LEAD(sal) OVER(ORDER BY sal) AS next_salary
FROM emp_classic_new
)t
WHERE sal < next_salary;

-- =====================================================
-- 11. Display the first commission value
-- within each department.
-- =====================================================

SELECT empno,
       ename,
       deptno,
       comm,
       FIRST_VALUE(comm)
       OVER(PARTITION BY deptno ORDER BY comm DESC) AS first_commission
FROM emp_classic_new;

-- =====================================================
-- 12. Display each employee along with the
-- lowest salary in the company.
-- =====================================================

SELECT empno,
       ename,
       sal,
       MIN(sal) OVER() AS lowest_salary
FROM emp_classic_new;

-- =====================================================
-- 13. Display the third commission value
-- in each department.
-- =====================================================

SELECT *
FROM
(
SELECT deptno,
       ename,
       comm,
       ROW_NUMBER() OVER(PARTITION BY deptno ORDER BY comm DESC) rn
FROM emp_classic_new
)t
WHERE rn=3;

-- =================================================================================================================================================================

/* STORED PROCEDURES TASK */
-- =====================================================
-- 1. Create a stored procedure to display
-- all employee details.
-- =====================================================

DELIMITER //

CREATE PROCEDURE sp_all_employees()
BEGIN
    SELECT * FROM emp_classic_new;
END //

DELIMITER ;

CALL sp_all_employees();

-- =====================================================
-- 2. Create a stored procedure to display
-- all department details.
-- =====================================================

DELIMITER //

CREATE PROCEDURE sp_all_departments()
BEGIN
    SELECT * FROM dept_classic_new;
END //

DELIMITER ;

CALL sp_all_departments();

-- =====================================================
-- 3. Create a stored procedure that accepts
-- a department number and displays all employees
-- working in that department.
-- =====================================================

DELIMITER //

CREATE PROCEDURE sp_department(IN p_deptno INT)
BEGIN
    SELECT *
    FROM emp_classic_new
    WHERE deptno=p_deptno;
END //

DELIMITER ;

CALL sp_department(20);

-- =====================================================
-- 4. Create a stored procedure that accepts
-- an employee number and displays that
-- employee's details.
-- =====================================================

DELIMITER //

CREATE PROCEDURE sp_employee(IN p_empno INT)
BEGIN
    SELECT *
    FROM emp_classic_new
    WHERE empno=p_empno;
END //

DELIMITER ;

CALL sp_employee(7369);

-- =====================================================
-- 5. Create a stored procedure that accepts
-- a job role and displays all employees
-- having that job.
-- =====================================================

DELIMITER //

CREATE PROCEDURE sp_job(IN p_job VARCHAR(30))
BEGIN
    SELECT *
    FROM emp_classic_new
    WHERE job=p_job;
END //

DELIMITER ;

CALL sp_job('MANAGER');


SELECT * FROM emp_classic_new;

DROP PROCEDURE IF EXISTS sp_employee;

DELIMITER $$

CREATE PROCEDURE sp_employee(IN p_empno INT)
BEGIN
    SELECT *
    FROM emp_classic_new
    WHERE empno = p_empno;
END $$

DELIMITER ;

CALL sp_employee(7369);


















