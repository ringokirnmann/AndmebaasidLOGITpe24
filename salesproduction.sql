use logitpe24
CREATE TABLE customers(
customer_id int Primary Key identity(1,1),
first_name varchar(25) not null,
last_name varchar(30) not null,
phone char(13),
email varchar(25) not null,
street varchar(25),
city varchar(25),
state varchar(25),
zip_code char(5),
)
select * from customers

insert into customers
values('Priit', 'Mets', '574309', 'priit.mets@gmail.com', 'mingi tänav', 'linnutee', 'harjumaa', '13220')

CREATE TABLE stores(
store_id int primary key identity(1, 1),
store_name varchar(29) UNIQUE not null,
phone char(13),
email varchar(25) not null,
street varchar(25),
city varchar(25),
state varchar(25),
zip_code char(5),
)

select * from stores
insert into stores
values ('sportland', '5623015', 'sportland@gmail.com', 'linnu tee', 'tallinn', 'harjumaa', '13221')

create table staffs(
staff_id int primary key identity(1, 1),
first_name varchar(29) UNIQUE not null,
last_name varchar(29) UNIQUE not null,
email varchar(25) not null,
phone char(13),
active bit,
store_id int,
Foreign key (store_id) references stores(store_id),
manager_id bit)

select * from staffs
insert into staffs
values ('Tanel', 'Pihlak', 'Tanelpihlak@gmail.com', '3211851', 1, 1, 0)

CREATE TABLE orders(
order_id int Primary Key identity(1,1),
customer_id int,
Foreign Key (customer_id) References customers(customer_id),
order_status TEXT,
order_date date,
required_date date,
shipped_date date)

create table order_items(
order_id int, 
foreign key (order_id) references orders(order_id),
item_id int primary key identity(1, 1),
product_id int,
foreign key (product_id) references product(product_id),
quantity int,
list_price money,
discount money
)

create table brands(
brand_id int primary key identity(1,1),
brand_name varchar(25) UNIQUE)

insert into brands
values ('Aabibas')

create table categories(
category_id int Primary key identity(1,1),
category_name varchar(25) UNIQUE)

insert into categories
values ('riiided')

create table product(
product_id int Primary key identity(1,1),
product_name VARCHAR(25) UNIQUE,
brand_id int,
foreign key (brand_id) references brands(brand_id),
category_id int,
foreign key (category_id) references categories(category_id),
model_year int,
list_price money)

select * from product

insert into product
values('tsärk',2,2,2018,20)

create table stocks(
store_id int,
product_id int,
primary key (store_id, product_id),
foreign key (store_id) references stores(store_id),
foreign key (product_id) references product(product_id),
quantity int)

insert into stocks
values(1, 1, 100),
(1, 2, 50)

select * from stocks



