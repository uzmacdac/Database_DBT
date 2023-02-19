create database demo2;
use demo2;
create table tempp ( fir float, sec float);

delimiter //
create procedure abc()
begin 
declare length float default 15;
declare width float default 20;
declare peri float;
declare area float;
set peri=2*(length+width);
set area = length*width;
insert into tempp values (peri,area);
end; //

delimiter ; 
call abc;
select * from tempp;

create table tempp2 (num int , sqr int,cub int);
delimiter //
create procedure abc2()
begin
declare num int default 4;
declare sqr int;
declare cub int;
set sqr = num *num;
set cub = num*num*num;
insert into tempp2 values (num,sqr,cub);
end; //

delimiter ;
call abc2;
select * from tempp2;

create table tempp3 (cel float, far float);
delimiter //
create procedure abc3(c float)
begin 
declare f float;
set f=(9/5)*c+32;
insert into tempp3 values (c,f);
end; //
delimiter ;
call abc3(100);
select * from tempp3;

delimiter //
create procedure abc4(f float)
begin 
declare c float;
set c=(f-32)*5/9;
insert into tempp3 values (c,f);
end; //
delimiter ;

call abc4(143);
select * from tempp3;

create table tempp4 (value int,yard int,foot int,inch int);

delimiter // 
create procedure metric( val int)
begin
declare y int;
declare f int;
declare i int;
declare r int;
set y= val/36;
set r= mod(val,36);
set f = r/12;
set i = mod(r,12);
insert into tempp4 values (val,y,f,i);
end; //
delimiter ;

call metric(124);
select * from tempp4;

create table tempp5 (value int,answer char(20));
delimiter //
create procedure divisible5(value int)
begin 
	  declare y char(20);
	  if mod(value,5)=0 then set y='divisible';
	  else set y='not divisible';
	  end if;
	  insert into tempp5 values (value , y);
	  
end; // 

delimiter ;

call divisible5(34);
select * from tempp5;

create table real1 (num1 int,num2 int);
drop table real1;
create table real1 (num1 int,num2 int,product int,result char(10));

delimiter //
create procedure block(n1 int,n2 int)
begin
if n1*n2=100 then insert into real1 values (n1,n2,n1*n2,'equal');
else 
	if n1*n2>100 then insert into real1 values (n1,n2,n1*n2,'greater');
	else 
    insert into real1 values (n1,n2,n1*n2,'lesser');
    end if;
    
    end if;
end; //
 delimiter ;
 call block(10,10);
 select * from real1;
 delete from real1 where num1=10;
 select * from real1;
 
 drop procedure block;
 
 create table number (num int,result boolean);
 
 delimiter //
 create procedure range1 (n int)
 begin
 declare res boolean;
 if n between 1 and 10 then set res= true;
 else set res=false;
 end if;
 insert into number values (n,res);
 end; //
 
 delimiter ;
 call range1(5);
 select * from number;
 
 create table triangle (s1 int,s2 int,s3 int,result char(15));
 
 delimiter //
 create procedure sides (s1 int,s2 int,s3 int)
 begin
 declare result char(15);
 if s1+s2 > s3 and s2+s3 >s1 then
 set result = 'valid';
 else 
 set result = 'not valid';
 end if;
 insert into triangle values (s1,s2,s3,result);
 end; //
 delimiter ;
 call sides(10,9,20);
 select * from triangle;
 drop procedure sides;
 
 
 
 








