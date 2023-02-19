Use shahada;

create TABLE customers_1 (
customer_Id int(11) NOT NULL,
First_Name varchar(50) NOT NULL,
Last_Name varchar(50) NOT NULL,
phone varchar(50) NOT NULL,
creditLimit decimal(10,2) DEFAULT NULL,
PRIMARY KEY (customer_Id)
);
drop table customers_1;
show tables;
select * from customers_1;

insert into customers_1(customer_Id,First_Name,Last_Name,phone,creditLimit)
values(103,'Atelier','Schmitt','08-78966578','21000.00'),
(112,'Signal','King','7025551838','71800.00'),
(114,'Ferguson','Peter','03-9520 4555','117300.00'),
(119,'Labrune','Janine','40.67.8555','118200.00'),
(121,'Bergulfsen','Jonas ','07-989555','81700.00'),
(124,'Nelson','Susan','4155551450','210500.00'),
(125,'Piestrzeniewicz','Zbyszek ','(26) 642-7555','0.00'),
(128,'Keitel','Roland','+49 6966 90 2555','59700.00'),
(129,'Murphy','Julie','6505555787','64600.00'),
(131,'Lee','Kwai','2125557818','114900.00'),
(141,'Freyre','Diego ','(91) 555 94 44','227600.00'),
(144,'Berglund','Christina','0921-12 3555','53100.00'),
(145,'Petersen','Jytte ','31 12 3555','83400.00'),
(146,'Saveley','Mary','78.32.5555','123900.00'),
(148,'Eric','Jecob','+65 2217555','103800.00'),
(151,'Young','Jeff','2125557413','138500.00');
select * from customers_1;


CREATE TABLE orders_1(
order_Id int(11) NOT NULL,
order_Date date NOT NULL,
shipped_Date date DEFAULT NULL,
Deliver varchar(15) NOT NULL,
customer_Id int(11) NOT NULL,
PRIMARY KEY (order_Id),
FOREIGN KEY (customer_Id) REFERENCES customers_1(customer_Id)
);
insert into orders_1(order_Id,order_Date,shipped_Date,Deliver,customer_Id) values
(10100,'2003-01-06','2003-01-13','Shipped',114),(10101,'2003-01-09','2003-01-18','Sh
ipped',125),
(10102,'2003-01-10','2003-01-18','Shipped',129),(10103,'2003-01-29','2003-02-07','Sh
ipped',121),
(10104,'2003-01-31','2003-02-09','Shipped',141),(10105,'2003-02-11','2003-02-21','Sh
ipped',145);
#----------------------------------------------------------------------------------------------------

# 1. Write a Query to add a column package_stat to the table orders.
	alter table orders_1 add column package_stat varchar(30) ;
    select * from orders_1;

#----------------------------------------------------------------------------------------------------

# 2. Write a Query to change the package_stat column of orders table with 'not available' for all orders.
/*
	update orders_1 
    set package_stat = 'Not Available';
    select * from orders_1;
    */

#----------------------------------------------------------------------------------------------------
# 3. Write a Query to delete a row from customers table where credit_limit is 0.00
 
delete from orders_1
where customer_id like 
		(select customer _id from cusromrs_1
				where  creditlimit = 0.00 ) ;

delete from customers_1 where creditLimit = 0.00 ;


#----------------------------------------------------------------------------------------------------
#    Write SELECT statements to achieve the following:

#----------------------------------------------------------------------------------------------------
# 1. Write a Query to display the first_name with the occurrence of ‘el’ in the customers tables.
/*
	select first_name from customers_1 where first_name like '%el%' ;
*/
#----------------------------------------------------------------------------------------------------

# 2. Write a Query to prepare a list with customer name ,customer_id ,order_id for the
#    customers whose delivery status is shipped.


select concat(customers_1.first_name ,' ' ,customers_1.last_name) "customer name" ,orders_1.customer_id , orders_1.order_id from customers_1 ,orders_1
where ( orders_1.customer_id = customers_1.customer_id and deliver ='shipped' );


 

 
#----------------------------------------------------------------------------------------------------

# 3. Write a Query to get the number of customers with the creditLimit greater than 50000.
	select count(first_name) "noOfCustomer" from customers_1
    where creditLimit > 50000 
    order by customer_Id ;

#----------------------------------------------------------------------------------------------------

# 4. Write a Query to display the customer_id, name ( first name and last name ), order_id
#    and deliver for all customers.
/*
select orders_1.customer_id , concat(customers_1.first_name ,' ' ,customers_1.last_name) "customer name"  , orders_1.order_id  , orders_1.deliver from customers_1 ,orders_1
where  orders_1.customer_id = customers_1.customer_id ;

*/
#----------------------------------------------------------------------------------------------------

# 5. Write a Query to customer name in order of creditLimit smallest to highest.

	select concat(first_name ,' ',last_name) "Customer name" from customers_1
	Order by creditLimit ;

#----------------------------------------------------------------------------------------------------

# 6. Write a stored procedure by name order_day. The procedure should show the
#    customer_id and the day on which he had made the order.
	#create table Otemp
    #(Id int , DayName varchar(20));
		delimiter //
        create procedure Order_day()
        begin 
			declare a int(11) ;
            declare b date;
            declare c date  ;
            declare d varchar(15) ;
            declare e int(11);
            
         #   declare f int(11);
          #  declare g int(11);
            declare n varchar(20) ;
            declare y int default 0 ;
            declare c1 cursor for select order_Id,order_date,shipped_date,deliver,customer_id  from orders_1 for update;
            declare continue handler for not found 
            set y=1 ;
            open c1;
            cursor_c1 : loop 
				fetch c1 into a ,b,c,d,e;  #f,g ;
				if y=1 then
					leave cursor_c1 ;
				end if ;
					set n = dayname(b);
					insert into Otemp values(a , n );
             end loop cursor_c1 ;       
         end  ; //
         delimiter ;
         

         call Order_day();
         select * from Otemp ;
         drop procedure Order_day ;
         
         
         
         delete from Otemp ;
          
		
#----------------------------------------------------------------------------------------------------

# 7. Write a stored function by the name of cutomer_search. The stored function should
#    return the maximum creditLimit made by any customer.
	#create table mtemp(maxCreditLimit decimal(10,2));

	delimiter //
    create function customer_search()
    returns decimal 
     deterministic 
    begin
		declare x decimal(10,2) ;
		select max(creditLimit) into x  from customers_1 ;
        
        return x ;
    end ; //
    delimiter ;
delimiter //
create procedure mcredit()
begin
	declare a decimal(10,2);
    set a = customer_search() ;
    insert into mtemp values(a);
end ; //
delimiter ;
call mcredit();
drop function customer_search ;
select * from mtemp ;
drop procedure mcredit ;

show function status where db ='shahada';

delete from mtemp ;    

select * from customers_1;
#----------------------------------------------------------------------------------------------------
