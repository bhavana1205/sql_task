CREATE DATABASE CollegeDB;
USE CollegeDB;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    hod_name VARCHAR(50) NOT NULL,
    budget DECIMAL(10,2) DEFAULT 100000.00,
    established_year YEAR CHECK(established_year>=2000)
);

INSERT INTO Department VALUES
(101,'CSE','Ramesh',500000.00,2010),
(102,'ECE','Suresh',450000.00,2011),
(103,'EEE','Mahesh',400000.00,2012),
(104,'IT','Kiran',350000.00,2013),
(105,'MECH','Anil',300000.00,2014),
(106,'CIVIL','Vijay',250000.00,2015),
(107,'AI','Harsha',600000.00,2021),
(108,'DS','Priya',550000.00,2022),
(109,'MBA','Sanjay',280000.00,2016),
(110,'BBA','Deepa',270000.00,2017);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INT CHECK(age>=18),
    gender CHAR(1) CHECK(gender IN('M','F')),
    email VARCHAR(100) UNIQUE,
    phone BIGINT UNIQUE,
    dept_id INT,
    admission_date DATE,
    cgpa DECIMAL(3,2) DEFAULT 0.00,
    FOREIGN KEY(dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Student VALUES
(1,'Amit',20,'M','amit@gmail.com',9876543210,101,'2023-06-15',8.50),
(2,'Bhavana',21,'F','bhavana@gmail.com',9876543211,102,'2023-06-16',9.20),
(3,'Charan',22,'M','charan@gmail.com',9876543212,103,'2023-06-17',8.00),
(4,'Divya',20,'F','divya@gmail.com',9876543213,104,'2023-06-18',8.90),
(5,'Eswar',21,'M','eswar@gmail.com',9876543214,105,'2023-06-19',7.80),
(6,'Farah',22,'F','farah@gmail.com',9876543215,106,'2023-06-20',9.10),
(7,'Ganesh',20,'M','ganesh@gmail.com',9876543216,107,'2023-06-21',8.30),
(8,'Hema',21,'F','hema@gmail.com',9876543217,108,'2023-06-22',9.40),
(9,'Imran',22,'M','imran@gmail.com',9876543218,109,'2023-06-23',7.90),
(10,'Jyothi',20,'F','jyothi@gmail.com',9876543219,110,'2023-06-24',8.70);

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(50) NOT NULL,
    qualification VARCHAR(30),
    salary DECIMAL(8,2) CHECK(salary>20000),
    hire_date DATE,
    dept_id INT,
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY(dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Faculty VALUES
(201,'Ravi','PhD',85000,'2018-01-10',101,'ravi@gmail.com'),
(202,'Sneha','MTech',60000,'2019-02-15',102,'sneha@gmail.com'),
(203,'Ajay','PhD',90000,'2020-03-20',103,'ajay@gmail.com'),
(204,'Kavya','MTech',65000,'2021-04-12',104,'kavya@gmail.com'),
(205,'Lokesh','PhD',88000,'2018-05-16',105,'lokesh@gmail.com'),
(206,'Meena','MTech',62000,'2019-06-14',106,'meena@gmail.com'),
(207,'Nikhil','PhD',95000,'2020-07-11',107,'nikhil@gmail.com'),
(208,'Pooja','MTech',61000,'2021-08-08',108,'pooja@gmail.com'),
(209,'Rahul','MBA',55000,'2022-09-05',109,'rahul@gmail.com'),
(210,'Swathi','MBA',54000,'2022-10-02',110,'swathi@gmail.com');


CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL UNIQUE,
    credits INT CHECK(credits BETWEEN 1 AND 5),
    duration_months INT DEFAULT 6,
    fee DECIMAL(8,2) CHECK(fee>0),
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Course VALUES
(301,'Java',4,6,25000,101),
(302,'Python',4,6,24000,102),
(303,'DBMS',3,5,18000,103),
(304,'Data Structures',4,6,22000,104),
(305,'Machine Learning',5,8,35000,107),
(306,'Cloud Computing',4,6,30000,108),
(307,'Operating Systems',4,6,20000,105),
(308,'Computer Networks',3,5,19000,106),
(309,'Business Analytics',4,6,27000,109),
(310,'Digital Marketing',3,4,16000,110);




