SELECT user_number, user_id, user_password, user_name, user_age, user_gender, user_photo_path, user_introduce
FROM meommi.tbl_user;


select * from tbl_user;

drop table tbl_user;

create table tbl_user(
	user_number int unsigned auto_increment primary key, 
	user_id varchar(500), 
	user_password varchar(500), 
	user_name varchar(500), 
	user_photo_path varchar(500), 
	user_introduce varchar(1000),
	user_login_method tinyint
)




create database meommi;
use meommi;
drop table tbl_user;
drop table tbl_favorite_place;
drop table tbl_place_review;
drop table tbl_review_file;
drop table tbl_post;
drop table tbl_comments;
drop table tbl_post_file;
drop table tbl_funeral;
drop table tbl_follow;


select * from tbl_user;
select * from tbl_favorite_place;
select * from tbl_place_review;
select * from tbl_review_file;
select * from tbl_post;
select * from tbl_comments;
select * from tbl_post_file;
select * from tbl_funeral;
select * from tbl_follow;

create table tbl_user(
user_number int unsigned auto_increment primary key,
user_id varchar(100),
user_password varchar(100),
user_name varchar(100),
user_photo_path varchar(100),
user_introduce varchar(100),
user_login_method tinyint
)

create table tbl_favorite_place(
favorite_place_place_id varchar(100) primary key,
favorite_place_adr_address varchar(100),
favorite_place_business_status varchar(100),
favorite_place_geometry varchar(100),
favorite_place_name varchar(100),
favorite_place_photos varchar(100),
favorite_place_opening_hours varchar(100),
user_number int unsigned,
constraint fk_favorite_place foreign key(user_number)
references tbl_user(user_number)
)

create table tbl_place_review(
place_review_number int unsigned auto_increment primary key,
place_review_contents varchar(100),
place_review_rating int,
place_review_datetime datetime default now(),
user_number int unsigned,
user_name varchar(100),
place_id varchar(100),
place_review_helful int,
constraint fk_place_review_writer foreign key(user_number)
references tbl_user(user_number)
);

INSERT INTO tbl_place_review
(place_review_contents, place_review_rating, user_number, user_name, place_id)
VALUES('아주 좋아요 다신 안올거에요 여기~', 3, 1, "홍준성", "1220594086");

alter table tbl_place_review alter column place_review_helful set default 0;


select * from tbl_place_review;

create table tbl_review_file(
review_file_number int unsigned auto_increment primary key,
review_file_system_name varchar(100),
review_file_origin_name varchar(100),
reivew_file_path varchar(100),
place_review_number int unsigned,
constraint fk_review_file foreign key(place_review_number)
references tbl_place_review(place_review_number) on delete cascade
);


drop table tbl_review_file;

drop table tbl_place_review;

drop table tbl_helful;

select * from tbl_helful;


ALTER TABLE tbl_review_file DROP FOREIGN KEY fk_review_file;

select * from tbl_review_file;

drop table tbl_review_file;
drop table tbl_place_review;


select a.place_review_number, a.place_id, a.place_review_contents, a.place_review_rating, a.place_review_dateTime, a.user_number, a.user_name, b.review_file_system_name
from tbl_place_review a inner join tbl_review_file b
where a.place_id= 59564823;


create table tbl_post(
post_number int unsigned auto_increment primary key,
post_content varchar(500),
post_datetime datetime default now(),
post_like_number int,
user_number int unsigned,
constraint fk_post_writer foreign key(user_number)
references tbl_user(user_number)
)

create table tbl_comments(
comments_number int unsigned auto_increment primary key,
comments_datetime datetime default now(),
comments_content varchar(500),
user_number int unsigned,
post_number int unsigned,
constraint fk_comments_writer foreign key(user_number)
references tbl_user(user_number),
constraint fk_post_number foreign key(post_number)
references tbl_post(post_number)
)


insert into tbl_comments (comments_content, user_number, post_number)
values('테스트 댓글', 1, 1);

drop table tbl_post_file;

   create table tbl_post_file(
   post_file_number int unsigned auto_increment primary key,
   post_file_system_name varchar(100),
   post_file_origin_name varchar(100),
   post_number int unsigned,
   user_number int unsigned,
   constraint fk_post_file foreign key(post_number)
   references tbl_post(post_number),
   constraint fk_user_number foreign key(user_number)
   references tbl_user(user_number)
   )


   select * from tbl_helful;
   
