drop table salariedworker;
drop table pension;
create table salariedworker(workerid int,name varchar(20),salary int,tax int,retires varchar(20) default('N'));
create table pension(workerid int,amount int);
insert into salariedworker values(1,'Akash',10000,null,'N');
insert into salariedworker values(2,'Rahul',20000,null,'N');
insert into salariedworker values(3,'Raj',2000,null,'N');
insert into salariedworker values(4,'Ram',7000,null,'N');
select*from salariedworker;

set serveroutput on;
declare
    cursor c is select*from salariedworker;
    s salariedworker%rowtype;

begin
    open c;
    loop
        fetch c into s;
        exit when c%notfound;
        if s.salary<=5000 then  
            update salariedworker set tax=0 where workerid=s.workerid;
        elsif s.salary<=8000 then
            update salariedworker set tax=s.salary*(5/100) where workerid=s.workerid;
        elsif s.salary<=10000 then
            update salariedworker set tax=s.salary*(10/100) where workerid=s.workerid;
        else
            update salariedworker set tax=s.salary*(15/100) where workerid=s.workerid;
        end if;
    end loop;
    close c;
end;
/
select*from salariedworker;

set serveroutput on;
create or replace trigger outofwork after update on salariedworker for each row 
begin
    if :new.retires='Y' then
        insert into pension(workerid,amount) values(:old.workerid,:old.salary/2);
    end if;
end;
/
declare
    id integer;
begin
    id:=&id;
    update salariedworker set retires='Y' where workerid=id;
end;
/
select*from salariedworker;
select*from pension