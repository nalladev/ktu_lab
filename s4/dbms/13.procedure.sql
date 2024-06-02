
CREATE TABLE student (
    rollno NUMBER,
    cname VARCHAR(15),
    mark NUMBER
);

DESC student;

INSERT INTO student VALUES (&rollno, '&cname', &mark);

SELECT * FROM student;

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE getGrade(rno IN NUMBER, grade OUT VARCHAR)
IS
    marks NUMBER(15);
BEGIN
    SELECT mark INTO marks
    FROM student
    WHERE rollno = rno;
    
    IF (marks > 100) THEN    
        grade := 'A';
    ELSIF (marks BETWEEN 70 AND 100) THEN
        grade := 'B';
    ELSIF (marks BETWEEN 50 AND 70) THEN
        grade := 'C';
    ELSIF (marks < 50) THEN 
        grade := 'Fail';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        grade := 'No data found';
END;
/

DECLARE
    rno NUMBER(15);
    grade VARCHAR(15);
BEGIN
    rno := &rno;
    getGrade(rno, grade);
    DBMS_OUTPUT.PUT_LINE('Grade of ' || rno || ' is ' || grade);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data Found');
END;
/
