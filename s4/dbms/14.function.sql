
CREATE TABLE employee (
    employeeid NUMBER,
    ename VARCHAR(15),
    salary NUMBER,
    job VARCHAR(15)
);

DESC employee;

INSERT INTO employee VALUES (&employeeid, '&ename', &salary, '&job');

COMMIT;

CREATE OR REPLACE FUNCTION getDetails(empid IN NUMBER)
RETURN VARCHAR2
IS
    s NUMBER;
    n VARCHAR(15);
    result VARCHAR2(100);
BEGIN
    SELECT salary, ename INTO s, n
    FROM employee 
    WHERE employeeid = empid;
    
    result := 'Salary of ' || n || ' is ' || s;
    RETURN result;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No data found';
END;
/

SET SERVEROUTPUT ON;

DECLARE
    empid NUMBER := &empid;
    emp_details VARCHAR2(100);
BEGIN
    emp_details := getDetails(empid);
    DBMS_OUTPUT.PUT_LINE(emp_details);
END;
/
