create table worker1(id number(5), name varchar(10), sal number(10));
insert into worker1 values(1, 'riya', 25000);
insert into worker1 values(2, 'febi', 30000);
insert into worker1 values(3, 'varsha', 20000);
insert into worker1 values(4, 'anjali', 50000);
insert into worker1 values(5, 'athira', 35000);

select * from worker1;

create trigger trg after update of sal on worker1 for each row
declare
    diff number(10);
begin
    diff:=:new.sal-:old.sal;
    dbms_output.put_line('Difference in salary is : '||diff);
end;
/

set serveroutput on;
declare
    n number(3):=&workerid;
    nwsal number(5):=&workersal;
begin
    update worker1 set sal=nwsal where id=n;
end;
/

select * from worker1;