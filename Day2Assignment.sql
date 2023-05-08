create database Address

use Address 
go

create schema Addr
go

create table Addr.Country (
CountryPId bigint primary key ,
CountryName nvarchar(50),
CreationDate datetime not null default GetUTCDate(),
CountryCode nvarchar(10)
)
insert into Addr.Country(CountryPId,CountryName,CountryCode) values(1,'Canada','CA')
insert into Addr.Country (CountryPId,CountryName,CountryCode) values(2,'India','INA')
insert into Addr.Country (CountryPId,CountryName,CountryCode) values(3,'America','USA')
insert into Addr.Country (CountryPId,CountryName,CountryCode) values(4,'New zeaLand','NZ')
insert into Addr.Country (CountryPId,CountryName,CountryCode) values(5,'Pakistan','PK')
insert into Addr.Country values(6,'Shri Lanka','SL')


select * from Addr.Country




create table Addr.State (
StatePId bigint primary key ,
StateName nvarchar(50),
CreationDate datetime not null default GetUTCDate(),
StateCode nvarchar(10),
CountryPId bigint,
Constraint fk_Country_State foreign key(CountryPId ) references Addr.Country(CountryPId )
on update cascade
on delete cascade
)

Insert into Addr.State values(1,'Delhi',GetUTCDate(),'DL',2)
Insert into Addr.State values(2,'California',GetUTCDate(),'CL',3)
Insert into Addr.State values(3,'Maharashtra',GetUTCDate(),'MH',2)
Insert into Addr.State values(4,'Lahore',GetUTCDate(),'LR',5)
Insert into Addr.State values(5,'Alaska',GetUTCDate(),'AA',3)
Insert into Addr.State values(6,'Auckland',GetUTCDate(),'AK',4)
Insert into Addr.State values(7,'Gujarat',GetUTCDate(),'GJ',2)
Insert into Addr.State values(8,'Panjab',GetUTCDate(),'PU',2)
Insert into Addr.State values(9,'Hamilton',GetUTCDate(),'HN',4)
Insert into Addr.State values(10,'Arizona',GetUTCDate(),'AZ',3)

select * from Addr.State




create table Addr.City (
CityPId bigint primary key ,
CityName nvarchar(50),
CreationDate datetime not null default GetUTCDate(),
StatePId bigint,
Constraint fk_State_City foreign key(StatePId) references Addr.state(StatePId ),
CountryPId bigint,
Constraint fk_Country_City foreign key(CountryPId ) references Addr.Country(CountryPId )
on update cascade
on delete cascade
)

Insert into Addr.City values(1,'San Diego',GETUTCDATE(),2,3)
Insert into Addr.City values(2,'lahore',GETUTCDATE(),4,5)
Insert into Addr.City values(3,'Surat',GETUTCDATE(),7,2)
Insert into Addr.City values(4,'Adak',GETUTCDATE(),5,3)
Insert into Addr.City values(5,'Amritsar',GETUTCDATE(),8,2)
Insert into Addr.City values(6,'Mumbai',GETUTCDATE(),3,2)
Insert into Addr.City values(7,'Gurgoan',GETUTCDATE(),1,2)

select * from Addr.City

create table Addr.Address (
AddressPId bigint primary key ,
Address1 nvarchar(50),
Address12 nvarchar(50),
CreationDate datetime not null default GetUTCDate(),
CityPId bigint ,
Constraint fk_Address_City foreign key(CityPId) references Addr.City(CityPId ),
StatePId bigint,
Constraint fk_Address_State foreign key(StatePId) references Addr.state(StatePId ),
CountryPId bigint,
Constraint fk_Address_Country foreign key(CountryPId ) references Addr.Country(CountryPId )


on update cascade
on delete cascade,

PinCode nvarchar(50)
)

Insert into Addr.Address values(1,'ABCD','asdx',GETUTCDATE(),1,2,3,422201)
Insert into Addr.Address values(2,'XYTF','nvre',GETUTCDATE(),2,4,5,400134)
Insert into Addr.Address values(3,'NIFN','hfrbg',GETUTCDATE(),3,7,2,4113723)
Insert into Addr.Address values(4,'NFEWFB','asdx',GETUTCDATE(),4,5,3,400870)
Insert into Addr.Address values(5,'JGRVC','nuefv',GETUTCDATE(),3,7,2,4113726)
Insert into Addr.Address values(6,'ERRFB','abue',GETUTCDATE(),7,1,2,400145)
Insert into Addr.Address values(7,'BRFV','bvhf',GETUTCDATE(),2,4,5,400133)
Insert into Addr.Address values(8,'JGRH','jfb',GETUTCDATE(),1,2,3,422209)
Insert into Addr.Address values(9,'NFGRD','fhew',GETUTCDATE(),3,7,2,4113726)
Insert into Addr.Address values(10,'MFEEB','hwfv',GETUTCDATE(),1,2,3,422204)
Insert into Addr.Address values(11,'FHBF','cdbf',GETUTCDATE(),2,4,5,400139)
Insert into Addr.Address values(12,'HEWVF','hfwrf',GETUTCDATE(),7,1,2,400146)
Insert into Addr.Address values(13,'JFE','anfnrh',GETUTCDATE(),3,7,2,4113725)

