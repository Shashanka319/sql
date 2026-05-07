create database youtube;
 use youtube;
 
 show databases;
 
 create table user_info(
 user_id char(3), 
 user_name varchar(20),
 phone_number int,
 gender enum('male','female','other'),
 email varchar(20)
 );
 alter table user_info add no_od_subscribers int, add bio text;
 alter table user_info add no_of_followers int;
 alter table user_info add description_type enum('source_code','link','information');
 
 
 
 alter table user_info rename column no_od_subscribers to subscribers;
 alter table user_info rename column no_of_followers to follwers;
 
 alter table user_info modify column phone_number bigint, modify bio varchar(20);
 alter table user_info modify gender varchar(20);
 alter table user_info modify subscribers bigint;
 
 desc user_info;
 
 create table post(
 post_id char(5),
 poster_name varchar(20),
 posting_date date,
 no_of_viwers int,
 post_type enum('video','image','reel')
 ); 
 
 rename table post to post_info;
 
 alter table post_info add bio text;
 alter table post_info add tagpeople boolean;
 alter table post_info add content_info text;
 
 alter table post_info drop content_info;
 
 alter table post_info modify column post_type varchar(20);
 alter table post_info modify no_of_viwers bigint;
 alter table post_info modify tagpeople char;
 
 alter table post_info rename column tagpeople to tag_people;
 alter table post_info rename column no_of_viwers to viwers;
 desc post_info;
 select * from post_info;
 
 desc post_info;
 
 insert into post_info
 values('u103',"Shashank",'2026-09-22','1000',"video","hcbsjcvsjvsjvsv",'m'),
 ('u102',"Madhan",'2020-09-23',"2000","image","sksjfsjfb",'n');
 
 update post_info set poster_name="Shambu";
 
 delete from post_info where post_id = 'u101';
 
 delete from post_info;
 
 
 
 
 
 
 create table comments(
 no_of_comments int,
 comments varchar(50),
 post_type enum('vedio','image','reel'),
 viewer_name varchar(20),
 account_name varchar(20)
 );
 
 rename table comments to comments_info;
 
 alter table comments_info add comment_date date;
 alter table comments_info add comment_time timestamp;
 alter table comments_info add comment_day enum('sunday','monday','tuesday','wednesday','thursdau','friday','saturday');
 
 alter table comments_info drop comment_time;
 
 alter table comments_info modify column post_type bigint;
 alter table comments_info modify no_of_comments bigint;
 alter table comments_info modify comments text;
 
 alter table comments_info rename column no_of_comments to counts_of_comments;
 alter table comments_info rename column comment_date to date;
 
 desc comments_info;
 
 create table youtube_description(
 acoount_name varchar(20),
 description_type enum('link','code_source','information'),
 youtube_description text,
 followers int,
 alert boolean
 );
 
 alter table youtube_description add account_name varchar(20);
 alter table  youtube_description add channel_name varchar(20);
 alter table  youtube_description add no_of_subscribers int;
 
 alter table youtube_description drop no_of_subscribers;
 
 alter table youtube_description modify column followers bigint;
 alter table youtube_description modify youtube_description text;
 alter table youtube_description modify description_type varchar(20);
 
 alter table youtube_description rename column description_type to type;
 alter table youtube_description rename column youtube_description to description;
 
 
  desc youtube_description;
 
 drop table  youtube_description;
 drop table comments_info;
 
create table users(
id char(5) unique ,
user_name varchar(10),
email varchar(20) not null unique,
phone_number bigint(20)
);
desc users;
insert into users
values('u101',"SHashank","sharat1986@gmail.com",9743873982);

insert into users
values('u102',"SHashank","shank1986@gmail.com",9743873982);

select * from users;
 
