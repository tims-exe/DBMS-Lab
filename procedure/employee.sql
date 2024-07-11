drop table employee;

create table employee(empid number(5), empname varchar(10), salary number(10), dept varchar(10), wef date);

insert into employee values(1, 'ram', '20000', 'CS', '20-04-04');
insert into employee values(2, 'anu', '50000', 'EEE', '15-06-03');
insert into employee values(3, 'rinu', '25000', 'HR', '24-02-06');
insert into employee values(4, 'bob', '30000', 'IT', '18-04-04');
insert into employee values(5, 'sid', '55000', 'AI', '03-06-06');

select * from employee;

create or replace procedure updates(id in number, sal in number)
as
    d date;
    
    begin
    select sysdate into d from dual;
    update employee set salary = salary + (salary * sal/100) where (empid = id);
    update employee set wef = d where (empid = id);
end updates;
/

set serveroutput on;

declare
    id number:=&id;
    salinc number:=&salinc;
begin
    updates(id, salinc);
end;
/

select * from employee;