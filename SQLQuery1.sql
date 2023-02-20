--DDL coomands
create table person(
	personid int,
	name varchar(20),
	city varchar(10)
)

create table employee(
	empid int,
	empname varchar(20),
	salary decimal

)

-- rename column name 
sp_rename 'person.name','pname'

-- add new contraints 
alter table employee add constraint un_employee unique(email)

--drop the unique constraint
alter table employee drop constraint un_employee

--primary key 
alter table employee alter column empid int not null
alter table employee add constraint pk_employee primary key(empid)

alter table employee drop constraint pk_employee
--check
alter table employee add constraint chk_employee check(age>=18)

alter table employee drop constraint chk_employee


create table student(
	stdid int primary key,
	stdname varchar(20) not null,
	email varchar(20) unique,
	age int  check(age>18)
	

)

-- add table into existing table
alter table student add city varchar(20) default('pune')
alter table student add country varchar(20)

-- remove column from table 
alter table student drop column country
-- show table desciption
sp_help student





create table dept(
deptid int primary key,
deptname varchar(20)
)

create table emp(
eid int primary key,
ename varchar(20),
deptid int,
constraint fk_deptemp foreign key(deptid) references dept(deptid) -- creating a foreighn key constraints

)

alter table emp add constraint eid identity()
alter table emp add  city varchar(20)

alter table emp add constraint fk_deptemp foreign key(deptid) references dept(deptid)

alter table emp drop constraint fk_deptemp

-- non cluster index

--cluster index
create unique index in_emp on  em(eid)
--remove index 
drop index in_emp 

select * from dept
select * from emp

insert into dept values(1,'HR')
insert into dept values(2,'Admin')
insert into dept values(3,'Development')

insert into emp values(1,'Ram',1,'Mumbai')
insert into emp values(2,'sham',2,'Pune')
insert into emp values(3,'Kunal',3,'Mumbai')
insert into emp values(4,'kartik',3,'pune')