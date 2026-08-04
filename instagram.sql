create database instagram;

use instagram;
PRIMARYemail
show databases;
course
create table user_info(
user_id char(5), user_name varchar(20), user_password varchar(10), gender enum('male','female','others')
);

insert into user_info(user_id, user_name, user_password, gender)
values 
('u101',"Shahshank","shashank","male"),
('u102',"Harshitha","harshi","female"),
('u103',"Keerthana","keerthi","female"),
('u104',"Akash","akza","male");
employeesemployee_idemployeesemployees
select * from user_info;

create database supermarket_db;

use supermarket_db;

create table products (
    product_id int,
    product_name varchar(50),
    category varchar(50),
    price int
);

create table sold_products (
    product_id int,
    product_name varchar(50),
    category varchar(50),
    price int
);

insert into products values
(1, 'rice', 'grocery', 1200),
(2, 'milk', 'dairy', 50),
(3, 'bread', 'bakery', 40),
(4, 'soap', 'personal care', 35),
(5, 'shampoo', 'personal care', 180),
(6, 'biscuits', 'snacks', 25),
(7, 'juice', 'beverages', 90),
(8, 'oil', 'grocery', 150);

insert into sold_products values
(1, 'rice', 'grocery', 1200),
(2, 'milk', 'dairy', 50),
(3, 'bread', 'bakery', 40),
(4, 'soap', 'personal care', 35),
(9, 'chips', 'snacks', 30),
(10, 'ice cream', 'frozen food', 200),
(11, 'soft drink', 'beverages', 100),
(12, 'detergent', 'cleaning', 250);users_info





