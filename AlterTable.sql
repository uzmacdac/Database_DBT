show databases;
use shahada ;
show tables ;
create table Project;
drop table Project ;
create table Project
(Projectno char(2), ClientName varchar(20) ,Descrip varchar(20));
insert into Project values
('P1','Deloitte','CGS'),
('P2','BNP Paribas','Macros S/w'),
('P3','Morgan Stanley','AMS'),
('P4','ICICI Bank','PPS'),
('P5','AMFI','Website Dev');
 select  * from Project ;
 -- Rename Table 
 rename table Project  to Projects ;
 select * from Projects ;
 
 -- Again rename table to project 
 
 rename table projects to project ;
 select * from project ;
 
 -- -----------------------------------------------------------------------------------------------
-- Add column in table 
Alter table project add GST float ;
select * from Project ;
-- Output :
--  Projectno  ClientName  			Descrip 	  GST
--  P1			Deloitte			CGS			  null
--  P2			BNP Paribas			Macros S/w	  null
--  P3	        Morgan Stanley		AMS	          null
--  P4		    ICICI Bank			PPS			  null
--  P5	        AMFI	            Website Dev	  null
-- ---------------------------------------------------------------------------------------------
-- delete coulmn from table 
Alter table project drop column GST ;
select * from Project ;
-- Output :
--  Projectno  ClientName  			Descrip 	  
--  P1			Deloitte			CGS	
--  P2			BNP Paribas			Macros S/w	
--  P3	        Morgan Stanley		AMS	
--  P4		    ICICI Bank			PPS	
--  P5	        AMFI	            Website Dev	

-- ---------------------------------------------------------------------------------------------
# Always Remember : To rollback , first uncheck  auto-commit transaction  then apply DML command then rollback . It undo all your DML command  
# Auto-commit transaction will save all your changes permanently     
update Project set Projectno = 'P1';
select * from Project ;
update Project set projectno = 'P2'
where ClientName = 'BNP Paribas' ;
update Project set projectno = 'P3'
where ClientName = 'Morgan Stanley' ;

update Project set projectno = 'P4'
where ClientName = 'ICICI Bank' ;
update Project set projectno = 'P5'
where ClientName = 'AMFI' ;
update Project set projectno = 'P3'
where ClientName = 'Morgan Stanley' ;
update Project set projectno = 'P5'
where ClientName = 'AMFI';

select * from Project ;
commit;
alter table Project  modify projectno char(5);
commit;
select * from Project ;
update Project set projectno = 'pasdn'
where ClientName= 'Deloitte' ;
-- Output :
--  Projectno  ClientName  			Descrip 	  
--  pasdn		Deloitte			CGS	
--  P2			BNP Paribas			Macros S/w	
--  P3	        Morgan Stanley		AMS	
--  P4		    ICICI Bank			PPS	
--  P5	        AMFI	            Website Dev	
select * from Project ;
rollback ;  
-- Output :
--  Projectno  ClientName  			Descrip 	  
--  P1			Deloitte			CGS	
--  P2			BNP Paribas			Macros S/w	
--  P3	        Morgan Stanley		AMS	
--  P4		    ICICI Bank			PPS	
--  P5	        AMFI	            Website Dev	

-- ---------------------------------------------------------------------------------------------

# Copy all rows from project into Client table 
create table Client
(Projectno char(2), ClientName varchar(20) ,Descrip varchar(20));
insert into Client 
select * from Project ;
select * from Client ;
-- Output : 
--            Client (Table name)
-- Projectno    ClientName  		Descrip 	  
--  P1			Deloitte			CGS	
--  P2			BNP Paribas			Macros S/w	
--  P3	        Morgan Stanley		AMS	
--  P4		    ICICI Bank			PPS	
--  P5	        AMFI	            Website Dev	

-- ---------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------




-- ---------------------------------------------------------------------------------------------


-- ---------------------------------------------------------------------------------------------
