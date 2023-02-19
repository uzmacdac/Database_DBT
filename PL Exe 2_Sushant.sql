create table numb (num int,na varchar(15) );
insert into numb values
(1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E'),(6,'F'),(7,'G'),(8,'H'),(9,'I'),(10,'J') ;
insert into numb values (11,'K'),(12,'L'),(13,'M');
drop table numb;
select * from numb;

/* 1. Select from any table a number and determine whether it is within a given range (for 
example, between 1 and 10). */
delimiter //
create procedure abc(y varchar(10))
begin 
	declare nos int ;
    select num into nos from numb 
    where na = y;
    if nos between 1 and 10 then
		insert into tempp values(nos,'yes');
	else
		insert into tempp values(nos,'no');
	end if;    
end;
// delimiter ;
call abc('I');
call abc('J');
call abc('K');
call abc('M');
call abc('C');
select * from tempp;
drop procedure abc;
delete from tempp;
---------------------------------------------------------------------------------
/* 2. Select from any table three positive integers representing the sides of a triangle, and 
determine whether they form a valid triangle. Hint: In a triangle, the sum of any two 
sides must always be greater than the third side. */

delimiter //
create procedure abc(a int, b int,c int)
begin 
	if (a+b) > c or (a+c) > b or (b+c) > a then
		insert into tempp values (1,'Valid');
	else
		insert into tempp values (1,'NotValid');
	end if;
end;
// delimiter ;
call abc(3,4,5);
call abc(7,8,9);
call abc(3,4,4);
call abc(6,4,5);
call abc(6,6,25);
select * from tempp;
drop procedure abc;
delete from tempp;
------------------------------------------------------------------------------------
/* 3. Check if a given a year is a leap year. The condition is:- year should be (divisible by 4 
and not divisible by 100) or (divisible by 4 and divisible by 400.). The year should be 
Selected from some table.  */

create table yeart (yr int,yrno int);
insert into yeart values (2010,1),(2005,2),(2022,3),(2018,4),(2000,5);
insert into yeart values (2020,6),(2008,7),(2024,8);
select * from yeart;
drop table yeart;

delimiter // -- wrong need to check 
create procedure abc(x int)
begin
	declare yrr int ;
    select yr into yrr from yeart 
    where yrno = x ;
	if (yrr / 4)=0 and (yrr /100) != 0  then
		insert into tempp values(x,'leap');
	elseif (yrr / 4)=0 and (yrr /400)=0 then
		insert into tempp values(x,'leap');
	else 
		insert into tempp values(x,'Not leap');
	end if;
end;
// delimiter ;
call abc(1);
call abc(2);
call abc(3);
call abc(4);
call abc(5);
call abc(6);
call abc(7);
call abc(8);
select * from tempp;
drop procedure abc;
delete from tempp;
----------------------------------------------------------------
/* 4.Write a program that Selects from any table two character strings. Your program should 
then determine if one character string exists inside another character string. */
select * from emp1;
insert into emp1 values ('AB',1),('CD',2),('BC',3);
delimiter //
create procedure abc(x int)
begin
	declare str varchar(10);
	declare str1 varchar(10);    
    declare y varchar(10);
    select ename into str from emp1 
    where eno  = x;
    select ename into str1 from emp1 
    where eno  = x+1;
    set y = substr(str,1,1);
    if (instr( str1,y))!=null then 
		insert into tempp values (x,'found');
	else
		insert into tempp values (x,'Notfound');
	end if;
end;
// delimiter ;
call abc(1);
call abc(2);
call abc(3);
select * from tempp;
drop procedure abc;
delete from tempp;
==========================================================










