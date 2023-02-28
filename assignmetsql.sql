--3.Book table	– Book id , book name , author id , price , published date
--2.Author table 	– author id , author name , ph no , email , address, city 
--4.Awards table 	– award id , award type id, author id , book id , year 
--1.Awards master table – award type id , award name , award price

create table Awards_m (
award_type_id int primary key identity(1,1),
award_name varchar(40),
award_price int )
insert into Awards_m values('Yuva Puraskar',20000)
insert into Awards_m values('Jnanpith Award',1000000)
insert into Awards_m values('Sahitya Akademi Award',45000)
insert into Awards_m values('Saraswati Samman',35000)
insert into Awards_m values('Crossword Book Award',50000)

create table authors(
author_id int primary key identity(1,1),
a_name varchar(30),
phno varchar(10),
email varchar(40),
adds varchar(40),
city varchar(20)
)
insert into authors values('R.K. Narayan ',5164235785,'rknarayn@gmail.com','xyz ','Banglore')
insert into authors values(' Rohinton Mistry',1235809975,'rohinton@gmail.com','abdc','Mumbai')
insert into authors values(' Chetan Bhagat',7865364585,'Chetanbhagat@gmail.com','klmn','Surat')
insert into authors values(' Vikram Seth ',4569857210,'vikramseth@gmail.com','pqrs','Nagpur')
insert into authors values('Arundhati Roy ',6398744231,'arundhatiroy@gmail.com','lmnop ','Punjab')
create table Books(
book_id int primary key identity(1,1),
b_name varchar(20),
author_id int ,
constraint fkbookauthors foreign key (author_id) references authors(author_id),
price int ,
published_date date
)

insert into Books values(' The Guide0',1,600,'1960-06-30')
insert into Books values(' A Fine Balance',2,1000,'1995-10-10')
insert into Books values('2 States',3,899,'2008-08-15')
insert into Books values(' Midnight’s Children',2,1299,'1993-05-05')
insert into Books values('Diary of Ann Frank’',4,600,'1960-06-30')

create table awardss(
award_id int primary key identity ,
award_type_id int ,
constraint fk_awards foreign key (award_type_id) references Awards_m(award_type_id),
author_id int,
constraint fkawards foreign key (author_id) references authors(author_id),
book_id int ,
constraint fkawardbooks foreign key (book_id) references Books(book_id),
years int 
)

insert into awardss values(1,4,5,1965)
insert into awardss values(2,3,3,2010)
insert into awardss values(3,5,2,1998)
insert into awardss values(5,2,4,1995)
insert into awardss values(4,1,1,1967)

select * from Awards_m
select * from awardss
select * from authors
Select * from Books

--1.	Write a query to show book name , author name and award name for all books which has received any award. 
select b.*,a.a_name,ad.award_name
from Books b
inner join authors a on a.author_id=b.author_id
inner join awardss aw on aw.author_id=a.author_id
inner join Awards_m ad on ad.award_type_id=aw.award_type_id

--2	Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’ .

--3.Write a query to display authors and number of books written by that author. Show author who has written maximum books at the top.
select  a_name ,count(author_id) as'count'from authors
group by a_name
order by [count] desc

--4.	Write a query to select book name with 5 th highest price.
select  * from Books
order by price desc
offset 4 row 
fetch next 1 row only

--5.Select list of books which have same price as book ‘Diary of Ann Frank’.
select * from books where price =(
select price from books where book_id=(
select book_id from books where b_name='Diary of Ann Frank’')
)

--7.	Show award names and number of books which got these awards
select b.b_name,ad.award_name
from books b
inner join awardss a on a.author_id=b.author_id
INNER JOIN Awards_m ad on ad.award_type_id=a.award_type_id

--8.	Delete all books written by ‘Chetan Bhagat’ 
delete from Books where author_id=(
select author_id from authors where a_name='Chetan Bhagat')

--11.	Increase price of book by 10% if that book has received any award.
update books set price=price+(price*0.10) where book_id in(
select b.book_id
from Awardss aw 
inner join books b on b.book_id=aw.book_id
)


--12.	Show names of author and number of books written by that Author.
select count(author_id)
from books b
inner join authors a on a.author_id=b.author_id

--13.	Show names of authors whose books are published before year 2020.
select a.a_name ,ad.published_date
from authors a
inner join books ad on ad.author_id=a.author_id
where ad.published_date < cast('1-1-1995'as date)

--14.	Show name of books which has published within 1 year after 06 july 2008.

select published_date from books where published_date >'2008-07-06'

--15.	Delete all authors whose no book is published in year 2020.


