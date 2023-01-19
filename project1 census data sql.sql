select * from dbo.data1
select * from dbo.data2

---total rows in data1
select count(*) from dbo.data1
select count(*) from dbo.data2


---dataset for bihar and jharkhand

select * from dbo.data1 where state in('Jharkhand', 'Bihar')
----total population of india
select * from dbo.data2

select sum(population) as population from dbo.data2

---avg growth in percentages
select avg(growth)*100 as avg_growth from dbo.data1

----avg growth of by the state wise
select state, avg(growth)*100 as avg_growth from dbo.data1
group by state

---avg sex ratio
select avg(sex_ratio) as avg_sex_ratio from dbo.data1

---use round function to decimal places at 0 by the state wise
select state,round(avg(sex_ratio),0)as avg_sex_ratio from dbo.data1 group by state order by avg_sex_ratio desc;

----avg litracy rate

select state,round(avg(Literacy),0)as avg_literacy from dbo.data1 group by state order by avg_literacy desc;


----avg litracy rate >90
select state ,round(avg(literacy),0) as avg_literacy from dbo.data1 group by state 
having round(avg(literacy),0)>90 order by avg_literacy 

select state,round(avg(literacy),0) from dbo.data1 group by state 
having avg(literacy)>90;


---top 3  state by growth ---same colum cant take 2 clause group by  and oder by
select top 3 state,max(growth)*100 as max_growth from dbo.data1 group by state order by max_growth desc
----when you used aggrigate something you have give alias and u want order something use after alias name 
select top 3 state,max(growth)*100 as max_growth from dbo.data1 group by state order by max_growth desc

--bottom 3  state by sex ratio
select top 3 state ,max(sex_ratio) as bottom_sex_ratio from dbo.data1 group by state order by bottom_sex_ratio asc 
select top 3 state ,max(sex_ratio) as sex_ratio from dbo.data1 group by state order by sex_ratio asc

select top 3 state ,avg(sex_ratio) as sex_ratio from dbo.data1 group by state order by sex_ratio asc

select top 3 state, avg(sex_ratio) as min_sex_ratio from dbo.data1 group by state order by min_sex_ratio asc

---show all state starting with letter a or b
select distinct state from dbo.data1 where state like 'a%'

select * from dbo.data1
select distinct state from dbo.data1 where state like 'a%' or state like 'b%'

----show all state starting with a and ending with d

select distinct state from dbo.data1 where state like 'a%' or state like '%d'
----show all state starting with a and ending with m
select distinct state from dbo.data1 where state like 'a%' and state like '%m'

