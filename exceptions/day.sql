set serveroutput on;

declare
    ex EXCEPTION;
begin
    if TO_CHAR(sysdate, 'DY')=='SUN' then
        RAISE ex;
    end if;
EXCEPTION
    when ex then
        dbms_output.put_line('Exception raised');
end;
/