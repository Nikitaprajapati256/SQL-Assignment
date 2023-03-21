--case


alter table emp add employement varchar(20)
select * from emp
 

select ename ,
case
when managerid is null then 'Manager'
when managerid is not null then 'employee'
end as 'employement'
from emp

select * from books

select b_name,
case
when price > 899 then 'Expensive'
when price < 899 then 'chip'
else 'Average'
end as ' price comment'
from books


create table std_profile(
roll_no int primary key identity(1,1),
name varchar(20),
age int ,
address varchar (100),
gender varchar(20)
)

create table student1(
course_id int primary key identity(1,1),
course_name varchar(30),
course_fees int 
)

create table course_detail(
id int primary key identity(1,1),
course_id int,
constraint fkcoursestd foreign key(course_id) references student1(course_id),
roll_no int,
constraint fkprofilecourse foreign key(roll_no) references std_profile(roll_no)
)

insert into std_profile values('ram',22,'absc','M')
insert into std_profile values('bela',25,'dbhsv','F')

insert into student1 values('C#',30000)
insert into student1 values('Java',35000)

insert into course_detail values(2,1)
insert into course_detail values(1,2)
insert into course_detail values(2,2)

select * from std_profile
select * from student1
select * from course_detail