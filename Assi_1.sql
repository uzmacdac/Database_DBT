use shahada;
create table suppliers
(sno int , status int,city varchar(20));
drop table suppliers;
select * from suppliers;
show tables;
-- delete table suppliers;
drop tables emp;
show tables;
-- create table b(`p#`char(2));
select Sname ,Status,
   	  case
   	 when Status = 10 then 'One'
   	  when Status = 20 then 'two'
   	  when Status = 30 then 'three'
   	  end from S_Supplier;
