CREATE TABLE accdetails(accno number(10),cname varchar(20),lastdate date,amount number(7));

INSERT INTO accdetails VALUES(101,'anu','08-05-2024',50000);
INSERT INTO accdetails VALUES(102,'anagha','08-04-2024',100000);
INSERT INTO accdetails VALUES(103,'elizabeth','17-05-2024',25000);
INSERT INTO accdetails VALUES(104,'george','06-04-2024',300000);
INSERT INTO accdetails VALUES(105,'albyn','15-05-2024',650000);

CREATE TABLE inactive_customer(accno number(10),cname varchar(20));

set serveroutput on;

declare
    cursor c1 is select * from accdetails;
    a accdetails %rowtype;
    n number;
    i number;

begin
    open c1;
    loop
        fetch c1 into a.accno, a.cname, a.lastdate, a.amount;
        exit when c1 %notfound;

        n:=months_between(sysdate, a.lastdate);
        if n>=1 
        then
            insert into inactive_customer values(a.accno, a.cname);
        else 
            if a.amount < 250000
            then 
                i:=a.amount*0.05;
                dbms_output.put_line("interest is : "||i);
            elsif a.amount > 250000 and a.amount < 500000
            then
                i:=a.amount*0.1;
                dbms_output.put_line("interest is : "||i);
            elsif a.amount > 500000
            then    
                i:=a.amount*0.15;
                dbms_output.put_line("interest is : "||i);
            else
                dbms_output.put_line("error");
            end if;
        end if;
    end loop;
end;
/

select * from accdetails;
select * from inactive_customer;