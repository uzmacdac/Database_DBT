#  If Else Statement 

-- drop procedure abc;
-- delete from tempp;
# --------------------------------------------------------------------------------------------
/*
 delimiter //
create procedure abc()
begin 
	declare x int ;
    select sal into x from emp3 where 
    ename = 'King';
    if x > 4000 then 
		insert into tempp values(x , 'High Salary') ;
    else 
		insert into tempp values(x , 'Low Salary') ;
    end if ;
end ;//
delimiter ; 
call abc();
select * from tempp ;*/
-- drop procedure abc ;
 
-- delete from tempp ;    
# --------------------------------------------------------------------------------------------
/*
delimiter //
create procedure abc()
begin 
	declare x int ;
    select  sal into x from emp3 
    where ename = 'Scott' ;
    if x > 4000 then 
		insert into tempp values(x ,'High Salary');
    else
		insert into tempp values(x ,'Low Salary');
    end if ;
end ;//
delimiter ; 
select * from tempp ; */   
 -- drop procedure abc ;
    
-- select *  from emp3 ;
/*
insert into emp3 
values('Iran Man',6000,'Clerk',30),('Captain America',2000,'Manager',20),('Thor',1000,'Manager',40);
select * from emp3 ; */
# --------------------------------------------------------------------------------------------
/*
delimiter //
create procedure abc()
begin 
	declare x int   ;
	select sal into x from emp3 
    where ename = 'Scott' ;
    if x > 4000 then 
		insert into tempp values(x , 'High Salary');
	else 
		if x < 4000 then
			insert into tempp values(x , 'Low Salary');
		else
			insert into tempp values(x ,'Medium Salary');
		end if ;
    end if ;
end ;//
delimiter ;
call abc();
select * from tempp;  */
-- tempp
-- fir		sec
-- 5000 	High Salary
-- delete from tempp;
 -- select * from tempp ;  
# drop procedure abc;
 
 

# --------------------------------------------------------------------------------------------
/*
delimiter //
create procedure abc()
begin
	declare x int ;
    select sal into x from emp3
    where Ename = 'Thor' ;
    if x > 4000 then 
		insert into tempp values(x , 'High Salary');
	elseif x < 4000 then 
		insert into tempp values(x , 'Low Salary');
    else
		insert into tempp values(x , 'Medium Salary');
    end if ;
end ; // 
delimiter ;
call abc();
select * from tempp;*/
-- tempp
-- fir		sec
-- 4000     Medium Salary
# drop procedure abc;
# delete from tempp ;    
#select * from emp3 ;
desc tempp;  
#     tempp (table structure)
# fir	int	        YES		
# sec	char(15)	YES		

# --------------------------------------------------------------------------------------------
/*
delimiter //
create procedure abc()
begin
	declare x int ;
    select sal into x from emp3 where ename = 'Scott' ;
    if x > 3000 then
		insert into tempp values(x , 'High Salary ');
    end if ;
 end ;// 
 delimiter ;
 call abc();
 select * from tempp ;*/
-- tempp 
-- Output :
--  fir		sec
-- 5000		High Salary
-- drop procedure abc;
-- delete from tempp;
# --------------------------------------------------------------------------------------------

/*delimiter //
create procedure abc()
begin
	declare x int ;
    select sal into x from emp3 where ename = 'King' ;
    if x > 3000 then
		insert into tempp values(x , 'High Salary ');
    end if ;
 end ;// 
 delimiter ;
 call abc();
 select * from tempp ;*/
-- tempp 
-- Output :
--  fir		sec
-- 
-- drop procedure abc;
-- delete from tempp;




# --------------------------------------------------------------------------------------------
