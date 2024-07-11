create or replace procedure largest(a1 in number, b1 in number, c1 out number)
as
begin
if(a1>b1)
then
    c1:=a1;
else
    c1:=b1;
end if;
end largest;
/

set serveroutput on;

declare
a number :=&a;
b number :=&b;
c number :=0;

begin
largest(a, b, c);

dbms_output.put_line('Largest : '||c);
end;
/