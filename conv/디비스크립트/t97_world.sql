create table t97_world (  
		ID  VARCHAR2(15),
		manage VARCHAR2(4000),
		title VARCHAR2(150),
		content VARCHAR2(4000),
		no number(5),
		photo VARCHAR2(4000),
		hits number(5)
);

create sequence s_world_no;
drop sequence s_world_no;
drop table t97_world purge;
select * from t97_world;

insert into t97_world(id, manage, title, no, content, photo, hits)
		           values ( 'id', 'manager', 'title',s_world_no.nextval, 'content', 'photo', 1);
		

insert into t97_world(id, manage, title, no, content, photo, hits)
		           values ( 'id', 'manager', 'title',s_world_no.nextval, 'content', 'photo', 1);
		

insert into t97_world(id, manage, title, no, content, photo, hits)
		           values ( 'id', 'manager', 'title',s_world_no.nextval, 'content', 'photo', 1);
		

		
		