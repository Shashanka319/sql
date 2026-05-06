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
 alter table user_info add no_od_subscribers int;
 alter table user_info add no_of_followers int;
 alter table user_info add description_type enum('source_code','link','information');
 
 alter table user_info drop description_type;
 
 alter table user_info rename column no_od_subscribers to subscribers;
 alter table user_info rename column no_of_followers to follwers;
 
 alter table user_info modify column phone_number bigint;
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
 desc post;
 
 create table comments(
 no_of_comments int,
 comments varchar(50),
 post_type enum('vedio','image','reel'),
 viewer_name varchar(20),
 account_name varchar(20)
 );
 
 rename table comments to comments_info;
 desc comments;
 
 create table youtube_description(
 acoount_name varchar(20),
 description_type enum('link','code_source','information'),
 youtube_description text,
 followers int,
 alert boolean
 );
 desc youtube_description;
 
 
 
