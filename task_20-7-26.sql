-- =====================================================
-- Create EMP_STRING_NEW table
-- =====================================================

CREATE TABLE emp_string_new (
    empno INT PRIMARY KEY,
    ename VARCHAR(30),
    job VARCHAR(30),
    sal DECIMAL(10,2)
);

INSERT INTO emp_string_new VALUES
(7369,'SMITH','CLERK',800),
(7499,'ALLEN','SALESMAN',1600),
(7521,'WARD','SALESMAN',1250),
(7566,'JONES','MANAGER',2975),
(7654,'MARTIN','SALESMAN',1250),
(7698,'BLAKE','MANAGER',2850),
(7782,'CLARK','MANAGER',2450),
(7788,'SCOTT','ANALYST',3000),
(7839,'KING','PRESIDENT',5000),
(7844,'TURNER','SALESMAN',1500);

-- =====================================================
-- Create ORDERS_STRING_NEW table
-- =====================================================

CREATE TABLE orders_string_new (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    item_name VARCHAR(50),
    quantity INT,
    amount DECIMAL(10,2)
);

INSERT INTO orders_string_new VALUES
(101,'Ravi','Laptop',1,65000),
(102,'Anjali','Mobile',2,40000),
(103,'Kiran','Keyboard',1,1500),
(104,'Sneha','Laptop',1,70000),
(105,'Arjun','Headphones',2,6000),
(106,'Meena','Mouse',1,800),
(107,'Rahul','Tablet',1,30000),
(108,'Divya','Printer',1,12000),
(109,'Priya','Monitor',2,25000),
(110,'Karthik','Laptop',1,68000);

-- =====================================================
-- 1. Display all employee names in UPPERCASE.
-- =====================================================

SELECT UPPER(ename) AS Employee_Name
FROM emp_classic_new;

-- =====================================================
-- 2. Display all employee names in lowercase.
-- =====================================================

SELECT LOWER(ename) AS Employee_Name
FROM emp_classic_new;

-- =====================================================
-- 3. Display the employee name along with the
-- number of characters in the name.
-- =====================================================

SELECT ename,
       CHAR_LENGTH(ename) AS Name_Length
FROM emp_classic_new;

-- =====================================================
-- 4. Display the first 3 characters of each
-- employee's name.
-- =====================================================

SELECT ename,
       LEFT(ename,3) AS First_3_Characters
FROM emp_classic_new;

-- =====================================================
-- 5. Display the last 2 characters of each
-- employee's name.
-- =====================================================

SELECT ename,
       RIGHT(ename,2) AS Last_2_Characters
FROM emp_classic_new;

-- =====================================================
-- Create products_new table
-- =====================================================

CREATE TABLE products_new (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2)
);

INSERT INTO products_new VALUES
(101,'Laptop','Electronics',65000),
(102,'Mobile','Electronics',25000),
(103,'Keyboard','Accessories',1500),
(104,'Mouse','Accessories',800),
(105,'Headphones','Electronics',3000),
(106,'Monitor','Electronics',12000),
(107,'Printer','Electronics',9000),
(108,'Tablet','Electronics',30000),
(109,'Camera','Electronics',45000),
(110,'Speaker','Electronics',5000);

-- =====================================================
-- Create customers_new table
-- =====================================================

CREATE TABLE customers_new (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

INSERT INTO customers_new VALUES
(1,'Ravi','Hyderabad'),
(2,'Anjali','Chennai'),
(3,'Rahul','Bangalore'),
(4,'Sneha','Delhi'),
(5,'Priya','Mumbai'),
(6,'Kiran','Hyderabad'),
(7,'Arjun','Pune'),
(8,'Divya','Chennai'),
(9,'Meena','Hyderabad'),
(10,'Karthik','Bangalore');
-- =====================================================
-- 6. Display all item names in UPPERCASE.
-- (Using product_name from products_new)
-- =====================================================

SELECT UPPER(product_name) AS Item_Name
FROM products_new;

-- =====================================================
-- 7. Display the first 4 characters of each
-- item name.
-- =====================================================

SELECT product_name,
       LEFT(product_name,4) AS First_4_Characters
FROM products_new;

-- =====================================================
-- 8. Display the item name by replacing
-- 'Laptop' with 'Notebook'
-- (Display only, do not update the table).
-- =====================================================

SELECT REPLACE(product_name,'Laptop','Notebook') AS Item_Name
FROM products_new;

-- =====================================================
-- 9. Display each customer's name along with
-- its reverse.
-- =====================================================

SELECT customer_name,
       REVERSE(customer_name) AS Reverse_Name
FROM customers_new;

-- =====================================================
-- 10. Display the customer name in the format:
-- Customer: Ravi
-- =====================================================

SELECT CONCAT('Customer: ',customer_name) AS Customer_Details
FROM customers_new;