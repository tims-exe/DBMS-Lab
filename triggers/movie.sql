create table theatre(id number(5), name varchar(10), language varchar(20), rating number(10));
insert into theatre values(1, 'Junglebook', 'English', 5);
insert into theatre values(2, 'Parava', 'Malayalam', 6);
insert into theatre values(3, 'KGF', 'Tamil', 9);
insert into theatre values(4, 'Odinyan', 'Malayalam', 3);
insert into theatre values(5, 'Fate', 'Japanese', 2);
insert into theatre values(6, 'Hobbit', 'English', 1);

create table outdat(id number(5), name varchar(10));

select * from theatre;

create trigger mvtrg after delete on theatre for each row
begin
    insert into outdat values(:old.id, :old.name);
end;
/

set serveroutput on;
declare
    a1 number:=&movie_id;
    a2 number:=&new_rating;
begin 
    if (a2>5)
    then
        delete from theatre where id = a1;
    end if;
end;
/