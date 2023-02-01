create table emp (
emp_id int,
emp_name varchar(20),
departmrnt_id int,
salary int,
manager_id int,
emp_age int);

insert into emp values(1,'ankit',100,10000,4,39);
insert into emp values(2,'mohit',100,5000,2,16);
insert into emp values(3,'vikas',100,10000,4,37);
insert into emp values(4,'rohit',100,5000,2,16);
insert into emp values(5,'mudit',200,12000,6,55);
insert into emp values(6,'agam',200,12000,2,14);
insert into emp values(7,'sanjay',200,9000,2,13);
insert into emp values(8,'aashish',200,5000,2,12);
insert into emp values(9,'mukesh',300,6000,6,51);
insert into emp values(10,'rakesh',300,7000,6,50);

create table emp1 (
emp_id int,
emp_name varchar(20),
departmrnt_id int,
salary int,
manager_id int,
emp_age int);

insert into emp1 values(1,'ankit',100,10000,4,39);
insert into emp1 values(2,'mohit',100,5000,2,16);
insert into emp1 values(3,'vikas',100,10000,4,37);
insert into emp1 values(4,'rohit',100,5000,2,16);
insert into emp1 values(5,'mudit',200,12000,6,55);
insert into emp1 values(6,'agam',200,12000,2,14);
insert into emp1 values(7,'sanjay',200,9000,2,13);
insert into emp1 values(8,'aashish',200,5000,2,12);
insert into emp1 values(9,'mukesh',300,6000,6,51);
insert into emp values(10,'rakesh',300,7000,6,50);


select * from emp

---how to find duplicate record in table 
select emp_id,count(emp_id) from emp group by emp_id having emp_id >1

----delete duplicate record from the table 

with cte as (select * ,row_number() over(partition by emp_id order by emp_id) as rn from emp )
delete from cte where rn>1

---difference between union and union all
select * from emp  --have one duplicate record
select * from emp1 ---uniqe record

select * from emp1	
union       -----union give only unique record from both table
select * from emp

select * from emp1	
union all     -----union give only all record from both table
select * from emp

select manager_id from emp  ---take column
union 
select manager_id from emp1

---difference between rank dencerank row_number
select * ,row_number() over(partition by departmrnt_id order by salary desc) as rn from emp
select * ,rank() over(partition by departmrnt_id order by salary desc) as rn from emp
select * ,dense_rank() over(partition by departmrnt_id order by salary desc) as rn from emp

---combine all
select * ,row_number() over(partition by departmrnt_id order by salary desc) as rn 
 ,rank() over(partition by departmrnt_id order by salary desc) as rnk
 ,dense_rank() over(partition by departmrnt_id order by salary desc) as d_rank from emp

 ---write a query to display employe whose not present in another table

 delete from emp where emp_id=5

 select * from emp1 where emp_id not in(select emp_id from emp)

 ---2 way 
 select * from emp
 union 
 select * from emp1

 ---write a query to show 2nd highest salary
 select * from (select *,dense_rank() over(order by salary desc) as d_rank from emp1) x
 where x.d_rank=2
 ---2way
 select max(salary) from emp1 where salary not in (select max(salary) from emp1)
 ----
 ----find all tranction done by rakesh
 select * from emp where emp_name ='rakesh'
 --or
  select * from emp where emp_name in ('rakesh')

  ----write a to fetch record employ salary is greatter than manager salary(self join)

  select e.emp_id,e.emp_name,e.salary as emp_salary,m.salary as manager_salar from emp e
  inner join emp m on e.manager_id=m.emp_id
  where e.salary>m.salary

  ----write a queary to fetch eemployee name and there manager name
  select distinct e.emp_name as emp,m.emp_name as manager_name from emp e
  inner join emp m on e.manager_id=m.emp_id
  select * from emp
  ----write query for inner join left join

SELECT * FROM emps3
SELECT * FROM departments3
SELECT * FROM manager3
SELECT * FROM project3

-----fetch the employee name and depatment name they belong to

select e.emp_name,d.dept_name from emps3 e left join departments3 d
on e.dept_id=d.dept_id

----fetch all the employe name and department name

select e.emp_name,d.dept_name from emp3 e
left join departments3 d on e.dept_id=d.dept_id

---------fetch all the department name and employe name they working with

select e.emp_name,d.dept_name from emp3 e
right join departments3 d
on e.dept_id=d.dept_id

---fetch details of all employee there manager name,there department and the project they work on

select e.emp_name,d.dept_name,m.manager_name,p.project_name
from emps3 e 
left join departments3 d on e.dept_id=d.dept_id----because emps table is in my left side 
join manager3 m on e.manager_id=m.manager_id----it priority of all employee
left join project3 p on e.emp_id=p.team_meber_id---emps is primay table in left side

---update table
update  emp1 set emp_name ='rohit' where emp_id ='7'

select * from emp1