CREATE TABLE SALESMAN(
SALESMAN_ID INT,
NAME VARCHAR(20),
CITY VARCHAR(20),
COMMISSION Decimal(4,2), --before decimal it can include 4 values and after decimal it can include 2 decimal 
primary key(SALESMAN_ID));  -- syntax:- decimal(totalnumber before point, total number after point)

INSERT INTO SALESMAN VALUES(5001,'JAMES HOOG','NEW YORK',0.15);
INSERT INTO SALESMAN VALUES(5002,'NAIL KNITE','PARIS',0.13);
INSERT INTO SALESMAN VALUES(5005,'PIT ALEX','LONDON',0.11);
INSERT INTO SALESMAN VALUES(5006,'MC LYON','PARIS',0.14);
INSERT INTO SALESMAN VALUES(5007,'PAUL ADAM','ROME',0.13);
INSERT INTO SALESMAN VALUES(5003,'LAUSON HEN','SAN JOSE',0.12);


CREATE TABLE CUSTOMER
(CUSTOMER_ID INT,
CUST_NAME VARCHAR(20),
CITY VARCHAR(20),
GRADE INT
primary key(CUSTOMER_ID));

INSERT INTO CUSTOMER VALUES(3002,'NICK RIMANDO','NEW YORK',100);
INSERT INTO CUSTOMER VALUES(3007,'BRAD DAVIS','NEW YORK',200);
INSERT INTO CUSTOMER VALUES(3005,'GRAHAM ZUSI','CALIFORNIA',200);
INSERT INTO CUSTOMER VALUES(3008,'JULIAN GREEN ','LONDON',300);
INSERT INTO CUSTOMER VALUES(3004,'FABIAN JOHNSON','PARIS',300);
INSERT INTO CUSTOMER VALUES(3009,'GEOFF CAMERON','BERLIN',100);
INSERT INTO CUSTOMER VALUES(3003,'JOZY ALTIDOR','MOSCOW',200);
INSERT INTO CUSTOMER VALUES(3001,'BRAD GUZAN','LONDON',100);

CREATE TABLE ORDERS(
ORD_NO INT,
PURCH_AMT Decimal(8,2),
ORD_DATE DATE,
CUSTOMER_ID INT, FOREIGN KEY(CUSTOMER_ID)
REFERENCES CUSTOMER (CUSTOMER_ID),
SALESMAN_ID INT, FOREIGN KEY (SALESMAN_ID) 
REFERENCES SALESMAN(SALESMAN_ID));


INSERT INTO ORDERS VALUES(70001,150.5,'2012-10-05',3005,5002);
INSERT INTO ORDERS VALUES(70009,270.65,'2012-09-10',3001,5005);
INSERT INTO ORDERS VALUES(70002,65.26,'2012-10-05',3002,5001);
INSERT INTO ORDERS VALUES(70004,110.5,'2012-08-17',3009,5003);
INSERT INTO ORDERS VALUES(70007,948.5,'2012-09-10',3005,5002);
INSERT INTO ORDERS VALUES(70005,2400.6,'2012-07-27',3007,5001);
INSERT INTO ORDERS VALUES(70008,5760,'2012-09-10',3002,5001);
INSERT INTO ORDERS VALUES(70010,1983.43,'2012-10-10',3009,5003);
INSERT INTO ORDERS VALUES(70003,2480.4,'2012-10-10',3004,5006);
INSERT INTO ORDERS VALUES(70012,250.45,'2012-06-27',3008,5002);
INSERT INTO ORDERS VALUES(70011,75.29,'2012-08-17',3003,5007);
INSERT INTO ORDERS VALUES(70013,3045.6,'2012-04-25',3002,5001);



select * from salesman;
select * from CUSTOMER;
select * from orders;

--1. Write a SQL statement to prepare a list with salesman name, customer name and their cities for 
-- the salesmen and customer who belongs to the same city.

select s.name,c.cust_name,c.city from salesman s join customer c
on s.city =c.city;

--2. Write a SQL statement to make a list with order no, purchase amount, customer name and their cities 
-- for those orders which order amount between 500 and 2000. 
select o.ord_no,o.purch_amt,c.cust_name,c.city from orders o join customer c
on o.customer_id= c.customer_id where purch_amt between '500' and '2000';

-- 3.	Write a SQL statement to know which salesman are working for which customer.
select * from CUSTOMER
select * from SALESMAN
select * from ORDERS
select s.name as salesman,c.cust_name as customer from SALESMAN s join CUSTOMER c ON s.city= c.city;

-- 4.	Write a SQL statement to find the list of customers who appointed a salesman for their 
--  jobs who gets a commission from the company is more than 12%. 
select c.cust_name,s.name,s.COMMISSION from CUSTOMER c join SALESMAN s
on c.city=s.city where COMMISSION >'0.12';

-- 5.	Write a SQL statement to find the list of customers who appointed a 
-- salesman for their jobs who does not live in the same city where their customer lives, and gets a commission is above 12%.
select s.name,c.cust_name,c.city from salesman s join customer c
on s.city !=c.city where COMMISSION>0.12;

--6 Write a SQL statement to find the details of a order i.e. order number, order date, amount of order, 
-- which customer gives the order and which salesman works for that customer and how much commission he gets for an order.
select * from ORDERS;
select o.ord_no,o.ord_date,o.purch_amt,c.CUST_NAME,s.NAME as salesman,s.COMMISSION from ORDERS o 
join CUSTOMER c on o.CUSTOMER_ID=c.CUSTOMER_ID
join SALESMAN s on o.SALESMAN_ID=s.SALESMAN_ID
order by ord_no;

--7. Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own.

select * from CUSTOMER;

select distinct c.cust_name,s.name from CUSTOMER c 
left join SALESMAN s on c.city=s.city  --------m------
join ORDERS o on c.CUSTOMER_ID= o.CUSTOMER_ID
order by CUST_NAME asc;

-- 8.	Write a SQL statement to make a list in ascending order for the customer who holds
--   a grade less than 300 and works either through a salesman or by own.

select * from CUSTOMER;

select distinct c.cust_name,s.name as salesman,c.grade from CUSTOMER c 
left join SALESMAN s on c.city=s.city
join ORDERS o on c.CUSTOMER_ID=o.CUSTOMER_ID----m
where grade <300;

-- 9.	Write a SQL statement to make a report with customer name, city, order number,
-- order date, and order amount in ascending order according to the order date to find that either any of the existing 
--   customers have placed no order or placed one or more orders.
select * from ORDERS
select distinct c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt from CUSTOMER c
join ORDERS
 o on c.CUSTOMER_ID=o.CUSTOMER_ID----m
order by ORD_DATE;

--10. Write a SQL statement to make a report with customer name, city, order number, 
--order date, order amount salesman name and commission to find that either any of 
--the existing customers have placed no order or placed one or more orders by their 
--salesman or by own.
select distinct c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt,s.name,s.commission from CUSTOMER c
join ORDERS o on c.CUSTOMER_ID=o.CUSTOMER_ID-----m
join SALESMAN s on s.SALESMAN_ID=o.SALESMAN_ID;


