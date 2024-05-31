
SET SERVEROUTPUT ON;

DECLARE
  num  NUMBER(5) := &num;
  factorial NUMBER(5) := 1;
BEGIN 
  IF num < 0 THEN
    dbms_output.Put_line('Number is negative.');
  ELSE
    WHILE num > 0 LOOP
      factorial := factorial * num;
      num := num - 1;
    END LOOP;
  dbms_output.Put_line('Factorial = ' || factorial);
  END IF;
END;
/