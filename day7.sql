create table students(
s_id int primary key identity(1,1),
names varchar (40),
city varchar(30)
)
insert into students values('Ram','Pune')
insert into students values('Sham ','Mumbai')
insert into students values('Sita','Pune')
insert into students values('Gita','Nashik')

create table Subjects(
sub_id int primary key identity(1,1),
Subname varchar(40),
MaxMarks int,
passing int

)
insert into Subjects values('Maths',100,40)
insert into Subjects values('English',100,40)
insert into Subjects values('Marathi',50,15)
insert into Subjects values('Hindi',50,15)

create table Exam (
s_id int ,
Constraint fkstdexam foreign key (s_id) references Students(s_id),
sub_id int ,
constraint fksubexam foreign key (sub_id) references subjects(sub_id),
marks int

)
insert into Exam values(1,1,100)
insert into Exam values(1,2,85)
insert into Exam values(1,3,40)
insert into Exam values(1,4,45)
insert into Exam values(2,1,35)
insert into Exam values(2,2,55)
insert into Exam values(2,3,25)
insert into Exam values(3,1,95)
insert into Exam values(3,2,87)
insert into Exam values(3,3,45)
insert into Exam values(3,4,42)
select * from students
select * from subjects
select * from Exam

--insert a new student(sid=5,name = 'Ramesh',city = Hyderabad) into the student table

insert into students values('Ramesh','Hyderabad')

--change city of sid=4 to sangli 
update students set city='Sangli' where s_id=4

-- return a list of student with cloumn sid name and city
select * from students

--return list containing column sid name subname ,marks,maxmarks 
select st.s_id,st.names,sb.Subname,e.marks,sb.MaxMarks
from Exam e , students st,Subjects sb



--return a list of students sid name who are absent for exam
select s.s_id,names
from students s
left  join Exam ex on ex.s_id=s.s_id
where s.s_id=ex.s_id

--return a list of students who got the highest marks along with marks s_id name 
select top 1 s.s_id,s.names,ex.marks 
from students s
inner join exam ex on ex.s_id=s.s_id



--


select * from emp where salary >(
select salary from emp
where eid=10

 )
 select *from emp where salary>
 (
 select avg(salary) from emp)


 select * from emp where salary <(
 select avg(e.salary) from emp e
 inner join dept dp on dp.deptid=e.deptid
 where dp.deptname='development')

 select * from emp where salary<(
 select avg(salary) from emp where  deptid=(
 select deptid from dept where deptname='development')
 )

--select emp who city as same as eid=3

select * from emp where city = (
select city from emp where eid=3)

--display the dpt wise sum their salary

select dp.deptname,sum(e.salary)
 from emp e
inner join dept dp on dp.deptid=e.deptid
group by dp.deptname