/* 1. Write a program that computes the perimeter and the area of a rectangle. Define 
your own values for the length and width. (Assuming that L and W are the length 
and width of the rectangle, Perimeter = 2*(L+W) and Area = L*W. */

delimiter //
create procedure abc()
begin
	declare l int default 10;
    declare w int default 20;
    declare Rperi float;
    declare Rarea float;
    set Rperi = 2*(l+w);
    set Rarea = l*w;
    insert into tempp values(Rperi,'Perimiter');
    insert into tempp values(Rarea,'Area');
end;
// delimiter ;
call abc();
select * from tempp;
drop procedure abc;
truncate table tempp;

----------------------------------------------------------------
/* 2.Write a program that declares an integer variable called num, assigns a value to it, 
and computes and inserts into the tempp table the value of the variable itself, its 
square, and its cube. */

delimiter //
create procedure abc()
begin
    declare num int default 20;
    declare Square float;
    declare Ncube float;
    set Square = num*num;
    set Ncube = Square*num;
    insert into tempp values(Square,'Square');
    insert into tempp values(Ncube,'Ncube');
end;
// delimiter ;
call abc();
select * from tempp;
drop procedure abc;
delete from tempp;
------------------------------------------------------------
/* 3.Convert a temperature in Fahrenheit (F) to its equivalent in Celsius (C) and vice 
versa. The required formulae are:- C= (F-32)*5/9 
F= 9/5*C + 32  */

delimiter // 
create procedure abc()
begin 
	declare C int default 30;
    declare F float default 100;
    declare cel float;
    declare feh float;
    set cel = (F-32)*5/9;
    set feh = round((9/5*C + 32),2); -- round not working need to check again
    insert into tempp values (C,feh);
    insert into tempp values (F,cel);
end;
// delimiter ;
call abc();
select * from tempp;
drop procedure abc;
delete from tempp;
-----------------------------------------------------
/* 4. Convert a number of inches into yards, feet, and inches. For example, 124 inches 
equals 3 yards, 1 foot, and 4 inches. */
delimiter //
create procedure abc()
begin
	declare num int default 124;
    declare yard float;
    declare foot float;
    declare inches float;
    set yard = round(124 / 36);
    set foot = round((num-(yard*36))/12);
    set inches = round(((num-(yard*36))/12-foot)*12);
    insert into tempp values (num,'Number');
    insert into tempp values (yard,'Yard');
    insert into tempp values (foot,'foot');
    insert into tempp values (inches,'inches');
end;
// delimiter ;
call abc();
select * from tempp;
drop procedure abc;
delete from tempp;
---------------------------------------------------------
/* 5.Write a program that enables a user to input an integer. The program should then 
state whether the integer is evenly divisible by 5. */
delimiter //
create procedure abc(num int)
begin
	if mod(num,5)=0 then
		insert into tempp values (num,'Divisible');
	else
		insert into tempp values (num,'Not div');
	end if;
end;
// delimiter ;
call abc(5); -- divisibale 
call abc(12);-- Not divisible
select * from tempp;
drop procedure abc;
delete from tempp;
---------------------------------------------------------
/* 6. Your block should read in two real numbers and tell whether the product of the two 
numbers is equal to or greater than 100. */
delimiter //
create procedure abc(a int,b int)
begin
	declare mul int ;
    set mul = a * b;
    if mul > 100 then 
		insert into tempp values(mul,'Greater');
	else
		insert into tempp values(mul,'smaller');
	end if;
end;
// delimiter ;
call abc(12,12);
call abc(9,9);
select * from tempp;
drop procedure abc;
delete from tempp;

==================================================================










