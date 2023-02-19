

/*
delimiter //
create procedure abc()
begin 
	declare x int ;
    declare hra float ;
    select sal into x from emp3 
    where ename = 'King' ;
    set hra = x * 0.4 ;
    insert into tempp values(x, 'King');
    insert into tempp values(hra , 'HRA');
end;//
delimiter ;
call abc();
select * from tempp ;
-- tempp 
-- Output :
--  fir		sec
-- 3000		King
-- 1200		HRA
-- drop procedure abc ;    
-- delete from tempp ;
*/

# --------------------------------------------------------------------------------------------


/*
delimiter // 
create procedure abc()
begin 
	declare x int ;
    declare y varchar(20) ;
    declare hra float ;
    select sal , job into x , y from emp3 
    where ename = 'King';
    set hra = x * 0.4 ;
    -- set y = lower(y);
    set y = upper(y);
    insert into tempp values(x , y);
    
   end ; //
   delimiter ;
   call abc();
   select * from tempp ;
   -- Output :
--      tempp 
--   fir      sec      
--   3000	  manager
--   3000	  MANAGER
   -- select * from emp3 ;
   
  -- drop procedure abc;
  --  delete from tempp;
	


# --------------------------------------------------------------------------------------------
/*create table Emp3
(Ename varchar(20) , Sal float , Job varchar(20), Deptno int);
show tables ;
insert into emp3 
values('King' , 3000 , 'Manager',10),('Scott' , 5000 ,'Clerk' ,10);
select * from emp3;*/
# --------------------------------------------------------------------------------------------
/*

delimiter // 
create procedure abc(y varchar(20))
begin 
	declare x int   ;
    select all sal into x from emp3 
    where ename = y ;
    insert into tempp values( x , y ) ;
end;//
delimiter ;
call abc('King');
select * from tempp ;*/
-- Output :
--    tempp
-- fir     sec
-- 3000    King 
# delete from tempp;
 -- show procedure status where db = 'shahada' ;    
  -- drop procedure abc ;
  
   

# --------------------------------------------------------------------------------------------

/*delimiter // 
create procedure abc(x char(6) , y float ,  z float )
begin 
	declare hra float ;
    set hra = y * z ;
    insert into tempp values(y,x);
    insert into tempp values(hra ,'HRA');
    end;//
    delimiter ;
    call abc('King' , 3000 , 0.4) ;
    call abc('Scott' , 2500 , 0.3) ;
    select  * from tempp ;
    delete from tempp;    
	drop procedure abc; 
*/
# --------------------------------------------------------------------------------------------
/* delimiter // 
create procedure abc()
begin 
	declare x char(5) default 'King';
    declare y float default 3000 ;
    declare z float default 0.4 ;
    declare hra float ;
    set  hra = y * z ;
    insert into tempp values(y,x);
    insert into tempp values(hra , 'HRA');
end ;//
delimiter ;
call abc();
select * from tempp ;*/
-- Output :
--  fir		sec
-- 3000		King
-- 1200		HRA
-- delete from tempp;    
-- show procedure status where db = 'shahada';
-- drop procedure abc; 
# --------------------------------------------------------------------------------------------