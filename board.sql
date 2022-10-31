create table tbl_board(
   board_number int unsigned auto_increment primary key,
   board_title varchar(500),
   board_content varchar(1000),
   board_date datetime default now(),
   board_read_count int unsigned default 0,
   member_number int unsigned,
   constraint fk_board foreign key(member_number)
   references tbl_member(member_number)
);

select * from tbl_board;


insert into tbl_board
(board_title, board_content, member_number)
(select board_title, board_content, member_number from tbl_board);

select board_number, board_title, board_content, board_date, board_read_count, m.member_number, member_name
from tbl_member m join tbl_board b on m.member_number = b.member_number
order by board_number desc limit 0, 10;

select * from tbl_board
order by board_number desc
limit 0, 10;


INSERT INTO tbl_board
(board_title, board_content, member_number)
VALUES('테스트 새 글 제목1', '테스트 새 글 내용1', 2);

