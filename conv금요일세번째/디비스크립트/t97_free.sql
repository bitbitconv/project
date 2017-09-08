create table t97_free (
	no number(5) not null primary key,
	state varchar2(15) not null,
	title varchar2(150) not null,
	content varchar2(4000) not null,
	writer varchar2(15) not null,
	hits number(5) not null,
  	image varchar2(4000),
	reg_date date default sysdate,
	manager varchar2(15),
	foreign key(writer)
	references t97_member (id)
);

create table t97_free_reply	(
	t_no number(5) not null,
	no number(5) not null primary key,
  	writer varchar2(20) not null,
	content varchar2(300) not null,
	reg_date date default sysdate,
	foreign key(t_no)
 	references t97_free (no),
	foreign key(writer)
 	references t97_member (id) 	
);

create sequence s_free_no;
create sequence s_free_reply_no;

ALTER SEQUENCE s_free_no INCREMENT BY 1;
ALTER SEQUENCE s_free_reply_no INCREMENT BY 1;

drop table t97_free purge;
drop table t97_free_reply purge;

select * from t97_free;
select * from t97_free_reply;

select to_char(reg_date, 'yyyy-mm-dd hh24:mi:ss')
  from T97_FREE;

select b.*
  from (select rownum rnum, no, state, title, writer, reg_date, hits
          from (select *
                  from t97_free
                 order by reg_date desc) a ) b
where rnum between 1 and 2;