create table tbl_follow(
follower_number int unsigned,
following_number int unsigned,
constraint fk_follower foreign key(follower_number)
references tbl_user(user_number),
constraint fk_follwing foreign key(following_number)
references tbl_user(user_number),
PRIMARY KEY(follower_number, following_number)
)

create table tbl_funeral(
funeral_number int unsigned auto_increment primary key,
funeral_name varchar(100),
funeral_phone varchar(100),
funeral_address varchar(100),
funeral_content varchar(500),
funeral_url varchar(100)
)





create table tbl_user(
   user_number int unsigned auto_increment primary key,/*유저 번호*/
   user_id varchar(500),/*유저 아이디*/
   user_password varchar(500),/*유저 패스워드*/
   user_name varchar(500),/*유저 이름*/
   user_photo_path varchar(500),/*유저 사진경로*/
   user_introduce varchar(500),/*유저 자기소개*/
   user_login_method tinyint unsigned default 0 constraint user_method check (user_login_method in ('0','1','2'))/*유저 로그인 방식*/
);
drop table tbl_user;
select  * from tbl_user;

INSERT INTO tbl_user
(user_id, user_password, user_name, user_photo_path, user_introduce, user_login_method)
VALUES('hoyung', '1234', '이호영', 'localhost', 'hello', 1);

INSERT INTO tbl_user
(user_id, user_password, user_name, user_photo_path, user_introduce, user_login_method)
VALUES('gildong', '1234', '홍길동', 'localhost', 'hello', 2);

INSERT INTO tbl_user
(user_id, user_password, user_name, user_photo_path, user_introduce, user_login_method)
VALUES('anonymous', '1234', '익명사용자', 'localhost', 'helloanonymous', 0);

INSERT INTO tbl_user
(user_id, user_password, user_name, user_photo_path, user_introduce, user_login_method)
VALUES('mrGGondae', '1234', '라떼는말이야', 'localhost', 'helloGGondae', 1);

create table tbl_post(
   post_number int unsigned auto_increment primary key,/* 게시글 번호 */
   post_content varchar(500),/* 게시글 내용 */
   post_datetime datetime default now(),/* 게시글 작성시간 */
   post_like_number int unsigned default 0,/* 게시글 좋아요 수 */
   user_number int unsigned not null,
   constraint fk_post foreign key (user_number) 
   references tbl_user(user_number)/* 게시글 외래키 제약조건*/
);
drop table tbl_post;
select  * from tbl_post;
INSERT INTO tbl_post
(post_content, post_datetime, post_like_number, user_number)
VALUES('mrGGondae 12번 게시글 작성함', CURRENT_TIMESTAMP,1212 ,4);

create table tbl_comments(
   comments_number int unsigned auto_increment primary key,/*댓글 번호*/
   comments_datetime datetime default now(),/*댓글 작성시간*/
   comments_content varchar(500),/*댓글 내용*/
   user_number int unsigned not null,
   post_number int unsigned not null,
   constraint fk_comments_user foreign key(user_number) 
   references tbl_user (user_number),/*게시글의 작성자 닉네임 외래키 제약조건*/
   constraint fk_comments_post foreign key(post_number) 
   references tbl_post (post_number)/*게시글번호의 댓글 외래키 제약조건*/
);
drop table tbl_comments;
select  * from tbl_comments;

INSERT INTO tbl_comments
(comments_content, user_number, post_number)
VALUES('gildong댓글5 작성', 2, 1);

select post_number,post_content,post_datetime,post_like_number,p.user_number,u.user_id from 
      tbl_post p join tbl_user u on p.user_number=u.user_number order by post_datetime desc limit 0,5;

create table tbl_post_file(
   post_file_number int unsigned auto_increment primary key,/*파일 번호*/
   post_file_system_name varchar(500),/*시스템파일명*/
   post_file_original_name varchar(500),/*원본파일명*/
   post_file_path varchar(500),/*업로드 파일 경로*/
   post_number int unsigned not null,/*파일 업로드한 게시글 번호*/
   constraint fk_postfile foreign key(post_number) 
   references tbl_post (post_number)/*파일 업로드한 게시글 번호 외래키 제약조건*/
);





