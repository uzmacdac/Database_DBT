





#  1. Select from any table a number and determine whether it is within a given range (for 
#     example, between 1 and 10).

#create table range_1
#(rno int );
#insert into range_1 values(1),(12),(3),(15),(19),(5),(4),(3),(6),(7),(8),(9),(10),(18);
#create table rtemp(Num int , checkRange varchar(30));
delimiter //
create procedure rangeNum()
begin 
	declare a int ;
	declare y int default 0 ;
    declare c1 cursor for select * from range_1 for update ;
    declare continue handler for not found
    set y = 1 ;
    open c1 ;
    cursor_c1 : loop 
		fetch c1 into a ;
        if y=1 then
			leave cursor_c1 ;
        end if ;
        if a between 1 and 10  then 
			insert into rtemp values(a,'In between 1 to 10' );
        else
			insert into rtemp values(a,'Not in between 1 to 10');
         end if ;
      end loop cursor_c1 ;
      close c1 ;
end ; //
delimiter ;
call rangeNum();

select * from rtemp ;
drop procedure range_1 ;
delete from rtemp ;      














# 11. Write a stored procedure to convert a temperature in Fahrenheit (F) to its equivalent in
#    Celsius (C). The required formula is:- C= (F-32)*5/9
#    Insert the temperature in Centigrade into TEMPP table. Calling program for the stored
#    procedure need not be written.

#create table temperature
#(Fah float , celsius float );

/*delimiter //
create procedure contocel(f float )
begin 
	-- declare f float ;
    declare c float ; 
    set c = (f - 32)*5/9 ;
    insert into temperature values(f , c);
end ; //
delimiter ;
call contocel(50);
select * from temperature ;   */
#drop procedure contocel;
#delete from temperature;



#--------------------------------------------------------------------------------------------------------------------------
# 12. Write a stored function by the name of Num_cube. The stored function should return the
#     cube of a number ‘N’. The number ‘N’ should be passed to the stored function as a
#     parameter. Calling program for the stored function need not be written
#create table CubeTemp(Num int , CubeOfNum int);

/*
delimiter //
create function Num_cube(N int)
returns int
deterministic 
begin
	return N * N * N ;
end ;//
delimiter ;

delimiter // 
create procedure cubeOfN(N int)
begin
	declare x int ;
    
    set x = Num_cube(N);
    insert into CubeTemp values(N ,x);
end ;//
delimiter ;
call cubeOfN(10);
#drop function Num_cube;
#delete from CubeTemp;
#drop procedure cubeOfN;
select * from CubeTemp ;*/
    
    