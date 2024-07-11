/* creating the package */
create or replace package pkg as
    procedure largest(a in number, b in number);
    function biggest(a in number, b in number) return number;
end pkg;
/

/* package body with the functions and procedures */

create or replace package body pkg as
    procedure largest(a in number, b in number) 
    as
    c number;
    begin
        if (a>b) then
            c:=a;
        else 
            c:=b;
        end if;
        dbms_output.put_line('Largest : '||c);
    end largest;

    function biggest(a in number, b in number)
    return number
    as
    c in number;
    begin
        if (a>b) then
            c:=a;
        else 
            c:=b;
        end if;
        return(c);
    end;
end pkg;
/


set serveroutput on;
declare
    a number;
    b number;
    c number;
begin
    a:=&a;
    b:=&b;
    pkg.largest(a,b);
    c:=pkg.biggest(a,b);

    dbms_output.put_line('Biggest : '||c);
end;
/