Insert into Addr.Address values(14,'ABCD','asdx',GETUTCDATE(),1,2,3,422201)
Insert into Addr.Address values(15,'ABCD','asdx',GETUTCDATE(),1,2,3,422201)
Insert into Addr.Address values(16,'ABCD','asdx',GETUTCDATE(),1,2,3,422201)
Insert into Addr.Address values(17,'ABCD','asdx',GETUTCDATE(),1,2,3,422201)
Insert into Addr.Address values(18,'ABCD','asdx',GETUTCDATE(),1,2,3,422201)
Insert into Addr.Address values(19,'ABCD','asdx',GETUTCDATE(),1,2,3,422201)
Insert into Addr.Address values(20,'ABCD','asdx',GETUTCDATE(),1,2,3,422201)
Insert into Addr.Address values(21,'ABCD','asdx',GETUTCDATE(),1,2,3,422201)
Insert into Addr.Address values(22,'ABCD','asdx',GETUTCDATE(),1,2,3,422201)
Insert into Addr.Address values(23,'ABCD','asdx',GETUTCDATE(),1,2,3,422201)
Insert into Addr.Address values(24,'ABCD','asdx',GETUTCDATE(),1,2,3,422201)

Select * from Addr.Address

--Write a query to fetch total number of Address in each Country.
select [CountryName] ,count(AddressPId) 
from [Addr].[Address]
inner join [Addr].[Country] on Addr.Country.CountryPId=Addr.Address.CountryPId
group by CountryName

--Write a query to fetch total number of Address in each State having address count more than 10.
select [StateName] ,count(AddressPId) 
from Addr.Address
inner join Addr.State on Addr.State.StatePId=Addr.Address.StatePId
group by StateName
having count(AddressPId)>10



--Write a query to fetch total number of Address in each City having address count more than 10 and fill the result 
--set into one Global Temporary Table #TotalCityAddress.
Create table ##TotalCityAddress (CityName nvarchar(50),Id bigint)


Insert into ##TotalCityAddress 
select CityName,Count(AddressPId) 
from Addr.Address 
Right join Addr.City on Addr.City.CityPId=Addr.Address.CityPId
group by CityName
having Count(AddressPId)>10

select * from ##TotalCityAddress



--. Write a query to fetch total number of Address in each City using a simple CTE(Common Table Expression).

with AddresCount(CityPId,[TotalAddress])
as(
	select CityPId,Count(AddressPId) as TotalAddress
	From Addr.Address
	group by CityPId
 )

select CityName ,[TotalAddress]
from Addr.City
 join AddresCount 
 on Addr.City.CityPId=AddresCount.CityPId
Order by [TotalAddress]



--. Design a Scalar valued function which Takes CountryPID as parameter and returns Country Name, also show one example by calling it.

create function Addr.GetNameById(@CountryId bigint)
returns nvarchar(50)
As
begin
	
	return(select CountryName from  Addr.Country where CountryPId=@CountryId)
end

select Addr.GetNameById(2)

--. Design a table valued function which takes AddressPId as parameter  and return dataset with columns (Address1,CityName, State Code, CountryCode PINCode),
--, also now one example by calling it

Create Function Addr.GetDataById(@AddId bigint)
returns Table
as 
 return (Select Address1,CityName,StateCode,CountryCode,Pincode from Addr.Address
			left join Addr.City on Addr.City.CityPId=Addr.Address.CityPId
			left join Addr.state on Addr.State.StatePId=Addr.Address.StatePId
			Left Join Addr.Country on Addr.Country.CountryPId=Addr.Address.CountryPId
			where AddressPId=@AddId)

Select * from Addr.GetDataById(1)


-- Design a Stored Procedure which takes AddressPID as parameter and returns dataset with columns 
--(Address1, CityName, State Code, CountryCode PINCode), also now one example by calling it

Create proc spGetDataById(@AddrId bigint)
as begin
	
	Select Address1,CityName,StateCode,CountryCode,Pincode from Addr.Address
			left join Addr.City on Addr.City.CityPId=Addr.Address.CityPId
			left join Addr.state on Addr.State.StatePId=Addr.Address.StatePId
			Left Join Addr.Country on Addr.Country.CountryPId=Addr.Address.CountryPId
			where AddressPId=@AddrId
	return

end

exec spGetDataById @AddrId=2