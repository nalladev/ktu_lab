
set serveroutput on;

DECLARE
    str VARCHAR(20) := '&str';
    rev_str VARCHAR(20) := '';
    i INT := LENGTH(str);
BEGIN
    WHILE i > 0 LOOP
        rev_str := (rev_str || SUBSTR(str, i, 1));
        i := i - 1;
    END LOOP;
    dbms_output.Put_line('Reversed String: ' || rev_str);
END;
/
