set serveroutput on;

declare
f number:=0;
s number:=1;
t number;
n number:=&n;
i number;

begin
dbms_output.put_line('Fibonacci series is : ');
dbms_output.put_line(f);
dbms_output.put_line(s);

for i in 2..n
loop
    t:=f+s;
    f:=s;
    s:=t;
    dbms_output.put_line(t);
end loop;
end;
/