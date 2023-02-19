#use shahada;
#delete from tempp;
#drop procedure abc;
#-----------------------------------------------------------------------------------------------
#create table tempp(fir float , sec varchar(25));
#----------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------



#----------------------------------------------------------------------------------------------------
# create table emp4
#(Empno int , Ename varchar(20) , sal float , Deptno int );

#insert into emp4 values(1,'A',5000,1),(2,'B',6000,1),(3,'C',7000,1),(4,'D',9000,2);
#insert into emp4 values(5,'E', 8000 , 2);
#select * from  emp4;

delimiter //
create procedure abc()
begin 
	declare a int  ;
    declare b varchar(20);
    declare c float ;
    declare d int ;
    declare y  int default 0;
    declare c1 cursor for select * from emp4  for update ;
    declare continue handler for not found 
    set y = 1 ;
    open c1 ;
    cursor_c1_loop : loop
		fetch c1 into a , b , c , d ;
        if y = 1 then 
			leave cursor_c1_loop ;
        end if ;
        if c > 7000 then 
			
     end loop cursor_c1_loop ;
end ; //
delimiter ;
call abc();
#drop procedure abc;
select * from emp4;     
#----------------------------------------------------------------------------------------------------


/*
delimiter //
create procedure abc()
begin 
	declare a int ; 
	declare b  varchar(20);
    declare c float ;
    declare d int ;
    declare e varchar(10);
    declare f varchar(20);
    declare y int default 0 ;
    declare c1 cursor for select * from emp 
    for update;
    declare continue handler for not found 
    set y = 1 ;
    open c1 ;
    cursor_c1_Loop : Loop
		fetch c1 into a , b , c , d , e , f ;
        if y = 1 then 
			leave cursor_c1_loop ;
        end if ;
		if c > 7000 then 
			update emp set sal = sal + 1 where empno = a ;
		end if ;
    end loop cursor_c1_loop ;
    commit ;
    close c1 ;
end ; //
delimiter ;
call abc();*/
#drop procedure abc;    
 #select * from emp ;

#----------------------------------------------------------------------------------------------------
/*delimiter //
create procedure abc()
begin 
	declare a int ; 
	declare b  varchar(20);
    declare c float ;
    declare d int ;
    declare e varchar(10);
    declare f varchar(20);
    declare y int default 0 ;
    declare c1  cursor for select * from emp ;
    declare continue handler for not found  set y = 1 ;
    open c1 ;
    cursor_c1 : loop
		fetch c1 into a , b , c , d ,e ,f;
		if y=1 then
			leave cursor_c1 ;
        end if ;
        update emp set sal = sal + 1 ;
      end loop cursor_c1 ;
      close c1 ;
 end ; //
 delimiter ;
call abc();
# select * from emp3 ;
drop procedure abc;

select * from emp ;*/
#desc emp;
#----------------------------------------------------------------------------------------------------
/*delimiter // 
create procedure abc()
begin 
	declare x int default 1 ;
    repeat 
		insert into tempp values(x , 'in loop');
		set x = x + 1 ;
    until x > 5 
	end repeat ;
end ; //
delimiter ;
call abc() ;
select * from tempp ; */

#Output :
# 1	in loop
# 2	in loop
# 3	in loop
# 4	in loop
# 5	in loop
#drop procedure abc;
#delete from tempp ;    
#---------------------------------------------------------------------------------------------------- 
/*
delimiter // 
create procedure abc()
begin 
	declare x int default 1 ;
    declare y int default 1 ;
    while x < 5 do 
		while y < x do 
			insert into tempp values(y , 'in y loop ');
            set y = y + 1 ;
         end while ;
         insert into tempp values(x , 'in x loop ');
         set x = x + 1 ;
    end while ;
end ; //
call abc();    

select * from tempp;*/
#drop procedure abc;
# delete from tempp ;
# Output :
# 1	in x loop 
# 1	in y loop 
# 2	in x loop 
# 2	in y loop 
# 3	in x loop 
# 3	in y loop 
# 4	in x loop 
            
#----------------------------------------------------------------------------------------------------

# Nested Loop
/*delimiter // 
create procedure abc()
begin 
	declare x int default 1 ;
    declare y int default 1 ;
    while x < 3 do 
		while y < 3 do 
			insert into tempp values(y , 'in  y loop ');
			set y = y+1 ;
		end while ;  
        insert into  tempp values(x , 'x in loop');
        set x = x + 1 ;
     end while ;
end ; //
delimiter ; 
call abc();
select * from tempp ;    */
-- Output :
-- 1	in  y loop 
-- 2	in  y loop 
-- 1	x in loop
-- 2	x in loop 
#drop procedure abc;
#delete from tempp;
#----------------------------------------------------------------------------------------------------
/*
delimiter //
create procedure abc(x int)
begin 
	while x>0 do
		insert into tempp values(x , 'in while');
        set x= x-1 ;
        end while ;
end ;//
delimiter ;
call abc(5);
select * from tempp;      */
-- Output :  
-- 5	in while
-- 4	in while
-- 3	in while
-- 2	in while
-- 1	in while

#----------------------------------------------------------------------------------------------------
/*delimiter // 
create procedure abc()
begin 
	declare x int default 1 ;
    while x < 10 do
		insert into temp values(x , 'In while loop');
        set x = x + 1 ;
    end while ;
end ; //
delimiter ;
call abc();
select * from temp ;    */