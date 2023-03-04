
-- functions
-- 1. built in function
--2. user defined function --> used to exe a perticular task
-- prod-price  --> discounted price
--max,min,count,avg,concat ,cast, year,month,day,len,trim,substring....
-- type 1 --> single / scalar function -> a function which returns a single value


create function Addition (@a int ,@b int )
returns int 
begin 
declare  @c int
set @c=@a+@b
return @c
end
select dbo.Addition(10,30)

create function GetNameById(@id int)
returns varchar(20)
as begin 
return (
select ename from emp where eid=@id)
end

select dbo.GetNameById(2)

--2 . multivalue function  -->which returns the recordset
create function GetEmpByDeptId(@did int)
returns table 
as 
return
(
select * from emp where deptid=@did
)
select * from dbo.GetEmpByDeptId(4)

-- create a function to pass product price & discount percentage
-- returns the discounted price
select * from product
 
 create function GetDiscount(@dic decimal , @price decimal)
 returns decimal
 begin
 declare @a decimal
 set @a=@price*(@dic/100)
 set @price=@price-@a
 return @price


 end

 select dbo.GetDiscount(10,3000)

 --stored procedure

 create proc GetAllEmps
as begin
select * from emp
return
end

exec GetAllEmps

create proc GetEmpByDept(@deptid int)
as begin 
select * from emp where deptid=@deptid
return
end 

exec GetEmpByDept 4

create proc InsertEmp(
@eid int,
@ename varchar(20),
@deptid int ,
@city varchar(20),
@salary int,
@managerid varchar(20)

)
as begin 
insert into emp values(@eid,@ename,@deptid,@city,@salary,@managerid)
return
end
exec InsertEmp 
@eid=15,
@ename='Rohit',
@deptid=3,
@city ='Pune',
@salary=20000,
@managerid=8

create proc DeleteEmp(@eid int)
as begin
delete emp where eid=@eid
end
exec DeleteEmp @eid = 15