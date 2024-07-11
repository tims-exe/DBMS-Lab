set serveroutput on;

declare
    n number;
begin   
    n:=30/0;
exception
    when ZERO_DIVIDE then
        dbms_output.put_line('Exception caught');
end;
/