create table emp
(
empno int,
ename varchar(20),
sal float,
deptno int,
job varchar(10),
mgr varchar(20)

);

insert into emp value
(1, 'Arun',8000,1,'M',4),
(2, 'Ali',7000,1,'c',1),
(3, 'kiran',3000,1,'c',1),
(4, 'jack',9000,2,'M',null),
(5, 'Thomas',8000,2,'c',4);
--          Emp
-- Empno   Ename       Sal     Deptno   Job    MGR
-- 1	   Arun			8000	1		M		4
-- 2	   Ali	    	7000	1		C		1
-- 3	   Kiran		3000	1		C		1
-- 4	   Jack		    9000	2		M	   null
-- 5	   Thomas		8000	2		C		4


create table Project_Emp
(ProjNo char(2),EmpNo int );

insert into Project_Emp
values('P1',1),('P1',2),('P1',4),('P2',2),('P2',3),('P3',2),('P3',4),('P3',5);

select * from Project_Emp;
-- We can comment statement in two ways :->   1) -- statement  , 2) # statement
#1) Display the ename who is receiving minimum sal sal= min(sal) .
select ename from emp 
where sal = 
(select min(sal) from emp );

-- select ename , min(sal)  from emp ;  -- The output is meaningless 
# --------------------------------------------------------------------------------------------

#  2)  Display the secondlargest sal.

select  max(sal) from emp
where sal<
(select max(sal) from emp);
-- Output :
-- max(sal)
--  8000
# --------------------------------------------------------------------------------------------

# 3) Display all row who belong to the same deptno as Thomas .
select * from emp 
where deptno = 
(select deptno from emp where Ename = 'Thomas');
-- Output :
-- Empno   Ename       Sal     Deptno   Job    MGR
-- 4	   Jack			9000	2		M	   null
-- 5	   Thomas		8000	2		C		4
# --------------------------------------------------------------------------------------------

# 3) Display all the rows who are doing the same Job as 'Kiran' .alter
select *from emp
where job = 
(select job from emp 
where ename = 'Kiran'); 

update emp set sal = 10000
where job = 
(select temp.job from 
(select job from emp
where ename = 'Kiran')as temp);
rollback ;
select * from emp ;
update emp  set sal = 7000
where ename = 'ali';
update emp set sal = 8000
where ename = 'Thomas';

select * from emp 
where sal > all 
(select min(sal) from emp 
where job = 'M');

# not got the output what was expected
select * from emp 
where sal in
(select min(sal) from emp
where job = 'M')
and job ='M';

select * from emp;
# --------------------------------------------------------------------------------------------
# 4) Display the sal is greater than all manager sal.
select * from emp;
select * from emp 
where sal >= 
(select min(sal) from emp 
where job = 'M');
-- Output :
-- Empno   Ename       Sal     Deptno   Job    MGR
-- 3		Kiran	  10000	     1		 C		1
# --------------------------------------------------------------------------------------------
# 5) Display the Dname that having max(sum(sal))

-- select max(sum(sal)) from emp 
-- group by deptno ;

# group by deptno
#LIMIT 0, 1000	Error Code: 1111. Invalid use of group function	0.078 sec
-- ---------------------------------------------------------------------------------------------
# not working 
select  deptno,sum(sal) from emp 
group by dname
having sum(sal) >
(select max(sum(sal)) from emp
group by deptno);


-- ---------------------------------------------------------------------------------------------
# not working
# Using join 
select  dname , sum(sal) from emp ,dept
where dept.deptno = emp.deptno
group by dname 
having sum(sal) = 
(select max(sum(sal)) from emp 
group by deptno);

select * from emp ;

select * from dept;
-- ---------------------------------------------------------------------------------------------
select dname ,sum(sal) from emp ,dept 
where dept.deptno = emp.deptno
group by dname
having sum(sal) =
(select max(sum_sal) from 
(select sum(sal) sum_sal from emp 
group by deptno )as temp );
-- Output :
-- dname	sum(sal)
-- TRN	 	18000
-- ---------------------------------------------------------------------------------------------
 # Correlated sub_query
 # Display the dname that contain distinct deptno  .
 
 select distinct dname  from emp , dept
 where dept.deptno = emp.deptno ;
 
 -- dname
 --  TRN
 --  EXP
 -- ---------------------------------------------------------------------------------------------
 -- solution 2
 select dname from dept 
 where exists 
 (select deptno from emp
 where dept.deptno = emp.deptno );
 
 -- dname
 -- TRN
 -- EXP
-- ---------------------------------------------------------------------------------------------
select dname from dept where not exists 
(select deptno from emp 
where dept.deptno = emp.deptno);
-- Output :
-- dname
-- MKTG
-- ---------------------------------------------------------------------------------------------






-- ---------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------



-- ---------------------------------------------------------------------------------------------


-- ---------------------------------------------------------------------------------------------



