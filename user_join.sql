create database meommi;
use meommi;

create table tbl_user(
	user_number int unsigned auto_increment primary key, 
	user_id varchar(500), 
	user_password varchar(500), 
	user_name varchar(500), 
	user_age tinyint unsigned, 
	user_gender varchar(100), 
	user_photo_path varchar(500), 
	user_introduce varchar(1000)
)

select * from tbl_user;

insert into tbl_user
(user_id, user_password, user_name, user_age, user_gender, user_photo_path, user_introduce)
values("test@test.com", 1234, "홍준성", 12, "M", "", "안녕");


