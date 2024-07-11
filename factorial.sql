set serveroutput on;

declare
i number(4):=1;
n number(4):=&n;
f number(4):=1;

begin
for i in 1..n
loop
    f:=f*i;
end loop;

dbms_output.put_line('factorial of '||n||' is : '||f);
end;
/