Create table StudentAddress(
AddressId bigint not null primary key,
Address nvarchar(150),
City nvarchar(50),
State nvarchar(50),
Pincode nvarchar(50)
)

insert into StudentAddress values(1,'Sudha vally','Mumbai','Maharashtra',422078)
insert into StudentAddress values(2,'Panchang','New Delhi','Delhi',400112)
insert into StudentAddress values(3,'Trimurti Apartment','Lacknow','Up',411011)
insert into StudentAddress values(4,'Rudra Banglow','Indore','Mp',422078)
insert into StudentAddress values(5,'Jaydip Apartment','Mumbai','Maharashtra',422074)
insert into StudentAddress values(6,'Vyankat precidency','Mumbai','Maharashtra',422089)
insert into StudentAddress values(7,'Shubra sadan','New Delhi','Delhi',400115)
insert into StudentAddress values(8,'Sahyadri vally','New Delhi','Delhi',400116)

select * from StudentAddress




select * from StudentInfo
create table StudentInfo (
RollNo bigint not null primary key,
Name nvarchar(50),
DateOfBirth datetime,
Admissiondate dateTime,
FatherName nvarchar(50),
MotherName nvarchar(50),
BranchId bigint ,
IsRpeatYear bit,
AddressId bigint ,
constraint Fk_StudentAdd_StudentInfo foreign key (AddressId) references StudentAddress(AddressId)
)

-- Write a query to fetch number of Students in each State.

select  a.State ,count(i.RollNo)  As 'Student Count'
from StudentInfo i
Right join StudentAddress a on a.AddressId=i.AddressId
group by State

-- Write a query to fetch number of students in each City.

select  a.City ,count(i.RollNo)  As 'Student Count'
from StudentInfo i
Right join StudentAddress a on a.AddressId=i.AddressId
group by City

-- Write a query to fetch the list of Tables available into "College" database.

SELECT*FROM information_schema.tables  

--.Write a query to fetch the list of Columns available into "College" database.
Select column_name from INFORMATION_SCHEMA.COLUMNS


