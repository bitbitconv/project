create table t97_recipe (
 
 no number(5)  primary key,
 title varchar2(4000) not null,
 content varchar2(4000) not null, 
 manage varchar2(4000),
 photo varchar2(4000) not null,
 id varchar2(4000) not null ,
 foreign key(id) 
 references t97_member(id)

);



create sequence s_recipe_no ;

select * from t97_recipe ;


drop sequence s_recipe_no ;
drop table t97_recipe purge ;


insert into t97_recipe(no, id, title , content , manage,photo) 
               values (s_recipe_no.nextval,'id','title','content','manage','사진');
       
       
insert into t97_recipe(no, id, title , content , manage,,photo) 
       values (s_recipe_no.nextval,'id','title2','content2','manage2','사진2');
       
insert into t97_recipe(no, id, title , content , manage, photo) 
       values (s_recipe_no.nextval,'id','title3','content3','manage3','사진3');
       
 update t97_recipe 
 set title = 'rkrkrk'
 where no = 7 ;
