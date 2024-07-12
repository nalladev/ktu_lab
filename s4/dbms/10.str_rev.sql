
set serveroutput on;

DECLARE
    str VARCHAR(20) := '&str';
    rev_str VARCHAR(20) := '';
    l INT := LENGTH(str);
BEGIN
    WHILE l > 0 LOOP
        rev_str := (rev_str || SUBSTR(str, l, 1));
        l := l - 1;
    END LOOP;
    dbms_output.Put_line('Reversed String: ' || rev_str);
END;
/
