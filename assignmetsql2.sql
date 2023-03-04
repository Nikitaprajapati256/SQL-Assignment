--Trainer � Trainer id , trainer name , join date , email , experience in years
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

--Course � course id , course name, duration (in months), trainer id , total fees 
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

--Student - rollno , sname , degree , birthdate , course id , batch id , fees paid , Remark, is placed
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

--3. Append letter �_spl� to all batch ids of trainer �Devendra�.


--4 Update table student. Update �remark� field. Remark should be �Eligible � if fees paid
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

--7. List name of course for which maximum revenue was generated. ( max fee collection)