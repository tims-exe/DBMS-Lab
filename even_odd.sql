set serveroutput on;

create table even(nos number(2));
create table odd(nos number(2));

declare
n number:=&n;

begin
for i in 1..n;
loop
    if mod(i,2) = 0
    then
        insert into even values(i);
    else 
        insert into odd values(i);
    end if;
end loop;
end;
/