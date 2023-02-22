select * from emp
select * from dept
insert into dept values(4,'Testing')
insert into dept values(5,'Finance')

-- Update query -> to modify records into the table

update emp set city='banglore' , ename='Saurabh' where eid=4

update emp set ename='Ramesh',deptid=3 where ename='Ram'

--- delete query -> to delete record from table

delete from emp where eid=4

insert into emp values(4,'sakshi',3,'nashik')
insert into emp values(5,'rupali',2,'Mumbai')
insert into emp values(6,'karan',1,'pune')
insert into emp values(7,'raghav',3,'nagpur')
insert into emp values(8,'sakshi',3,'pune')
insert into emp values(9,'nithya',2,'banglore')
insert into emp values(10,'mahesh',2,'nashik')

update emp set deptid=4 where ename='raghav'
update emp set deptid=5 where ename='nithya'
update emp set deptid=5 where ename='mahesh'
update emp set deptid=4 where ename='rupali'

alter  table emp add salary int

update emp set salary=20000 where deptid=1
update emp set salary=25000 where deptid=2
update emp set salary=30000 where deptid=3
update emp set salary=28000 where deptid=4
update emp set salary=29000 where deptid=5
update emp set ename='saurabh' where eid=8

------------------------------------------------------------
--DQL 

--where clause
select * from emp where eid=1
select * from emp where deptid=4

-- Operators
select * from emp where salary=25000
select * from emp where salary<=28000
select * from emp where salary <>30000
select * from emp where salary between 20000 and 28000

--in and not in
select * from emp where eid in(1,4,5,7,3,10)
select * from emp where city in ('nashik','banglore')

-- not in
select * from emp where eid not in(1,4,5,7,3,10)
select * from emp where city not in ('nashik','banglore')


