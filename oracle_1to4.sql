use employee;
create table SALESPEOPLE
(
Snum int ,
Sname varchar(10),
City varchar(10),
Comm float
);

create table CUSTOMERS
(
Cnum int primary key,
Cname varchar(10),
City varchar(10),
Rating int,
Snum int
);

create table orders
(
  onum int,
  amt int,
  odate date,
  cnum int,
  snum int 
);

insert into SALESPEOPLE (SNUM ,SNAME, CITY, COMM) values
 (1001, 'Peel', 'London' ,12),
 (1002, 'Serres', 'San Jose' ,13),
 (1004, 'Motika' ,'London', 11),
 (1007, 'Rifkin', 'Barcelona' ,15);


insert into customers
values 
(2001,'Hoffman' ,'London' ,100 ,1001),
(2002, 'Giovanni', 'Rome' ,200 ,1003),
(2003, 'Liu', 'San Jose' ,200 ,1002),
(2004, 'Grass', 'Berlin' ,300 ,1002),
(2006, 'Clemens', 'London' ,100, 1001),
(2008, 'Cisneros', 'San Jose' ,300 ,1007),
(2007,'Pereira', 'Rome' ,100 ,1004);

insert into ORDERS (ONUM, AMT, ODATE, CNUM, SNUM) values
(3001, 18.69,'1990-08-03',2008, 1007),
(3003, 767.19, '1990-08-03', 2001,1001),
(3002, 1900.10, '1990-08-03', 2007, 1004),
(3005, 5160.45, '1990-08-03',2003,1002),
(3006, 1098.16, '1990-08-03', 2008,1007),
(3009, 1713.23, '1990-08-04', 2002, 1003),
(3007, 75.75, '1990-08-04', 2004,1002),
(3008, 4723.00, '1990-08-05', 2006,1001),
(3010, 1309.95, '1990-08-6', 2004, 1002),
(3011,9891.88, '1990-08-06', 2006, 1001);
drop table orders,customers,salespeople;


alter table salespeople add primary key(snum);
alter table customers add primary key(cnum);
alter table orders add primary key(onum);

select * from information_schema.table_constraints
where table_schema='employee';



select rating from customers;
-- 1) Write a select command that produces the order number, amount, and date for all
-- rows in the Orders table.
select onum,amt,odate from orders;

-- 2) Write a query that produces all rows from the Customers table for which the
-- salesperson’s number is 1001.
select * from customers 
where snum=1001;

-- 3) Write a query that displays the Salespeople table with the columns in the
-- following order: city, sname, snum, comm.
select city,sname,snum,comm from salespeople;

-- 4) Write a select command that produces the rating followed by the name of each
-- customer in San Jose.
select rating,cname from customers
where City = 'San Jose';

-- 5) Write a query that will produce the snum values of all salespeople (suppress the
-- duplicates) with orders in the Orders table.
select distinct salespeople.snum from salespeople,orders
where orders.snum=salespeople.snum;


-- assignment 5
-- Write a query that will give you all orders for more than Rs. 1,000.
select * from orders
where amt > 1000;

-- 2 Write a query that will give you the names and cities of all salespeople in London
-- with a commission above .10.
select sname,city from salespeople 
where comm > 10;

-- 3) Write a query on the Customers table whose output will exclude all customers
-- with a rating <= 100, unless they are located in Rome.
select * from customers 
where rating<=100;
-- 4) What will be the output from the following query?
-- Select * from Orders
-- where (amt < 1000 OR
-- NOT (odate = ‘03-OCT-1990’
-- AND cnum > 2003));

Select * from Orders
where (amt < 1000 OR NOT (odate = '1990-10-03' AND cnum > 2003));

-- 5) What will be the output of the following query?
-- Select * from Orders
-- where NOT ((odate = ‘03-OCT-1990’ OR snum
-- >1006) AND amt >= 1500);
-- 6) What is a simpler way to write this query?
-- Select snum, sname, city, comm From Salespeople
-- where (comm > .12 OR comm <.14);

-- Write a query that uses a subquery to obtain all orders for the customer named 
-- Cisneros. Assume you do not know his customer number (cnum).
select * from orders 
where cnum = (select cnum from customers 
where cname = 'Cisneros');

-- 2) Write a query that produces the names and ratings of all customers who have 
-- above-average orders.
select cname,rating from customers
where cnum in (select cnum from orders
			where amt > (select avg(amt) from orders));
            
-- 3) Write a query that selects the total amount in orders for each salesperson for 
-- whom this total is greater than the amount of the largest order in the table.

select max(SUM) from
(select sum(amt) "SUM"from orders
		group by snum) as temp ;


