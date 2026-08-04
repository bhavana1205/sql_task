-- =====================================================
-- 1. START TRANSACTION, COMMIT and ROLLBACK
-- =====================================================

START TRANSACTION;

INSERT INTO employee VALUES
(201,'Rahul','Developer','rahul201@gmail.com',30000);

COMMIT;

START TRANSACTION;

INSERT INTO employee VALUES
(202,'Anita','Tester','anita202@gmail.com',25000);

ROLLBACK;

SELECT * FROM employee;

-- =====================================================
-- 2. Demonstrate SAVEPOINT
-- =====================================================

START TRANSACTION;

INSERT INTO employee VALUES
(203,'Ravi','Developer','ravi203@gmail.com',35000);

SAVEPOINT sp1;

INSERT INTO employee VALUES
(204,'Priya','Tester','priya204@gmail.com',28000);

ROLLBACK TO sp1;

COMMIT;

SELECT * FROM employee;

-- =====================================================
-- 3. Demonstrate RELEASE SAVEPOINT
-- =====================================================

START TRANSACTION;

INSERT INTO employee VALUES
(205,'Kiran','Manager','kiran205@gmail.com',50000);

SAVEPOINT sp2;

RELEASE SAVEPOINT sp2;

COMMIT;

-- =====================================================
-- 4. Demonstrate READ UNCOMMITTED Isolation Level
-- =====================================================

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

START TRANSACTION;

SELECT * FROM employee;

COMMIT;

-- =====================================================
-- 5. Demonstrate READ COMMITTED Isolation Level
-- =====================================================

SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT * FROM employee;

COMMIT;

-- =====================================================
-- 6. Demonstrate REPEATABLE READ Isolation Level
-- (Default in MySQL)
-- =====================================================

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

START TRANSACTION;

SELECT * FROM employee;

COMMIT;

-- =====================================================
-- 7. Demonstrate SERIALIZABLE Isolation Level
-- =====================================================

SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

START TRANSACTION;

SELECT * FROM employee;

COMMIT;

-- =====================================================
-- 8. Update Employee Salary and COMMIT
-- =====================================================

START TRANSACTION;

UPDATE employee
SET salary = salary + 5000
WHERE empid = 201;

COMMIT;

SELECT * FROM employee;

-- =====================================================
-- 9. Delete Employee and ROLLBACK
-- =====================================================

START TRANSACTION;

DELETE FROM employee
WHERE empid = 201;

ROLLBACK;

SELECT * FROM employee;