create table t97_review (
	no number(5) primary key,
	hit number(5) not null,
	title varchar2(150) not null,
	writer varchar2(15) not null,
	content varchar2(4000) not null,
	reg_date date default sysdate,
	foreign key(writer)
	references t97_member (id)
);

select * from tab;

create table t97_review_reply (
	t_no number(5) not null,
	no number(5) primary key,
	writer varchar2(20) not null,
	content varchar2(300) not null,
	reg_date date default sysdate,
  foreign key(t_no)
  references t97_review (no)
);


--시퀀스 만들어야함~~~~~~~~~~~~~~~~~~~~~~~~~~~
create sequence s_review_no;
create sequence s_reply_no;





insert into t97_review (no, hit, title, writer, content, reg_date)
values (s_review_no.nextval, 0, '제목2', 'aaaa', '내2', sysdate);

insert into t97_review (no, hit, title, writer, content, reg_date)
values (s_review_no.nextval, 0, '제목3', 'bbbb', '내3', sysdate);

insert into t97_review (no, hit, title, writer, content, reg_date)
values (s_review_no.nextval, 0, '제목4', 'cccc', '내4', sysdate);




insert into t97_review_reply (t_no, no, writer, content, reg_date)
values (42, s_reply_no.nextval, 'effy', '내1', sysdate);

insert into t97_review_reply (t_no, no, writer, content, reg_date)
values (42, s_reply_no.nextval, 'effy1', '내2', sysdate);

insert into t97_review_reply (t_no, no, writer, content, reg_date)
values (43, s_reply_no.nextval, 'effy2', '내3', sysdate);

insert into t97_review_reply (t_no, no, writer, content, reg_date)
values (44, s_reply_no.nextval, '작4', '내4', sysdate);




select * from t97_review;


select * from t97_review_reply;


drop table tb_review purge;

drop table tb_review_reply purge;


select * from t_info;


create table t_info(
 
 name varchar2(30)  primary key,
 num number(2) ,
 email varchar2(100) ,
 info varchar2(100) ,
 job  varchar2(200) ,
 send varchar2(100) ,
 agree varchar2(100)
 
 );
 
 
 
 
 