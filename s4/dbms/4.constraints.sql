-- 1. Table department dno primary key check(dno like 'd%'), dname, cnt_emp check(cnt_emp<15), dept_hod
CREATE TABLE department (
    dno VARCHAR(5) PRIMARY KEY CHECK(dno LIKE 'd%'),
    dname VARCHAR(15),
    cnt_emp NUMBER CHECK (cnt_emp < 15),
    dept_hod VARCHAR(15)
);

INSERT INTO department VALUES ('&dno', '&dname', &cnt_emp, '&dept_hod');

/*
DNO DNAME       CNT_EMP DEPT_HOD
d10 Production  1       John Doe
d11 Sales       2       Peter Parker
d12 Exporting   3       Paul Wesley
d20 Maintenance 3       Zuck
d30 Repair      8       Tim Payn
*/

-- 2. Table employee eno primary key check(eno like 'e%'), ename, salary, dno references department(dno), mngrno, doj date, job , address, city check(city in('cochin','bombay','madras','delhi')), pincode.
CREATE TABLE employee (
    eno VARCHAR(5) PRIMARY KEY CHECK(eno LIKE 'e%'),
    ename VARCHAR(15),
    salary NUMBER,
    dno VARCHAR(5) REFERENCES department(dno),
    mngrno NUMBER,
    doj DATE,
    job VARCHAR(10),
    address VARCHAR(15),
    city VARCHAR(10) CHECK(city IN ('cochin', 'bombay', 'madras', 'delhi')),
    pincode NUMBER
);

INSERT INTO employee VALUES ('&eno', '&ename', &salary, '&dno', &mngrno, '&doj', '&job', '&address', '&city', &pincode);

/*
ENO ENAME SALARY DNO MNGRNO DOJ       JOB      ADDRESS   CITY   PINCODE
e1  Don   1000   d10 1      18-JAN-65 sales    220 CB    cochin 65
e2  Donny 5000   d20 2      17-JAN-95 manager  Rosevila  delhi  35
e3  Jobin 9000   d30 5      17-JAN-45 accounts 22CB      bombay 72
e5  robin 900    d10        03-JAN-98 intern   22 CB     madras 45
e7  Jane  7500   d11 9      01-MAR-00 clerk    poovathil delhi  12

*/

-- a. List the name of Employees joined after 1- 1- 1998 and working in department number d10.
SELECT ename
FROM employee
WHERE doj > '01-JAN-1998'
AND dno = 'd10';

-- b. List all employees working in department other than department number d30.
SELECT ename
FROM employee
WHERE dno != 'd30';

-- c. List the name of employees working in department sales.
SELECT ename
FROM employee
WHERE dno IN (
  SELECT dno
  FROM department
  WHERE dname = 'Sales'
);

-- d. List the name of employees who is not a manager.
SELECT ename
FROM employee
WHERE job != 'manager';

-- e. List the employees whose names starts with ‘J’ and ‘N’ as third character.
SELECT ename
FROM employee
WHERE ename LIKE 'J_N%';

-- f. List all the employees joined during the year 2000.
SELECT ename
FROM employee
WHERE EXTRACT(YEAR FROM doj) = 2000;

-- g. List the name of employees along with their annual salary, and also for each record, get the output, Every year <ename> earns <amount>
SELECT ename, (salary * 12) AS Annual_salary, ('Every year ' || ename || ' earns '  ||  salary * 12)  AS output_msg
FROM employee;

-- h. Find the total number of employees in employee table.
SELECT COUNT(*) AS Total_Employees
FROM employee;

-- i. Display the minimum salary of various categories of employees.
INSERT INTO employee VALUES ('&eno', '&ename', &salary, '&dno', &mngrno, '&doj', '&job', '&address', '&city', &pincode);
/*
ENO ENAME SALARY DNO MNGRNO DOJ       JOB      ADDRESS    CITY   PINCODE
e4  Alice 8000   d12 1      12-FEB-80 clerk    220A CB    bombay 15
e6  Bob   5500   d11 2      14-JUN-85 manager  Rosewood   madras 40
e8  Carol 9500   d12 5      16-APR-90 accounts 22A CB     cochin 60
e9  David 1200   d30 9      18-MAY-95 sales    220B CB    delhi  32
e10 Frank 1200   d11 1      20-JUL-05 intern   Rosegarden madras 20
e11 John  7300   d20 2      29-AUG-80 clerk    22B CB     cochin 25
e12 Liam  6000   d10 5      21-SEP-85 manager  220C CB    bombay 30
e13 Maya  8500   d20 9      17-OCT-90 accounts Rosehill   cochin 42
e14 Alex  1000   d12 1      15-NOV-95 sales    22C CB     bombay 50
e15 Sofia 1000   d30 2      24-DEC-05 intern   220D CB    madras 52

*/

SELECT job, MIN(salary) AS Min_Salary
FROM employee
GROUP BY job;

-- j. List the minimum salary of various categories of employees in various departments having minimum salary greater than 7,000.
SELECT job, dno, MIN(salary) AS Min_Salary
FROM employee
GROUP BY job, dno
HAVING MIN(salary) > 7000;

-- k. Find the minimum salary of manager in various departments.
SELECT dno, MIN(salary) AS Min_Manager_Salary
FROM employee
WHERE job = 'manager'
GROUP BY dno;

-- l. List the names of all clerks along with the names of departments.
SELECT ename, dname
FROM employee
JOIN department
ON employee.dno = department.dno
WHERE job = 'clerk';

-- m. List the employee names and their date of joining in format dd/mm/yy.
SELECT ename, TO_CHAR(doj, 'DD/MM/YYYY') AS doj_formated
FROM employee;

-- n. Display ename, DNO of employees whose department is in department table
SELECT ename, dno
FROM employee
JOIN department
ON employee.dno = department.dno

-- o. Display ename, DNO of employees whose job is in department table
INSERT INTO employee VALUES ('&eno', '&ename', &salary, '&dno', &mngrno, '&doj', '&job', '&address', '&city', &pincode);

SELECT ename, dno
FROM employee
WHERE job IN (
    SELECT dname
    FROM department
);

-- p. Display dname, DNO of department where departmentno in is in employee table
SELECT dname, dno
FROM department
WHERE dno IN (
    SELECT dno
    FROM employee
);