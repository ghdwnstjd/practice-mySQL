CREATE TABLE tbl_reply(
reply_number int unsigned auto_increment PRIMARY KEY,
reply_content varchar(500),
reply_date datetime DEFAULT now(),
member_number int unsigned,
board_number int unsigned,
CONSTRAINT fk_reply_member FOREIGN key(member_number)
REFERENCES tbl_member(member_number) ON DELETE cascade,
CONSTRAINT fk_reply_board FOREIGN key(board_number)
REFERENCES tbl_board(board_number) on delete cascade
);

select * from tbl_reply;

select * from tbl_board order by 1 desc;

insert into tbl_reply (reply_content, member_number, board_number)
values('개발 너무 좋다.', 2, 131077);


select * from tbl_member;
