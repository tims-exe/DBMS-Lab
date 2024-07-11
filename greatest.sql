set serveroutput on;

declare
a number;
b number;
c number;

begin
a:=&a;
b:=&b;
c:=&c;

if (a>b) and (a>c)
then
    dbms_output.put_line('A is the Greatest '||A);
elsif (b>a) and (b>c)
then
    dbms_output.put_line('B is the Greatest '||B);
else
    dbms_output.put_line('C is the Greatest '||C);
end if;
end;
/