

--1. create table product(id,name,price,company)
create table product(
p_id int,
p_name varchar(20),
price int ,
company varchar(20)
)
insert into product values(1,'laptop',24000,'HP')
insert into product values(2,'Mobile',799,'one plus')
insert into product values(3,'Mouse',999,'lenovo')
insert into product values(4,'Fan',2500,'Cromptomn')
insert into product values(5,'iron',1500,'usha')
insert into product values(6,'fridge',32000,'Samsung')
insert into product values(7,'laptop',29000,'acer')
insert into product values(8,'fan',2000,'Usha')
insert into product values(9,'laptop',40000,'Dell')
insert into product values(10,'mobile',20000,'Redmi')

truncate table product

select * from product

--2. display the product with hightest price to lowest price (first 3 products)
select top 3 * from product
order by price desc

--3. display product name whose price is lowset price in product table
select top 1 p_name, price from product 
order by price asc

--4. display the product with lowest to highest price (skip first 3 products & display next 5 products)
select * from product
order by price offset 3 row 
fetch next 5 row only

--5. display product details with alphbetical order of product name & price 
select * from product 
order by p_name ,price asc

--6. display product details with alphabetical order of company name& price
select * from product
order by company,price

---------------------------------------------------------------------------------

select * from emp
select * from customer
--alise clouse
select city +' ' +country as 'city country' from customer



--- count
select count(price) as 'Total' from product
select count(distinct city) as 'department Id' from emp
select count(distinct deptid) as 'department Id' from emp
select count(distinct p_name) as 'product' from product
--17.	Use the correct function to return the number of records that have the Price value set to 999
select count(price) as 'price' from product where price =999


--min
--15.	Use the MIN function to select the record with the smallest value of the Price column.
select min(price) as 'min price' from product
select min(salary) as 'min salary' from emp

--max
--16.	Use an SQL function to select the record with the highest value of the Price column.
select max(price) as 'maximum price'  from product
select max (salary) as 'max salary' from emp


----avg
--18.	Use an SQL function to calculate the average price of all products.
select avg(price) as 'average ' from product
select avg(salary) as 'average' from emp

--sum 
--19.	Use an SQL function to calculate the sum of all the Price column values in the Products table
select sum(price) as 'total price' from product
select sum(salary) as 'Toatal salary' from emp

--34.	When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
select postalno as'pno' from customer

