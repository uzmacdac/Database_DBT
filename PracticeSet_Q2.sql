2. Create EMP table with the following structure:-
EMPNO INT(4)
ENAME VARCHAR (10)
JOB VARCHAR (9)
HIREDATE DATE
SAL FLOAT(7,2)
COMM FLOAT(7,2)
DEPTNO INT(2)

#----------------------------------------------------------------------------------------------------
create table DEPT1
(deptno int(2) , dname varchar(14) , Loc varchar(13) );
#----------------------------------------------------------------------------------------------------

insert into DEPT1 values(10 , 'ACCOUNTING' , 'NEW YORK'),(20 ,'RESEARCH' , 'DALLAS'),(30 , 'SALES','CHICAGO'),(40 , 'OPERATION' , 'BOSTON');
#----------------------------------------------------------------------------------------------------------------------------------------

create table EMP_1
(EMPNO int ,ENAME varchar(10), JOB varchar(9) , HIREDATE date , SAL float, COMM float , DEPTNO int);


drop table emp_1;
#------------------------------------------------------------------------------------------------------------------

insert into EMP_1 
values(7839 , 'KING' , 'MANAGER', '1991-11-17', 5000 ,NULL, 10 ),
(7698,  'BLAKE' , 'CLERK' , '1981-05-01', 2850 , NULL ,30 ),
(7782 , 'CLARK' , 'MANAGER' , '1981-06-09',2450 ,NULL ,10),
(7566 , 'JONES' , 'CLERK' , '1981-04-02' , 2975 , NULL , 20),
(7654 , 'MARTIN' ,  'SALESMAN ' , '1981-09-28' , 1250 , 1400 , 30),
(7499 ,'ALLEN' ,'SALESMAN' , '1981-02-20' , 1600  , 300 ,30);
select  * from emp_1;
#----------------------------------------------------------------------------------------------------

# 1. Find the names of all employees hired in the month of February (of any year).

	select ename from emp_1 
    where month(hiredate) =2 ;
	
    select  * from emp_1;
    
#----------------------------------------------------------------------------------------------------

# 2. Find the names of all employees whose name ends with the letter ‘M’.

	select ename from emp 
		where ename like '%M' ;

	select  * from emp_1 ;


#----------------------------------------------------------------------------------------------------

#3. Display the ENAME and JOB for all employees who belong to the same DEPTNO as employee ‘KING’.

	select ename , job from emp_1
	where deptno = (select deptno from emp_1 where ename = 'KING' ) and ename <> 'king' ;
    
    select * from emp_1;

#----------------------------------------------------------------------------------------------------

# 4. Display the HRA for each employee given that HRA is 20% of SAL.

	select sal*0.2 "HRA" from emp_1 ;

#----------------------------------------------------------------------------------------------------

# 5. Display the JOB column with duplicate values suppressed.

	select distinct job from emp_1 ;
    
#----------------------------------------------------------------------------------------------------

#6. Display the Enames and the corresponding Dnames.

	select ename , dname from emp_1 , dept1 
    where emp_1.deptno = dept1.deptno ;
    
#----------------------------------------------------------------------------------------------------

#7. Display the employees in descending order of DEPTNO.

	select deptno , ename from emp_1
		Order by deptno desc ; 

#----------------------------------------------------------------------------------------------------

# 8. Find the names of all employees who do not receive any commission.

	select ename from emp_1 
    where   isnull(comm) ;

#----------------------------------------------------------------------------------------------------

#9. Display the employee name and employee number of the employees with the headings as NUMBER and NAME
	select ename "Name" ,empno "Number" from emp_1 ;

#----------------------------------------------------------------------------------------------------

# 10.Find the name of the employee who is receiving the maximum salary.

	select ename , max(sal) from emp_1 ;
    
#----------------------------------------------------------------------------------------------------

# 11.Display the sum of SAL for all the employees belonging to DEPTNO 10.

	select sum(sal) "Sum Of Sal" from emp_1
    where deptno = 10 ;

#----------------------------------------------------------------------------------------------------

#12.Display the rows where JOB column ends with the letter ‘T’
	
    select * from emp_1
    where job like '%T' ;
#----------------------------------------------------------------------------------------------------

# 1. Display only the EMPNO and ENAME columns from EMP table.

	select empno , ename from emp_1 ;


#----------------------------------------------------------------------------------------------------

# 2. Display all employees who are CLERKs and the MANAGERs.

	select ename from emp_1 
    where job = 'Clerk' or job = 'Manager' ;
    
# in mysql ' any ' operator  work only with sub-query
    
    select ename from emp_1
    where job in ('Clerk' , 'Manager');


#----------------------------------------------------------------------------------------------------

# 13. Find the names of all employees who were hired on the last day of the month.

	select  ename from emp_1 
		where day(hiredate) = last_day(hiredate)  ;




#----------------------------------------------------------------------------------------------------

# 4. Find the names of all employees hired in the month of February (of any year).





#----------------------------------------------------------------------------------------------------

# 5. Display the employees in descending order of DEPTNO.







#----------------------------------------------------------------------------------------------------

# 6. . Display the employee name and employee number of the employees with the headings as NUMBER and NAME.




#----------------------------------------------------------------------------------------------------



#----------------------------------------------------------------------------------------------------    

# 8. Find the name of the employee who is receiving the maximum salary.





#----------------------------------------------------------------------------------------------------

# 9. Display the sum of SAL for all the employees belonging to DEPTNO 10.





#----------------------------------------------------------------------------------------------------

# 10. Display the rows where JOB column ends with the letter ‘T’.




#----------------------------------------------------------------------------------------------------




#----------------------------------------------------------------------------------------------------




#----------------------------------------------------------------------------------------------------






#----------------------------------------------------------------------------------------------------
