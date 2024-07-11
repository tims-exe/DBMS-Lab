create table customers(acc_no number(16),c_name varchar(15),bal_amt number(10),DOJ date);

create table premium_customers(acc_no number(16),c_name varchar(15),bal_amt number(10),DOF date);

create table nonpremium_customers(acc_no number(16),c_name varchar(15),bal_amt number(10),DOF date);

insert into customers values(101,'anu',150000,'12-12-1998');
insert into customers values(102,'anjana',200000,'19-08-1997'); 
insert into customers values(208,'achu',50000,'8-09-2003');
insert into customers values(305,'gopika',95000,'10-10-2010');
insert into customers values(409,'irene',25000,'4-03-2011');
insert into customers values(111,'dany',100000,'11-05-2010');


set serveroutput on;

declare
    cursor c is select * from customers;
begin
    for i in c
    loop
        if i.bal_amt > 100000 and i.DOJ < '01-01-2010'
        then
            insert into premium_customers values(i.acc_no, i.c_name, i.bal_amt, i.DOJ);
        else
            insert into nonpremium_customers values(i.acc_no, i.c_name, i.bal_amt, i.DOJ);
        end if;
    end loop;
end;
/
