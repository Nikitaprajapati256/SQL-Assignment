create table customer(
customerid int,
name varchar(20),
city varchar (20),
country varchar(20),
postalno int,

)

select * from customer

insert into customer values(1,'John','Berlin','USA',122311)
insert into customer values(2,'ravi','Mumbai','India',402456)
insert into customer values(3,'merry','London','UK',114455)
insert into customer values(4,'Vidhyut','Banglore','India',410002)
insert into customer values(5,'Sakshi','Pune','India',400015)
insert into customer values(6,'Sam','New york','USA',122345)
insert into customer values(7,'Robin','Delhi','India',122365)
insert into customer values(8,'Bela','London','UK',111405)
insert into customer values(9,'Hamid','Dubai','UAE',001542)
insert into customer values(10,'Kat','Chicago','USA',1223466)
insert into customer values(11,'Kashish','pune','India',400235)


---1.	Write a statement that will select the City column from the Customers table
select city from customer
 
 --2.	Select all the different values from the Country column in the Customers table.

 select distinct country from customer

 --3.	Select all records where the City column has the value "London
 select * from customer where city='London'

 --4.	Use the NOT keyword to select all records where City is NOT "Berlin".
 select * from customer where not city = 'Berlin'

 --5.	Select all records where the CustomerID column has the value 6.
 select * from customer where customerid=6

 --6.	Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 122311.
 select * from customer where city='Berlin' and postalno=122311
  
  --7.	Select all records where the City column has the value 'Berlin' or 'London'.
  select * from customer where city='berlin' or city='London'

  --8.	Select all records from the Customers table, sort the result alphabetically by the column City.
  select * from customer
  order by city 

  --9.	Select all records from the Customers table, sort the result reversed alphabetically by the column City.
  select * from customer
  order by city desc

  --10.	Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
  select * from customer
  order by country,city


  --29.	Use the IN operator to select all the records where the Country is either "India" or "USA".
  select * from customer where country = 'India' or city='USA'

  --30.	Use the IN operator to select all the records where Country is NOT "India" and NOT "USA".
  select * from customer
  where not country = 'India' and not country='USA'

  --31.	Use the BETWEEN operator to select all the records where the value of the customerid column is between 5 and 10
  select * from customer where customerid between 5 and 10


  --40.	Add a column of type DATE called Birthday in Persons table
  create table person (
  name varchar (20),
 
  )
  alter table person add birthday date
  select * from person

--41.	Delete the column Birthday from the Persons table
alter table person drop column birthday

--11.	Select all records from the Customers where the PostalCode column is empty.
update customer set postalno=NULL  where customerid=9

select * from customer where postalno is null

--12.	Select all records from the Customers where the PostalCode column is NOT empty.
select * from customer where postalno is not null

--13.	Set the value of the City columns to 'oslo', but only the ones where the Country column has the value "UAE".
update customer set city='oslo' where country='UAE'

--14.	Delete all the records from the Customers table where the Country value is 'UAE'.
delete from customer where country ='UAE'

--20.	Select all records where the value of the name column starts with the letter "a".
select * from customer where name like 'a%'

--21.	Select all records where the value of the name column ends with the letter "a".
select * from customer where name like '%a'

--21.	Select all records where the value of the name column ends with the letter "a".
select * from customer where name like '%a%'

--23.	Select all records where the value of the City column starts with letter "s" and ends with the letter "i".
select * from customer where name like's%_%i'

--24.	Select all records where the value of the City column does NOT start with the letter "a".
select * from customer where name not like 's%_%i'

--25.	Select all records where the second letter of the City is an "a".
select *from customer where name like '_a%'

--26.	Select all records where the first letter of the City is an "p" or a "c" or an "m".
select * from customer where city like '[pcm]%'

--27.	Select all records where the first letter of the City starts with anything from an "a" to an "f".
select * from customer where city like '[a-f]%'

--28.	Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
select * from customer where city not like '[a-c-f]%'

--29.	Use the IN operator to select all the records where the Country is either India" or "USA".
select * from customer where country in ('India','USA')

--30.	Use the IN operator to select all the records where Country is NOT "india" and NOT "usa".
select * from customer where country  not in ('India','USA')