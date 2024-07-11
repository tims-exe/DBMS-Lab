create or replace function biggest(a1 in number, b1 in number)
return number 
as 
c1 number;

begin
if(a1>b1)
then
    c1:=a1;
else
    c1:=b1;
end if;
return(c1);
end;
/

set serveroutput on;
declare
a number :=&a;
b number :=&b;
c number;

begin
c:=biggest(a, b);

dbms_output.put_line("Largest : "||c);
end;
/
