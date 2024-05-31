
set serveroutput on;

DECLARE
  n NUMBER(5) := &n;
  sum NUMBER(5) := 0;
  i NUMBER(5) := 1;
  j NUMBER(5) := 1;
BEGIN 
  WHILE i<=n LOOP
    sum := sum + j;
    j := j + 2;
    i := i + 1;
  END LOOP;
  dbms_output.Put_line('Sum of first ' || n || ' odd numbers = ' || sum);
END;
/