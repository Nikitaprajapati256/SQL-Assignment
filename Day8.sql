select * from emp
select * from dept
create table project (
eid int ,
ename varchar (20),
city varchar(20)
)
insert into project select eid , ename,city from emp where deptid = All (
select deptid from dept where deptname in('Development','hr')
)
select * from emp where salary <=all (
select avg(salary) from emp 
group by deptid)

select * from project

select * from emp where salary =(
select max(salary) from emp where salary <>
(select max(salary) from emp)
)

-------------------------------------------------------------
-- built in function for string 
--len -> to find len 
select ename ,len(ename) as 'word length' from emp 

--upper and lower case 
select upper(ename) from emp
select lower(ename) from emp

--trim ,ltrim,rtrim

select TRIM(ename) as 'trim fun' from emp
select LTRIM(ename) as 'left trim ' from emp
select RTRIM(ename) as 'right trim' from emp

--substring
select ename , SUBSTRING(ename,1,3) from emp

--Concate 
select CONCAT(ename,'-',city) from emp

--replace 
select REPLACE(ename,'saurabh','SAURABH') from emp

--is null
select city from emp
-- product  price * qty --> 
--price * isnull(qty,1)
--100 *2 -> 200
--100 *1 -> 100
select ISNULL(city,'NA')as 'City' from emp

-- cast --> conversion from one data type to another data type

select cast(salary as varchar(20)) as'Salary' from emp

select cast(CURRENT_TIMESTAMP as date)

select year(cast(CURRENT_TIMESTAMP as date))

select month(cast(CURRENT_TIMESTAMP as date))

select day(cast(CURRENT_TIMESTAMP as date))

select cast(CURRENT_TIMESTAMP as time)





