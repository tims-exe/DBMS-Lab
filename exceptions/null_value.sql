create table emp(id int not null, name varchar(20));

set serveroutput on;
declare
    nullException EXCEPTION;
    PRAGMA EXCEPTION_INIT(nullException, -1400);
begin
    insert into emp values(NULL, NULL);
exception
    when nullException then
        dbms_output.put_line('Exception caught');
end;
/
