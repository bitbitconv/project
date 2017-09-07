create table t97_world (  
		no number(5) primary key,
		title VARCHAR2(4000) not null,
		content VARCHAR2(4000) not null,
		photo VARCHAR2(4000) not null,
		ID  VARCHAR2(4000) not null,
		foreign key(ID)
		references t97_member(id)
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
		       

		
		