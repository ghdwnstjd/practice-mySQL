create database board;
use board;

create table tbl_member(
	member_number int unsigned auto_increment primary key,
	member_id varchar(300),
	member_pw varchar(300),
	member_name varchar(300),
	member_age tinyint unsigned,
	member_gender varchar(100),
	member_email varchar(300),
	member_zipcode char(100),
	member_address varchar(500),
	member_address_detail varchar(500)
);

select * from tbl_member;