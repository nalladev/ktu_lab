-- 1. Create table product (pid,pname,unitprice,manufacturer,category,country).
CREATE TABLE product (
    pid NUMBER,
    pname VARCHAR(15),
    unitprice NUMBER,
    manufacturer VARCHAR(15),
    category VARCHAR(20),
    country VARCHAR(15)
);

DESC product;

-- 2. Populate the table and display the details.
INSERT INTO product VALUES (&pid, '&pname', &unitprice, '&manufacturer', '&category', '&country');
-- PID  PNAME       UNITPRICE  MANUFACTURER  CATEGORY         COUNTRY
-- 123  Laptop      1000       Dell          Electronics      USA
-- 234  Lenovo      800        Samsung       Electronics      South Korea
-- 200  Watch       200        Casio         Fashion          Japan
-- 467  Iron box    300        Thoshiba      home appliances  USA

SELECT * FROM product;

-- 3. Create view v1 with pid, pname and category.
CREATE VIEW v1 AS
SELECT pid, pname, category
FROM product;

SELECT * FROM v1;

-- 4. List the pname and country of all products whose category is ‘home appliances’ using views.
CREATE VIEW view2 AS
SELECT pname, country
FROM product
WHERE category = 'home appliances';

SELECT * FROM view2;

-- 5. Populate v1 with values 501, XY505, mobilephone.
INSERT INTO product VALUES (&pid, '&pname', &unitprice, '&manufacturer', '&category', '&country');

-- PID  PNAME  UNITPRICE  MANUFACTURER  CATEGORY     COUNTRY
-- 501  XY505  1000       Dell          mobilephone  USA

SELECT * FROM v1;

-- 6. Modify pname as Xseries whose pid is 200.
UPDATE product
SET pname = 'Xseries'
WHERE pid = 200;

-- 7. Display the view to reflect the updation.
SELECT * FROM v1;

-- 8. Modify the product table to set pid as primary key.
ALTER TABLE product
ADD PRIMARY KEY (pid);

DESC product;

-- 9. Create another view v2 with attributes pname,unit price and category.
CREATE VIEW v2 AS
SELECT pid, unitprice, category
FROM product;

SELECT * FROM v2;

-- 10.Populate v2 with a row.
INSERT INTO product VALUES (&pid, '&pname', &unitprice, '&manufacturer', '&category', '&country');

-- PID  PNAME    UNITPRICE  MANUFACTURER  CATEGORY  COUNTRY
-- 505  ThinkPad 1000       Lenovo        Laptop    USA

SELECT * FROM v2;

-- 11.Delete the details of product whose pname is ‘Lenovo’.
DELETE FROM product
WHERE pname = 'Lenovo';

SELECT * FROM v2;

-- 12.Define another view v3 that contains employee id,ename,salary,dept id,and dept name.(Create appropriate tables).
CREATE TABLE employee (
    eid NUMBER,
    ename VARCHAR(15),
    salary NUMBER,
    dept_id NUMBER
);

DESC employee;

INSERT INTO employee VALUES (&eid, '&ename', &salary, &dept_id);
-- EID  ENAME        SALARY  DEPT_ID
-- 1    John Doe     50000   10
-- 2    Jane Smith   60000   11
-- 3    Michael      55000   12
-- 4    Emily Davis  62000   13

SELECT * FROM employee;

CREATE TABLE department (
    dept_id NUMBER,
    dept_name VARCHAR(20)
);

DESC department;

INSERT INTO department VALUES (&dept_id, '&dept_name');
-- DEPT_ID  DEPT_NAME
-- 10      Repair
-- 11      Service
-- 12      Marketing
-- 13      Sales

SELECT * FROM department;

CREATE VIEW v3 AS
SELECT employee.eid, employee.ename, employee.salary, department.dept_id, department.dept_name
FROM employee
JOIN department 
ON employee.dept_id = department.dept_id;

SELECT * FROM v3;

-- 13.Modify the salary of all employees who belong to dept 10 by rupees 1000.
UPDATE employee
SET salary = salary + 1000
WHERE dept_id = 10;

SELECT * FROM v3;

-- 14.Modify the department table to set dept id as primary key.
ALTER TABLE department
ADD PRIMARY KEY (dept_id);

DESC department;

-- 15.Modify the table to set eid as primary and dept id as foreign key.
ALTER TABLE employee
ADD PRIMARY KEY (eid);

ALTER TABLE employee
ADD FOREIGN KEY (dept_id) REFERENCES department(dept_id);

DESC employee;

-- 16.Insert a row to v3.
INSERT INTO employee VALUES (&eid, '&ename', &salary, &dept_id);
-- EID  ENAME   SALARY  DEPT_ID
-- 5    George  70000   13

SELECT * FROM v3;