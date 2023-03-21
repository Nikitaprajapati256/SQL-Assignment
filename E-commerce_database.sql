create table roles(
role_id int primary key identity(1,1),
roles varchar(40)
)

create table users(
users_id  int primary key identity(1,1),
username varchar(50) unique not null,
passward varchar(50) not null,
First_name varchar(20),
Last_name varchar(20),
mobile_no varchar(10),
role_id int ,
constraint fkRoleUser foreign key (role_id) references roles(role_id)
)

create table category(
category_id int primary key identity(1,1),
category_name varchar(50)
)

create table product(
product_id int primary key identity(1,1),
product_name varchar(40),
category_id int ,
constraint fkCatPrd foreign key (category_id) references category(category_id),
discription varchar(300),
price decimal,
product_image varchar(500)

)

create table order_detail(
order_id int primary key identity(1,1),
users_id int ,
constraint fkordUser foreign key(users_id) references users(users_id),
product_id int,
constraint fkordPrd foreign key (product_id) references product(product_id),
quantity int ,
order_date date 
)


create table cart(
cart_id int primary key identity(1,1),
users_id int,
constraint fkCartUser foreign key(users_id) references users(users_id),
product_id int,
constraint fkcartPrd foreign key (product_id) references product(product_id),
quantity int 
)