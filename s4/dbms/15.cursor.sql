CREATE TABLE student (
    regno NUMBER,
    cname VARCHAR(15),
    mark1 NUMBER,
    mark2 NUMBER  
);

DESC student;

INSERT INTO student VALUES (&rollno, '&cname', &mark1, &mark2);

SELECT * FROM student;

CREATE TABLE pass (
    regno NUMBER,
    cname VARCHAR(15),
    mark1 NUMBER,
    mark2 NUMBER 
);

DESC pass;

CREATE TABLE fail (
    regno NUMBER,
    cname VARCHAR(15),
    mark1 NUMBER,
    mark2 NUMBER  
);

DESC fail;

SET SERVEROUTPUT ON;

DECLARE
    CURSOR cursor1 IS SELECT * FROM student;
BEGIN
    FOR rec IN cursor1 LOOP
        IF ((rec.mark1 + rec.mark2) >= 80 AND rec.mark1 >= 35 AND rec.mark2 >= 35) THEN 
            INSERT INTO pass
            VALUES (rec.regno, rec.cname, rec.mark1, rec.mark2);
        ELSE
            INSERT INTO fail (regno, cname, mark1, mark2) 
            VALUES (rec.regno, rec.cname, rec.mark1, rec.mark2);
        END IF;
    END LOOP;
END;
/
