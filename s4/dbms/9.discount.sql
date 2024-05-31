
set serveroutput on;

DECLARE
  amount NUMBER(20) := &amount;
  total NUMBER(20) := 0;
  discount NUMBER(20) := 0;
BEGIN 
  IF amount<5000 THEN
    dbms_output.Put_line('Purchase amount < 5000, no discount.');
    total := amount;
    discount := 0;
  ELSE
    dbms_output.Put_line('Purchase amount > 5000, 20% discount.');
    discount := amount * 0.2;
    total := amount - discount;
  END IF;
  dbms_output.Put_line('Purchased amount :' || amount);
  dbms_output.Put_line('discount         :' || discount);
  dbms_output.Put_line('Total payable    :' || total);
END;
/