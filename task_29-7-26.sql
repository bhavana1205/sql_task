DESC employee;

CREATE TABLE employee_trigger(
    empid INT PRIMARY KEY,
    ename VARCHAR(50),
    designation VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2)
);

CREATE TABLE employee_history(
    id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(200),
    created_on DATETIME
);

CREATE TABLE salary_log(
    id INT AUTO_INCREMENT PRIMARY KEY,
    empid INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    updated_on DATETIME
);

CREATE TABLE employee_backup(
    empid INT,
    ename VARCHAR(50),
    designation VARCHAR(50),
    email VARCHAR(100),
    salary DECIMAL(10,2),
    deleted_on DATETIME
);
/*1. Create a **BEFORE INSERT** trigger to prevent inserting an employee with a negative salary.
*/
DELIMITER //

CREATE TRIGGER trg_negative_salary
BEFORE INSERT ON employee_trigger
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary Cannot Be Negative';
    END IF;
END //

DELIMITER ;
INSERT INTO employee_trigger
VALUES
(101,'Rahul','Developer','rahul@gmail.com',-5000);

/*2. Create a **BEFORE INSERT** trigger to automatically set the salary to **₹15,000** if it is entered as **NULL**.
*/
DROP TRIGGER IF EXISTS trg_negative_salary;
DELIMITER //

CREATE TRIGGER trg_default_salary
BEFORE INSERT ON employee_trigger
FOR EACH ROW
BEGIN
    IF NEW.salary IS NULL THEN
        SET NEW.salary = 15000;
    END IF;
END //

DELIMITER ;

INSERT INTO employee_trigger
VALUES (102,'Anita','Tester','anita@gmail.com',NULL);

SELECT * FROM employee_trigger;

/* 3. Create a **BEFORE INSERT** trigger to change the salary to **₹10,000** if the entered salary is less than **₹10,000**.*/
DROP TRIGGER IF EXISTS trg_default_salary;

DELIMITER //

CREATE TRIGGER trg_min_salary
BEFORE INSERT ON employee_trigger
FOR EACH ROW
BEGIN
    IF NEW.salary < 10000 THEN
        SET NEW.salary = 10000;
    END IF;
END //

DELIMITER ;
INSERT INTO employee_trigger
VALUES (103,'Ravi','Developer','ravi@gmail.com',8000);

SELECT * FROM employee_trigger;
/*. Create an **AFTER INSERT** trigger to store a message like **"Employee <Employee_Name> Added Successfully"** along with the current date and time in the `employee_history` table whenever a new employee is added.
*/
DELIMITER //

CREATE TRIGGER trg_employee_history
AFTER INSERT ON employee_trigger
FOR EACH ROW
BEGIN
    INSERT INTO employee_history(message,created_on)
    VALUES(
        CONCAT('Employee ',NEW.ename,' Added Successfully'),
        NOW()
    );
END //

DELIMITER ;
INSERT INTO employee_trigger
VALUES (104,'Priya','Developer','priya@gmail.com',25000);

SELECT * FROM employee_history;

/*5. Create an **AFTER UPDATE** trigger to store **Employee ID, Old Salary, New Salary, and Updated Date & Time** in the `salary_log` table whenever an employee's salary is updated.
*/
DELIMITER //

CREATE TRIGGER trg_salary_log
AFTER UPDATE ON employee_trigger
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_log(empid,old_salary,new_salary,updated_on)
        VALUES(
            OLD.empid,
            OLD.salary,
            NEW.salary,
            NOW()
        );
    END IF;
END //

DELIMITER ;
UPDATE employee_trigger
SET salary=30000
WHERE empid=104;

SELECT * FROM salary_log;
/*6. Create a **BEFORE UPDATE** trigger to prevent reducing an employee's salary. Display the message **"Salary Cannot Be Reduced"**.*/
DELIMITER //

CREATE TRIGGER trg_prevent_salary_reduce
BEFORE UPDATE ON employee_trigger
FOR EACH ROW
BEGIN
    IF NEW.salary < OLD.salary THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Salary Cannot Be Reduced';
    END IF;
END //

DELIMITER ;
UPDATE employee_trigger
SET salary=20000
WHERE empid=104;
/* 7. Create a **BEFORE DELETE** trigger to prevent deleting employees whose designation is **"Manager"**. Display the message **"Managers Cannot Be Deleted"**.*/
DELIMITER //

CREATE TRIGGER trg_manager_delete
BEFORE DELETE ON employee_trigger
FOR EACH ROW
BEGIN
    IF OLD.designation='Manager' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Managers Cannot Be Deleted';
    END IF;
END //

DELIMITER ;
INSERT INTO employee_trigger
VALUES(105,'Kiran','Manager','kiran@gmail.com',50000);

DELETE FROM employee_trigger
WHERE empid=105;
/*8. Create an **AFTER DELETE** trigger to copy deleted employee records into the `employee_backup` table along with the deletion date and time.

**Note:** Test each trigger with appropriate `INSERT`, `UPDATE`, and `DELETE` statements and verify the output.
 */
 
 DELIMITER //

CREATE TRIGGER trg_employee_backup
AFTER DELETE ON employee_trigger
FOR EACH ROW
BEGIN
    INSERT INTO employee_backup
    VALUES(
        OLD.empid,
        OLD.ename,
        OLD.designation,
        OLD.email,
        OLD.salary,
        NOW()
    );
END //

DELIMITER ;
INSERT INTO employee_trigger
VALUES(106,'Ramesh','Developer','ramesh@gmail.com',30000);

DELETE FROM employee_trigger
WHERE empid=106;

SELECT * FROM employee_backup;

DELIMITER //

CREATE TRIGGER trg_before_insert_employee
BEFORE INSERT ON employee_trigger
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Salary Cannot Be Negative';
    END IF;

    IF NEW.salary IS NULL THEN
        SET NEW.salary=15000;
    END IF;

    IF NEW.salary < 10000 THEN
        SET NEW.salary=10000;
    END IF;
END //

DELIMITER ;