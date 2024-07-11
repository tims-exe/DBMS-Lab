drop table employee;

create table employee(empid number(5), empname varchar(10), salary number(10), dept varchar(10), wef date);

insert into employee values(1, 'ram', '20000', 'CS', '20-04-04');
insert into employee values(2, 'anu', '50000', 'EEE', '15-06-03');
insert into employee values(3, 'rinu', '25000', 'HR', '24-02-06');
insert into employee values(4, 'bob', '30000', 'IT', '18-04-04');
insert into employee values(5, 'sid', '55000', 'AI', '03-06-06');

select * from employee;

create or replace function updates(id in number, sal in number)
return number 
as
d date;
s number;

begin 
    select sysdate into d from dual;
    update employee set salary = salary + (salary * sal/100) where (empid = id);
    update employee set wef = d where (empid = id);
    select salary into s from employee where (empid = id);
    return(s);
end;
/

set serveroutput on;

declare
    id number:=&id;
    salinc number:=&salinc;
    sal number;
begin
    sal:=updates(id, salinc);
    dbms_output.put_line("Updated Salary : "||sal);
end;
/

select * from employee;