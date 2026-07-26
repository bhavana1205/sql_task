CREATE TABLE Departmentt (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
INSERT INTO Departmentt VALUES
(101,'CSE'),
(102,'ECE'),
(103,'EEE'),
(104,'IT'),
(105,'MECH'),
(106,'CIVIL'),
(107,'AI'),
(108,'DS'),
(109,'MBA'),
(110,'BBA');

CREATE TABLE Employeee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    age INT,
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departmentt(dept_id)
);

INSERT INTO Employeee VALUES
(1,'Rahul',25,35000,101),
(2,'Bhavana',22,30000,102),
(3,'Anil',26,40000,103),
(4,'Divya',24,38000,104),
(5,'Kiran',27,42000,105),
(6,'Meena',23,32000,106),
(7,'Nikhil',25,39000,107),
(8,'Pooja',24,36000,108),
(9,'Ravi',28,45000,109),
(10,'Sneha',26,41000,110);