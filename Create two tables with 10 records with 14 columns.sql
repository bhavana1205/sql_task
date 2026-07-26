CREATE TABLE departmentt (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30),
    manager_name VARCHAR(30),
    location VARCHAR(30),
    floor_no INT,
    employee_count INT,
    budget DECIMAL(10,2),
    contact_no BIGINT,
    established_year INT,
    city VARCHAR(30),
    state VARCHAR(30),
    country VARCHAR(30),
    rating FLOAT,
    status VARCHAR(20)
);
INSERT INTO departmentt VALUES
(101,'IT','Ramesh','Block A',3,50,800000.00,9876543210,2010,'Hyderabad','Telangana','India',4.5,'Active'),
(102,'HR','Suresh','Block B',2,30,400000.00,9876543211,2012,'Chennai','Tamil Nadu','India',4.2,'Active'),
(103,'Finance','Anil','Block C',4,40,600000.00,9876543212,2011,'Mumbai','Maharashtra','India',4.3,'Active'),
(104,'Marketing','Kiran','Block D',5,35,500000.00,9876543213,2015,'Pune','Maharashtra','India',4.1,'Active'),
(105,'Sales','Raj','Block E',6,60,700000.00,9876543214,2009,'Delhi','Delhi','India',4.4,'Active'),
(106,'Support','Vijay','Block F',1,25,300000.00,9876543215,2018,'Bangalore','Karnataka','India',4.0,'Active'),
(107,'Admin','Priya','Block G',2,20,250000.00,9876543216,2016,'Vizag','AP','India',3.9,'Active'),
(108,'Security','Arun','Block H',1,15,200000.00,9876543217,2017,'Warangal','Telangana','India',4.0,'Active'),
(109,'Research','Meena','Block I',7,45,900000.00,9876543218,2008,'Kochi','Kerala','India',4.6,'Active'),
(110,'Operations','Ravi','Block J',3,55,750000.00,9876543219,2013,'Hyderabad','Telangana','India',4.5,'Active');


CREATE TABLE employeees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    age INT,
    gender VARCHAR(10),
    phone_no BIGINT,
    email VARCHAR(50),
    salary DECIMAL(10,2),
    experience FLOAT,
    job_role VARCHAR(30),
    city VARCHAR(30),
    state VARCHAR(30),
    joining_year INT,
    dept_id INT,
    status VARCHAR(20),
    FOREIGN KEY(dept_id) REFERENCES departmentt(dept_id)
);

INSERT INTO employeees VALUES
(1,'Bhavana',22,'Female',9876500011,'bhavana@gmail.com',45000,1.5,'Developer','Hyderabad','Telangana',2025,101,'Active'),
(2,'Sneha',23,'Female',9876500012,'sneha@gmail.com',50000,2.0,'HR Manager','Chennai','Tamil Nadu',2024,102,'Active'),
(3,'Harshi',24,'Female',9876500013,'harshi@gmail.com',55000,3.0,'Analyst','Mumbai','Maharashtra',2023,103,'Active'),
(4,'Kusuma',25,'Female',9876500014,'kusuma@gmail.com',60000,4.0,'Marketing Lead','Pune','Maharashtra',2022,104,'Active'),
(5,'Vijay',26,'Male',9876500015,'vijay@gmail.com',65000,5.0,'Sales Executive','Delhi','Delhi',2021,105,'Active'),
(6,'Rahul',27,'Male',9876500016,'rahul@gmail.com',70000,6.0,'Support Engineer','Bangalore','Karnataka',2020,106,'Active'),
(7,'Anjali',21,'Female',9876500017,'anjali@gmail.com',40000,1.0,'Admin','Vizag','AP',2025,107,'Active'),
(8,'Ravi',28,'Male',9876500018,'ravi@gmail.com',75000,7.0,'Security Officer','Warangal','Telangana',2019,108,'Active'),
(9,'Priya',29,'Female',9876500019,'priya@gmail.com',80000,8.0,'Researcher','Kochi','Kerala',2018,109,'Active'),
(10,'Kiran',30,'Male',9876500020,'kiran@gmail.com',85000,9.0,'Operations Manager','Hyderabad','Telangana',2017,110,'Active');

SELECT * FROM departmentt;

SELECT * FROM employeees;