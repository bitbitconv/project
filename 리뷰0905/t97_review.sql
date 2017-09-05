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
create sequence s_image_no;


create table t97_review_image (
  t_no number(5) not null,
  no number(5) primary key,
  s_name varchar2(500) not null,
  org_name varchar2(500) not null,
  path varchar2(500) not null,
  filesize varchar2(100) not null,
  foreign key(t_no)
  references t97_review (no)
);



select * from t97_review;

select * from t97_review_reply;

select * from t97_review_image;


drop table t97_review_image purge;
 

select s_review_no.nextval, s_review_no.currval from dual;

select s_review_no.currval from dual;
 
 