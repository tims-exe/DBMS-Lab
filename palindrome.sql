set serveroutput on;

declare
len number;
palstr varchar2(20):='&palstr';
chkstr varchar2(20);

begin
len:=length(palstr);

for i in reverse 1..len
loop
    chkstr:=chkstr||substr(palstr, i, 1);
end loop;

if chkstr = palstr
then
    dbms_output.put_line(palstr||' is a PALINDROME');
else
    dbms_output.put_line(palstr||' is a not PALINDROME');
end if;
end;
/