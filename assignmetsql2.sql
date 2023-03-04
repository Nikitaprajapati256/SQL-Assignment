--Trainer – Trainer id , trainer name , join date , email , experience in years
create table trainer trainer(
trainer_id int primary key identity(1,1),
trainer_name varchar(20),
join_data date ,
email varchar(40) unique ,
exp_year int
)
select * from trainer
insert into trainer values('Akash','2020-06-15','Akash@gmail.com',4)
insert into trainer values('Rutuja','2021-01-25','rutuja@gmail.com',2)
insert into trainer values('Bhakti','2022-02-03','Bhakti@gmail.com',6)
insert into trainer values('Devendra','2019-07-29','Dev@gmail.com',9)

--Course – course id , course name, duration (in months), trainer id , total fees 
create table course(
course_id int primary key identity(1,1),
duration int ,
trainer_id int ,
constraint fkct foreign key (trainer_id) references trainer(trainer_id),
total_fees int 

)

alter table course add cname varchar(20)
insert into course values(3,2,30000)
insert into course values(4,1,35000)
insert into course values(3,2,30000)
insert into course values(2,4,25000)
insert into course values(1,4,32000)
insert into course values(4,3,45000)
update course set cname='Java' where course_id=1
update course set cname='AWS' where course_id=2
update course set cname='Python' where course_id=3
update course set cname='C#' where course_id=4
update course set cname='C++' where course_id=5
update course set cname='Dotnet' where course_id=6
select* from course

--Student - rollno , sname , degree , birthdate , course id , batch id , fees paid , Remark, is placedcreate table std(roll_no int primary key identity(1,1),sname varchar(30),degree varchar(40),birthdate date,course_id int ,constraint fksc foreign key (course_id) references course(course_id) ,batch_id int ,fees_paid int ,reamark varchar(10),is_placed varchar(10))insert into std values('Anil','BE','1998-5-30',1,1,30000,'A','yes')insert into std values('sunil','Btech','1997-10-3',2,3,20000,'B','No')insert into std values('Bela','BE','1999-4-14',3,2,30000,'A','yes')insert into std values('robin','Btech','1996-07-29',5,1,30000,'A','yes')insert into std values('suman','Bcom','1995-12-25',4,2,25000,'A','No')insert into std values('Rekha','BE','1998-08-5',6,3,30000,'A','yes')select * from stdselect * from courseselect * from trainer--1. Show list of students. List contains roll no , student name , course name , trainer name in
--order of course name and student name.

select s.roll_no,s.sname ,c.cname,t.trainer_name
from std s
inner join course c on c.course_id=s.course_id
inner join trainer t on t.trainer_id=c.trainer_id

--2. Show list of students who have pending fees more than 1000rs . List should have student
--name , course name , balance fees . Show this list in descending order of balance fees.
select s.sname,s.fees_paid,c.total_fees
from std s
inner join course c on c.course_id=s.course_id
where c.total_fees-s.fees_paid>=1000

--3. Append letter ‘_spl’ to all batch ids of trainer ‘Devendra’.


--4 Update table student. Update ‘remark’ field. Remark should be ‘Eligible ’ if fees paid
--by student is more than 60%.
update std set reamark ='Eligible ' where fees_paid >= all(
select (total_fees*0.60) from  course )

select * from std
--5. Create a index to make retrieval faster based on course name.
create index coursename on course(course_id,cname,trainer_id) 

--6. List name of course for which more than 2 students are enrolled.
insert into std values('Poonam','Btech','1997-2-11',2,2,30000,'A','No')

select c.cname 
from std s 
inner join course c on c.course_id=s.course_id
group by c.course_id,cname
having count(c.course_id)>1

--7. List name of course for which maximum revenue was generated. ( max fee collection)select cname,total_fees from course  where total_fees=(select max(total_fees) as 'max fees' from course )--8. Select name of student who are in same batch as ‘Anil’.select sname from std where batch_id=(select batch_id from std where sname ='Anil')--9. Delete all students who are in course which is less than 2 months durationdelete std where course_id=(select course_id from course where duration <1)--10.Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course.select* from std  where is_placed='yes' and fees_paid = all(select total_fees from course )--11. Create a trigger to add student data in ex-student table if student is deleted from student table.--12. Create a view which shows name of trainer and number of students he is training.create view studentcount  as select count(s.roll_no) as 'count',t.trainer_namefrom course cinner join trainer t on t.trainer_id=c.trainer_idinner join std s on s.course_id=c.course_idgroup by t.trainer_nameselect * from studentcount--13. Show names of students who are more than 20 years old.select * from std where year(cast(CURRENT_TIMESTAMP as date) )-year(cast(birthdate as date))>=20--14. Show names of students who have paid all the fees. select s.sname,s.fees_paid,c.total_feesfrom std sinner join course c on c.course_id=s.course_idwhere c.total_fees-s.fees_paid=0--15. Write a procedure which accepts student id and returns his balance fees. 