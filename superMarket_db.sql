create database supermarket_db;
use supermarket_db;

create table product_info(
product_id char(5) unique,
product_name varchar(20) not null,
count int not null,
manufacture_date date,
expiry_date date,
product_info text not null,
quality boolean,
stack_available boolean not null,
product_type set('daily_usages','personal_care','health_care','study_items') not null,
product_price double not null
);
 drop table  product_info;
desc product_info;

insert into product_info values('u101',"Soap",2,'2024-09-15','2026-09-27','it is familer to remove the body tan',true,true,'personal_care',180);
insert into product_info values('u102',"Dolo-Tablet",5,'2025-09-15','2028-09-27','It is destroy the fever within a day',true,true,'health_care',25);
insert into product_info values('u103',"note_book",5,'2026-01-15','2027-09-27','It is used to write a notes and story for students',null,true,'study_items',250);
insert into product_info values('u104',"T-shirt",2,'2023-08-13','2029-09-27','branded t-shirt for mens',true,true,'daily_usages',1000);

insert into product_info 
values('u105',"Soap",1,'2025-09-15','2026-10-27','it is familer to remove the body tan',true,true,'personal_care',80),
('u106',"pen -pack",1,'2026-02-15','2026-09-28','it is used to write a bright on notebook',true,true,'study_items',80),
('u107',"paracetamle sheet",2,'2024-09-15','2026-09-27','it is good to remove headeck',true,true,'health_care',180),
('u108','Soap,pen_pack',1,'2024-09-15','2026-09-27','These Products are good for personal care and study items',true,true,'personal_care,health_care',180);

insert into product_info(product_id,product_name,count,product_price)
values('u109','Dairymilk',2,40);
insert into product_info(product_id,product_name,count,product_price)
values('u1010','kitkat',2,80);
insert into product_info(product_id,product_name,count,product_price)
values('u1011','Egg',10,70);
insert into product_info(product_id,product_name,count,product_price)
values('u1012','Chips-packet',3,150);


select * from product_info;

create table customer_info();

create table offers_info();

create table graceries_info();

create table fruits_info();