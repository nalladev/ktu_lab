	
set serveroutput on;

CREATE TABLE odd (num NUMBER);

CREATE TABLE even (num NUMBER);

DECLARE
    i NUMBER := 1;
BEGIN
    DELETE odd;
    DELETE even;
    WHILE i <= 25 LOOP
        IF MOD(i, 2) = 1 THEN
            INSERT INTO odd VALUES (i);
        ELSE
            INSERT INTO even VALUES (i);
        END IF;
        i := i + 1;
    END LOOP;
END;
/

SELECT * FROM odd;

SELECT * FROM even;
