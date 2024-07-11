set serveroutput on;

declare 
Var1 integer;
Var2 integer;
Var3 integer;

begin
Var1:=&var1;
Var2:=&var2;
Var3:=var1+var2;

dbms_output.put_line("Sum is "||var3);

end;
/
