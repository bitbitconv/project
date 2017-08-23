--member 테이블 생성
create table t97_member(
id varchar2(15) primary key,
pass varchar2(20) not null,
email varchar2(20),
passhint varchar2(20)
);

insert into t97_member(
id, pass, email, passhint)
values(
'aaaa', '1111', 'a@a.net', 'a1' 
);
insert into t97_member(
id, pass, email, passhint)
values(
'bbbb', '2222', 'b@b.net','b2' 
);
insert into t97_member(
id, pass, email, passhint)
values(
'cccc', '3333', 'c@c.net','c3' 
);
insert into t97_member(
id, pass, email, passhint)
values(
'dddd', '4444', 'd@d.net','d4' 
);
insert into t97_member(
id, pass, email, passhint)
values(
'eeee', '5555', 'e@e.net','e5' 
);

select * from t97_member;
