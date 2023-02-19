use shahada;

# 3. Check if a given a year is a leap year. The condition is:- year should be (divisible by 4 
#    and not divisible by 100) or (divisible by 4 and divisible by 400.). The year should be 
#    Selected from some table. 
#create table Leap1(lno int , year int );
#insert into Leap1 values(1,1600),(2,1900),(3,2022),(4,2020);
#drop table leap_1 ;
#create table test (tno int , Tyear varchar(30));
#show tables;
#select * from leap1;

delimiter // 
create procedure leapyear()
begin 
	declare a int ;
    declare b int ;
    declare y int default 0 ;
    declare c boolean default false;
    declare c1 cursor for select * from Leap1 for update ; 
	declare continue handler for not found 
    set y = 1 ;
    open c1 ;
    cursor_c1 : loop
		fetch c1 into a , b ;
        if y=1 then 
			leave cursor_c1 ;
         end if ;   
		if (mod(b,4)=0 and mod(b,100) !=0 ) or mod(b,400)=0 then 
				insert into test values(b , 'Year is Leap year');
         else
				insert into test values(b ,'Year is not Leap year');
         end if ;
      end loop cursor_c1 ;   
end ; //
delimiter ;
call leapyear();      
select * from test ;    

drop procedure leapyear;

 #--------------------------------------------------------------------------------------------------------
# 4. Write a program that Selects from any table two character strings. Your program should 
#    then determine if one character string exists inside another character string.
create table twostring
(tno int , tstring char(2));
insert into twostring 
values(1,'AB'),(2,'CD'),(3,'BC');

delimiter // 
create procedure ischarExists()
begin
	declare a int ;
    declare b char(2);
    declare c boolean default false ;
    declare y int default 0 ;
    declare c1 cursor for select * from twostring for update ;
    declare continue handler for not found 
    set y = 1 ;
    cursor_c1_loop : loop
		fetch c1 into a,b ;
		if y=1 then
			leave cursor_c1_loop ;
        end if ;
        if instr(
        
    
