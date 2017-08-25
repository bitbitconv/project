create table t97_free (
	id varchar2(15),
	no number(5) not null primary key,
	state varchar2(15) not null,
	title varchar2(150) not null,
	content varchar2(4000) not null,
	writer varchar2(15) not null,
	hits number(5),
	reg_date date default sysdate,
	manager varchar2(15)
);

create table t97_free_reply	(
	id varchar2(15),
	no number(5) not null primary key,
	content varchar2(300) not null,
	writer varchar2(20) not null,
	reg_date date default sysdate
);

insert into t97_free (no, state, title, content, writer, hits)
values (s_review_no.nextval, 1, '제목1', 'aa' ,'effy', 5);

insert into t97_free (no, state, title, content, writer, hits)
values (s_review_no.nextval, 0, '제목2', 'bb','effy1', 3);

insert into t97_free (no, state, title, content, writer, hits)
values (s_review_no.nextval, 1, '제목3', 'bb','effy1', 3);


insert into t97_review_reply (no, writer, content, reg_date)
values (1, 'effy', '내1', sysdate);

insert into t97_review_reply (t_no, no, writer, content, reg_date)
values (2, s_reply_no.nextval, 'effy1', '내2', sysdate);



create sequence s_free_no;
create sequence s_free_reply_no;

drop table t97_free purge;
drop table t97_free_reply purge;

select * from t97_free;
select * from t97_free_reply;


select b.*
  from (select rownum rnum, no, state, title, writer, reg_date, hits
          from (select *
                  from t97_free
                 order by reg_date desc) a ) b
where rnum between 1 and 2;









