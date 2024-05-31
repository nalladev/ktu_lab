CREATE TABLE account (
    acc_no NUMBER,
    cname VARCHAR(15),
    balance NUMBER CHECK (balance > 250)
);

DESC account;

INSERT INTO account VALUES (&acc_no, '&cname', &balance);

SELECT * FROM account;

SET SERVEROUTPUT ON;

DECLARE
    acno NUMBER;
    aname VARCHAR(50);
    balance NUMBER;
    amount NUMBER;
BEGIN
    acno := &acno;
    SELECT balance, cname INTO balance, aname 
    FROM account 
    WHERE acc_no = acno;
    
    dbms_output.Put_line('Welcome ' || aname);
    
    amount := &amount;
    
    IF balance - amount > 250 THEN
        balance := balance - amount;
        UPDATE account 
        SET balance = balance
        WHERE acc_no = acno;
        
        dbms_output.Put_line('Rs ' || amount || ' debited successfully!');
        dbms_output.Put_line('Balance: ' || balance || ' Rupees'); 
    ELSE
        dbms_output.Put_line('Requested amount exceeds available balance out of minimum balance Rs 250.');
        dbms_output.Put_line('Debitable amount: ' || (balance - 250) || ' Rupees'); 
    END IF;
END;
/
