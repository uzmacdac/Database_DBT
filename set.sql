create table  emp1
(Empno int , Ename varchar(25));
insert into emp1
values(1 , 'A'),
(2,'B'),
(3,'C');

select * from emp1;
create table emp2
(Empno int  ,Ename varchar(20));
insert into emp2
values(1,'A'),(2,'B'),(4,'D'),(5,'E');
select * from emp2;
-- ----------------------------------------------------------------------------------------------
-- Set Operator :
-- 1) Union  
-- 2) Union all
-- 3) Intersect   available in Oracle  not in mysql .
-- 4) Minus    available in Oracle  not in mysql .
-- ----------------------------------------------------------------------------------------------
select empno , ename from emp1
union
select empno , ename from emp2 ;
-- empno  ename 
--   1		A
--   2		B
--   3		C
--   4		D
--   5		E

-- ---------------------------------------------------------------------------------------------
-- Intersect and Minus are set operator available in Oracle  not in mysql .
-- Union all

select empno , ename from emp1 
union all
select empno , ename from emp2 
Order by empno;
-- Output :
-- empno  ename 
--  1	A
--  1	A
--  2	B
--  2	B
--  3	C
--  4	D

-- ---------------------------------------------------------------------------------------------



-- ---------------------------------------------------------------------------------------------


-- -------------------------------------------------------------- ---------------------------------

-- ----------------------------------------------------------------------------------------------


-- ----------------------------------------------------------------------------------------------




-- ----------------------------------------------------------------------------------------------