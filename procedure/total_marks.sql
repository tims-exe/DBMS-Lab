create table student(id number, name varchar(20), marks number);

INSERT INTO student VALUES (1, 'Alice', 85);
INSERT INTO student VALUES (2, 'Bob', 78);
INSERT INTO student VALUES (3, 'Charlie', 92);
INSERT INTO student VALUES (4, 'Diana', 66);
INSERT INTO student VALUES (5, 'Ethan', 74);

create or replace procedure prcd(s in number)
as
    cursor c is select * from student;
    std student %rowtype
    sum number :=0;
begin
    open c;
    loop
        fetch c into std.id, std.name, std.marks;
        exit when c %notfound;
        sum:= sum + std.marks;
        if std.id = s then
            dbms_output.put_line('Student name: '||std.name||' marks : '||std.marks);
        end if;
    end loop;
end prcd;
/

set serveroutput on;
declare 
    i number:=&i;
begin
    prcd(i);
end;
/

