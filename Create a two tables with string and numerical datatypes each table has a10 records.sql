CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL,
    floor_no INT,
    budget DECIMAL(10,2)
);

INSERT INTO departments VALUES
(101,'HR',1,250000.00),
(102,'Finance',2,500000.00),
(103,'IT',3,800000.00),
(104,'Marketing',4,450000.00),
(105,'Sales',5,600000.00),
(106,'Admin',1,300000.00),
(107,'Support',2,350000.00),
(108,'Security',1,200000.00),
(109,'Research',6,900000.00),
(110,'Operations',3,700000.00);

CREATE TABLE employeee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30) NOT NULL,
    age INT,
    salary DECIMAL(10,2),
    phone BIGINT UNIQUE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employeee VALUES
(1001,'Bhavana',22,45000.00,9876543210,103),
(1002,'Sneha',23,50000.00,9876543211,102),
(1003,'Harshi',24,55000.00,9876543212,101),
(1004,'Kusuma',25,60000.00,9876543213,104),
(1005,'Vijay',26,65000.00,9876543214,105),
(1006,'Rahul',27,70000.00,9876543215,106),
(1007,'Anjali',21,40000.00,9876543216,107),
(1008,'Ravi',28,75000.00,9876543217,108),
(1009,'Priya',29,80000.00,9876543218,109),
(1010,'Kiran',30,85000.00,9876543219,110);

SELECT * FROM departments;

SELECT * FROM employeee;

SELECT
e.emp_id,
e.emp_name,
e.salary,
d.dept_name,
d.budget
FROM employeee e
JOIN departments d
ON e.dept_id = d.dept_id;