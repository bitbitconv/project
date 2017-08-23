--member 테이블 생성
create table t97_member(
no number(10),
id varchar2(15) primary key,
pass varchar2(20) not null,
email varchar2(20),
passhint varchar2(20)
);
-- 멤버 시퀀스
create sequence s_member_no;

select	 s_member_no.nextval
from	 t97_member;

-- 테이블 삭제
drop table t97_member;

-- 회원정보 5개 입력
insert into t97_member(
no, id, pass, email, passhint)
values(
s_member_no.nextval, 'aaaa', '1111', 'a@a.net', 'a1' 
);
insert into t97_member(
no, id, pass, email, passhint)
values(
s_member_no.nextval, 'bbbb', '2222', 'b@b.net','b2' 
);
insert into t97_member(
no, id, pass, email, passhint)
values(
s_member_no.nextval, 'cccc', '3333', 'c@c.net','c3' 
);
insert into t97_member(
no, id, pass, email, passhint)
values(
s_member_no.nextval, 'dddd', '4444', 'd@d.net','d4' 
);
insert into t97_member(
no, id, pass, email, passhint)
values(
s_member_no.nextval, 'eeee', '5555', 'e@e.net','e5' 
);

select * from t97_member;
