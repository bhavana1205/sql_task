CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(20),
    location_id INT
);
INSERT INTO department VALUES
(101,'IT',1),
(102,'HR',2),
(103,'Finance',3);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(20),
    age INT,
    salary DECIMAL(10,2),
    experience FLOAT,
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES department(dept_id)
);
INSERT INTO employee VALUES
(1,'Bhanu',22,45000.50,2.5,101),
(2,'Sneha',23,55000.75,3.0,102),
(3,'Harshi',24,65000.25,4.5,103);
SELECT * FROM department;

SELECT * FROM employee;

SELECT 
e.emp_id,
e.emp_name,
e.salary,
d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id;

