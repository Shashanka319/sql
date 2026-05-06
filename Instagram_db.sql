create database instagram_db;

use instagram_db;

create table users_info(
u_id char(5), user_name varchar(20), psw varchar(25), mobile_number bigint, email varchar(25), gender enum('male','female','other'), dob date, bio text, followers int
);

show databases;

desc users_info;

rename table user_info to users_info;

drop table users_info; 

alter table users_info add no_Of_following int;

alter table users_info drop bio;

alter table users_info modify column mobile_number bigint;

alter table users_info rename column psw to possword;





insert into user_info(u_id, user_name, psw, mobile_number, email, gender, dob, bio, followers)
values('u101', "Shashank","shashank@1727",9743873982,"sharathshashank1986@gmail.com","male",27-09-2004,"cacacjbajcbajc",575);

