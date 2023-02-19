#create table f1temp
#(fno int ,fstring varchar(20));

/*delimiter //
create function f1()
returns  int
deterministic 
begin 
	return 10 ;
end ; //
delimiter ;

delimiter //
create procedure pqr()
begin
	declare x int ;
    set x= f1();
    insert into f1temp values(x,'after f1');
end ;//
delimiter ;
call pqr();
select * from f1temp ;    */
#--------------------------------------------------------------------------------------------
#create table f2temp
#(sal int , fstr varchar(25));

#drop table f2temp ;
delimiter //
create function f2( y int)
returns boolean
deterministic 
begin 		
	if y > 5000 then 
		return true;
    else 
		return false ;
    end if ;
end ; //
delimiter ;

delimiter //
create procedure p1()
begin
		declare  x int ;
        select sal into x from emp 
        where ename = 'Arun ' ;
        if f2(x) then 
			insert into f2temp values (x, '> 5000');
        else
			insert into f2temp values(x , '< 5000');
        end if ;
end ; //
delimiter ;
call p1();
select * from f2temp ;        
#drop procedure p1;
        
#drop function f2;
-- Output
-- f2temp
-- sal 	fstr
-- 1	<5000
#select * from emp;
#delete from f2temp;

