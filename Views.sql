use shahada;
create view v1 
as
select empno ,ename from emp ;
grant select on v1 to uzma2;
select * from shahada.emp ;
select * from shahada.v1;
create view v2
as
select * from emp where deptno = 1 ;
grant  select on v2 to uzma2;
select * from shahada.v2;

create or replace  view v1
as 
select ename ,sal*12 annual from emp ;
select * from v1 ;                                                                                              