drop table tbl_post_file;
select  * from tbl_post_file;

INSERT INTO tbl_post_file
(post_file_system_name, post_file_original_name, post_file_path, post_number)
VALUES('tttt', 'uuuuu.txt', 'localhost', 1);


select * from tbl_user;

select place_review_number, place_review_contents, place_review_rating, place_review_dateTime, t.user_number, u.user_name, place_review_helful
from tbl_place_review t inner join tbl_user u 
on t.user_number = u.user_number
where place_id = 59564823 order by place_review_helful desc;



==============================================================================================================================================================

create database meommi;
use meommi;

create table tbl_user(
   user_number int unsigned auto_increment primary key,
   user_id varchar(100),
   user_password varchar(100),
   user_name varchar(100),
   user_login_method tinyint
   );
  
  
   create table tbl_user_file(
   user_file_number int unsigned auto_increment primary key,
   user_file_system_name varchar(100),
   user_file_origin_name varchar(100),
   user_number int unsigned,
   constraint fk_user_file foreign key(user_number)
   references tbl_user(user_number)
   );
   
   
   
   create table tbl_place_review(
   place_review_number int unsigned auto_increment primary key,
   place_review_contents varchar(500),
   place_review_rating int,
   place_review_datetime datetime default now(),
   user_number int unsigned,
   place_id varchar(100),
   place_name varchar(300),
   place_address varchar(500),
   user_name varchar(250),
   place_review_helful int default 0,
   constraint fk_place_review_writer foreign key(user_number)
   references tbl_user(user_number)
   );
   
   create table tbl_review_file(
   review_file_number int unsigned auto_increment primary key,
   review_file_system_name varchar(100),
   review_file_origin_name varchar(100),
   place_review_number int unsigned,
   constraint fk_review_file foreign key(place_review_number)
   references tbl_place_review(place_review_number)
   );
   
   create table tbl_post(
   post_number int unsigned auto_increment primary key,
   post_content varchar(500),
   post_datetime datetime default now(),
   user_number int unsigned,
   constraint fk_post_writer foreign key(user_number)
   references tbl_user(user_number)
   );
  
   ============================
   create table tbl_comments(
   comments_number int unsigned auto_increment primary key,
   comments_datetime datetime default now(),
   comments_content varchar(500),
   user_number int unsigned,
   post_number int unsigned,
   constraint fk_comments_writer foreign key(user_number)
   references tbl_user(user_number),
   constraint fk_post_number foreign key(post_number)
   references tbl_post(post_number)
   )
   
   create table tbl_post_file(
   post_file_number int unsigned auto_increment primary key,
   post_file_system_name varchar(100),
   post_file_origin_name varchar(100),
   post_number int unsigned,
   user_number int unsigned,
   constraint fk_post_file foreign key(post_number)
   references tbl_post(post_number),
   constraint fk_user_number foreign key(user_number)
   references tbl_user(user_number)
   )
   
   create table tbl_follow(
   follower_number int unsigned,
   following_number int unsigned,
   constraint fk_follower foreign key(follower_number)
   references tbl_user(user_number),
   constraint fk_follwing foreign key(following_number)
   references tbl_user(user_number),
   PRIMARY KEY(follower_number, following_number)
   )
   
   create table tbl_funeral(
   funeral_number int unsigned auto_increment primary key,
   funeral_name varchar(100),
   funeral_phone varchar(100),
   funeral_address varchar(100),
   funeral_content varchar(500),
   funeral_url varchar(500)
   )
   
   create table tbl_helful(
   user_number int unsigned,
   place_review_number int unsigned,
   constraint user_number foreign key(user_number)
   references tbl_user(user_number),
   constraint place_review_number foreign key(place_review_number)
   references tbl_place_review(place_review_number),
   PRIMARY KEY(user_number, place_review_number)
   )
   
   INSERT INTO meommi.tbl_user
   (user_id, user_password, user_name, user_login_method)
   VALUES('1', '1', '1', 0);
   INSERT INTO meommi.tbl_user
   (user_id, user_password, user_name, user_login_method)
   VALUES('iw6192', '1029', '김인영', 1);

INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('무지개언덕','044-863-7075','세종시','장례, 화장, 봉안','http://www.무지개언덕.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('펫포유','1533-4426','세종시','장례, 화장, 봉안','http://www.petforyou.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('파트라슈','051-723-2201','부산 기장군','장례, 화장, 봉안','http://www.mypatrasche.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('센트럴파크(주)','051-728-5411','부산 기장군','장례, 화장, 봉안','http://www.startice.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('아이별','051-727-4499','부산 기장군','장례, 화장, 봉안','http://www.aistar.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('대구러브펫','053-593-4900','대구 달서구','장례','http://dglovepet.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('㈜더 포에버','032-713-5002','인천 서구','장례, 봉안','-');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('어게인','032-566-1936','인천 서구','봉안','-');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('㈜하늘펫','062-946-2626','광주 광산구','장례','-');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('이별공간','***********','울산 울주군','장례, 화장, 봉안','http://ebyulplace.modoo.at');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('(주)펫콤','1833-5158','경기 안산시','화장','https://petcom.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('㈜펫바라기','031-976-3179','경기 고양시','장례, 화장, 봉안','http://www.petbaragi.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('몽몽이엠파크','1811-1336','경기 남양주시','장례, 화장, 봉안','http://mmempark.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('리멤버','080-200-5004','경기 용인시','장례, 화장, 봉안','http://리멤버.net');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('씨엘로펫','1577-7332','경기 용인시','장례, 화장, 봉안','http://www.cielopet.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('㈜아리아펫','031-635-2266','경기 이천시','장례, 화장','http://www.aria.pet');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('㈜위디안(엔젤스톤)','031-981-0271','경기 김포시','장례, 화장, 봉안','http://www.angelstone.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('페트나라','031-997-4445','경기 김포시','장례, 화장, 봉안','http://petnara.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('마스꼬따 휴㈜','031-989-2444','경기 김포시','장례, 화장, 봉안','http://www.mascotahue.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('아이드림펫','031-996-7444','경기 김포시','장례, 화장, 봉안','http://www.idreampet.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('(주)하이루','031-984-9922','경기 김포시','장례, 화장, 봉안','http://www.hiroopark.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('스토리펫','031-353-5579','경기 화성','장례, 화장, 봉안','http://www.스토리펫.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('강아지넷','031-296-4441','경기 화성시','장례, 화장, 봉안','http://www.kangaji.net');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('펫오케스트라','1588-1289','경기 화성시','장례, 화장, 봉안','http://www.petorchestra.co.kr/');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('(주)우리반려동물문화원','1899-6415','경기 화성시','장례, 화장, 봉안','http://www.uripet.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('러브펫','031-796-4341','경기 광주시','장례, 화장, 봉안','http://www.러브펫.net');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('하늘애','1588-7166','경기 광주시','장례, 화장, 봉안','http://snara.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('백꽃사랑하이빛','***********','경기 광주시','장례, 화장, 봉안','-');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('21그램 반려동물 장례식장','1688-1240','경기 광주시','장례, 화장, 봉안','http://21gram.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('㈜해피엔딩','1899-5127','경기 광주시','장례, 화장, 봉안','http://www.wehappyending.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('㈜펫포레스트','1577-0996','경기 광주시','장례, 화장, 봉안','http://petforest.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('더 고마워','031-878-7779','경기 양주시','장례, 화장, 봉안','http://www.thankyoupet.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('스타펫','1588-9344','경기 포천시','화장','-');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('강릉 펫사랑','033-645-8888','강원 강릉시','장례, 화장, 봉안','https://gpetlove.modoo.at');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('펫 메모리얼','1566-4379','강원 횡성군','장례, 화장, 납골, 봉안','http://www.petmemorial.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('굿바이펫','043-642-1537','충북 제천시','장례, 화장, 봉안','http://goodbyepet.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('대전 스카이 펫','1588-4476','충청 옥천군','화장, 봉안','https://mamresky.modoo.at/');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('스마일 어게인','1544-9262','충북 영동군','장례, 화장, 봉안','http://www.smileagain.net');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('우바스','1588-6326','충북 청주시','장례, 화장, 봉안','http://www.ubas.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('펫로스엔젤','1577-2518','충북 청주시','장례, 화장, 봉안','http://www.petlossangel.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('21그램 반려동물 장례식장 천안아산점','1688-1240','충남 천안시','장례, 화장, 건조, 봉안','http://21gram.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('㈜좋은친구들','041-858-4411','충남 공주시','장례, 화장','http://goodfriend2012.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('리멤버 파크','041-735-1700','충남 논산시','장례, 화장, 봉안','http://www.rememberpark.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('위드엔젤','041-332-8787','충남 예산군','장례, 화장, 봉안','http://www.withangel.net');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('전주 반려동물 장례식장 아리움','063-223-7942','전북 전주시','장례, 화장, 봉안','http://www.arium.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('펫바라기','063-625-3737','전북 남원시','장례, 화장, 봉안','http://www.petbaragi.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('전주 하늘','063-432-0600','전북 완주군','장례, 화장, 봉안','http://전주하늘반려동물장례식장.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('오수 펫 추모공원','063-643-0486','전북 임실군','장례, 화장, 봉안','http://www.osupet.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('펫 메모리얼 파크','061-691-4700','전남 여수','장례, 화장, 봉안','http://www.pet-park.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('타임투반려동물장례문화원','061-322-0122','전남 함평군','장례, 건조, 봉안','http://www.timeto.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('(주)한별소울펫','1588-9749','경북 구미시','장례, 화장, 건조, 봉안','https://hanbyulsoulpet.modoo.at');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('아이들랜드','1522-6979','경북 경산시','장례, 화장, 봉안','http://아이들랜드.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('하얀민들레','1599-1627','경북 청도군','장례, 화장, 봉안','http://www.youngheal.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('강아지 펫 헤븐','1899-6144','경북 성주군','장례, 화장, 봉안','http://petheaven.ad-media.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('스윗드림 펫','054-974-2220','경북 칠곡군','장례, 화장, 봉안','http://www.sweetdreampet.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('아이헤븐','1577-5474','경남 김해시','장례, 화장, 봉안','http://iheaven.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('펫로스 케어','1522-2253','경남 김해시','장례, 화장, 봉안','http://www.petlosscare.co.kr/');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('펫누리','1566-9399','경남 김해시','화장, 장례, 봉안','http://www.becomestars.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('시민반려동물장례식장','1811-8044','경남 김해시','장례, 화장, 봉안','http://www.시민반려동물장례식장.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('(주)펫노블레스','055-374-4400','경남 양산시','장례, 화장, 봉안','http://www.petnoblesse.com');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('메리온','055-374-6503','경남 양산시','장례, 화장, 봉안','http://www.merion.co.kr');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('한별 리멤버파크','1899-2610','경남 함안군','장례, 화장, 봉안','http://hanbyuldog.modoo.at');
INSERT INTO meommi.tbl_funeral(funeral_name, funeral_phone, funeral_address, funeral_content, funeral_url) VALUES('하늘소풍','1566-4546','경남 고성군','장례, 화장, 봉안','http://www.하늘소풍.kr');
   










==========================================================================================================================================================



create table tbl_user(
   user_number int unsigned auto_increment primary key,
   user_id varchar(100),
   user_password varchar(100),
   user_name varchar(100),
   user_login_method tinyint
   );
  
  
   create table tbl_user_file(
   user_file_number int unsigned auto_increment primary key,
   user_file_system_name varchar(100),
   user_file_origin_name varchar(100),
   user_number int unsigned,
   constraint fk_user_file foreign key(user_number)
   references tbl_user(user_number)
   );
   
   drop table tbl_place_review;
  drop table tbl_review_file;
 drop table tbl_helful;
   
   create table tbl_place_review(
   place_review_number int unsigned auto_increment primary key,
   place_review_contents varchar(500),
   place_review_rating int,
   place_review_datetime datetime default now(),
   user_number int unsigned,
   place_id varchar(100),
   place_name varchar(300),
   place_address varchar(500),
   user_name varchar(250),
   place_review_helful int default 0,
   constraint fk_place_review_writer foreign key(user_number)
   references tbl_user(user_number)
   );
   
   create table tbl_review_file(
   review_file_number int unsigned auto_increment primary key,
   review_file_system_name varchar(100),
   review_file_origin_name varchar(100),
   place_review_number int unsigned,
   constraint fk_review_file foreign key(place_review_number) 
   references tbl_place_review(place_review_number) on delete cascade
   );
   
   create table tbl_post(
   post_number int unsigned auto_increment primary key,
   post_content varchar(500),
   post_datetime datetime default now(),
   user_number int unsigned,
   constraint fk_post_writer foreign key(user_number)
   references tbl_user(user_number)
   );
   ============================
   
   create table tbl_comments(
   comments_number int unsigned auto_increment primary key,
   comments_datetime datetime default now(),
   comments_content varchar(500),
   user_number int unsigned,
   post_number int unsigned,
   constraint fk_comments_writer foreign key(user_number)
   references tbl_user(user_number),
   constraint fk_post_number foreign key(post_number)
   references tbl_post(post_number) on delete cascade
   );
   
  select * from tbl_user_file;
   select * from tbl_post;
   select * from tbl_post_file;
   drop table tbl_comments;
   drop table tbl_post_file;
  drop table tbl_post;
 
 select * from tbl_follow;
    select * from tbl_post;
   select * from tbl_post_file;
 select * from tbl_comments;
 select * from tbl_user;
   
INSERT INTO tbl_follow
(follower_number, following_number)
VALUES(3, 1);


   create table tbl_post(
   post_number int unsigned auto_increment primary key,
   post_content varchar(500),
   post_datetime datetime default now(),
   user_number int unsigned,
   constraint fk_post_writer foreign key(user_number)
   references tbl_user(user_number)
   );
  
   create table tbl_post_file(
   post_file_number int unsigned auto_increment primary key,
   post_file_system_name varchar(100),
   post_file_origin_name varchar(100),
   post_number int unsigned,
   user_number int unsigned,
   constraint fk_post_file foreign key(post_number)
   references tbl_post(post_number) on delete cascade,
   constraint fk_user_number foreign key(user_number)
   references tbl_user(user_number)
   );
   
   create table tbl_follow(
   follower_number int unsigned,
   following_number int unsigned,
   constraint fk_follower foreign key(follower_number)
   references tbl_user(user_number),
   constraint fk_follwing foreign key(following_number)
   references tbl_user(user_number),
   PRIMARY KEY(follower_number, following_number)
   )
   
   create table tbl_funeral(
   funeral_number int unsigned auto_increment primary key,
   funeral_name varchar(100),
   funeral_phone varchar(100),
   funeral_address varchar(100),
   funeral_content varchar(500),
   funeral_url varchar(500)
   )
   
   insert into tbl_place_review 
(place_review_contents, place_review_rating, user_number, place_id)
values('테스트 중입니다. 테스트 중입니다', 5, 1, 1);
   
   create table tbl_helful(
   user_number int unsigned,
   place_review_number int unsigned,
   constraint user_number foreign key(user_number)
   references tbl_user(user_number),
   constraint place_review_number foreign key(place_review_number)
   references tbl_place_review(place_review_number) on delete cascade,
   PRIMARY KEY(user_number, place_review_number)
   )
   
   INSERT INTO meommi.tbl_user
   (user_id, user_password, user_name, user_login_method)
   VALUES('1', '1', '1', 0);
   INSERT INTO meommi.tbl_user
   (user_id, user_password, user_name, user_login_method)
   VALUES('iw6192', '1029', '김인영', 1);
   
  
  
  
  create table ELECTRIC_CARS(
	  ID int unsigned primary key,
	  MODEL varchar(100),
	  TOP_SPEED int unsigned,
	  CAPACITY int unsigned,
	  CHARGING_TIME int unsigned,
	  NOMINAL_RANGE int unsigned
  );
 
 select * from electric_cars;
 
 insert into ELECTRIC_CARS 
 (ID, MODEL, TOP_SPEED, CAPACITY, CHARGING_TIME, NOMINAL_RANGE)
 values('403', 'Mia electric', 64, 1, 3, 125);
  
 
 select * from ELECTRIC_CARS
 where TOP_SPEED >=150 and CHARGING_TIME <=10 order by id;
 

create table GAME_USERS(
	ID VARCHAR(100) primary key,
	DISTANCE INT unsigned,
	TIME_SPENT DECIMAL,
	BEST_DATE DATETIME
);


insert into GAME_USERS
(ID, DISTANCE, TIME_SPENT, BEST_DATE)
values ('solubleusd1278', 141900, 8.111473256, '2016-11-19 16:17:26');

select MAX(DISTANCE) DISTANCE from GAME_USERS;


