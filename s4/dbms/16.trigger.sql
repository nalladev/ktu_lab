CREATE TABLE trigger (
    a NUMBER,
    b NUMBER
);

DESC trigger;

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER checknum
BEFORE INSERT OR UPDATE
ON trigger
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        IF :NEW.a + :NEW.b <= 75 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Number less than 75');
        END IF;
    END IF;
    IF UPDATING THEN
        IF :NEW.a + :NEW.b <= 75 OR :NEW.b < :OLD.b THEN
            RAISE_APPLICATION_ERROR(-20001, 'B should not be small');
        END IF;
    END IF;
END;
/

INSERT INTO trigger VALUES (&a, &b);

UPDATE trigger 
SET b = 1
WHERE b = 40;

SELECT * FROM trigger;
