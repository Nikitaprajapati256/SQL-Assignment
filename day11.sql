--trigger


create table emplog(
logid int primary key identity(1,1),
description varchar(255)
)
select * from emp
select * from emplog
insert into emp values(11,'Kalpesh',3,'pune',20000,7)
delete emp where eid=11

create trigger tr_emp_insert
on emp after insert
as begin 
declare @id int
select @id=eid from inserted
insert into emplog values('New employee id ' + cast(@id as varchar(20))+'added on '+cast(CURRENT_TIMESTAMP as varchar(20)))
end

create trigger tr_emp_delete
on emp after delete
as begin 
declare @id int
select @id=eid from deleted
insert into emplog values(' employee id ' + cast(@id as varchar(20))+'deleted on '+cast(CURRENT_TIMESTAMP as varchar(20)))
end

---update trigger query

create trigger tr_empupdate
on emp for update
as begin
declare @id int
declare @newname varchar(20),@oldname varchar(20)
declare @newdptid int , @olddptid int
declare @newcity varchar(20), @oldcity varchar(20)
declare @newsalary int ,@oldsalary int
declare @newmgid int ,@oldmgid int
declare @desc varchar (500)

select * into tempTable from inserted

while(exists(select @id from tempTable))
begin 
set @desc =''
select top 1 @id=eid,
@newname=ename,
@newdptid=deptid,
@newcity=city,
@newsalary=salary,
@newmgid=managerid from tempTable

select @oldname=ename,@olddptid=deptid,@oldcity=city,@oldsalary=salary,@oldmgid=managerid 
from deleted where eid=@id
set @desc='emplyee id '+cast(@id as varchar(20))+'change'
if(@newname<>@oldname)
set  @desc= @desc+' old name '+@oldname + ' to new name '+@newname
if(@newdptid<>@olddptid)
set @desc=@desc+'old department name' +cast(@olddptid as varchar(20))+ ' to new department name '+cast(@newdptid as varchar(20))
if(@newcity<>@oldcity)
set  @desc= @desc+' old city '+@oldcity + ' to new city '+@newcity
if(@newsalary<>@oldsalary)
set  @desc= @desc+' old salary '+cast(@oldsalary as varchar(20))+ ' to new salary '+cast(@newsalary  as varchar(20))
if(@newmgid<>@oldmgid)
set  @desc= @desc+' old manager id '+cast(@oldmgid as varchar(20))+ ' to new manager id '+cast(@newmgid as varchar(20))

insert into emplog values(@desc)
delete from tempTable where eid=@id
end
end


update emp set ename='Mukesh',deptid=1,city ='Kolkata',salary=15000,managerid=7 where eid in(1,2,3)





