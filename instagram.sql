create database instagram;

use instagram;

show databases;

create table user_info(
user_id char(5), user_name varchar(20), user_password varchar(10), gender enum('male','female','others')
);

insert into user_info(user_id, user_name, user_password, gender)
values 
('u101',"Shahshank","shashank","male"),
('u102',"Harshitha","harshi","female"),
('u103',"Keerthana","keerthi","female"),
('u104',"Akash","akza","male");

select * from user_info;



