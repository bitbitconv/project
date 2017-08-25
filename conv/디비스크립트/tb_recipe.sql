create table t97_recipe (

 no number(5)   not null primary key,
 id varchar2(4000) ,
 title varchar2(4000) ,
 content varchar2(4000) ,
 manage varchar2(4000),
 hits number(5) ,
 photo varchar2(4000)

);


create sequence s_recipe_no ;
drop sequence s_recipe_no ;
drop table t97_recipe purge ;
select * from t97_recipe ;


insert into t97_image(no , image) values (  4, 'url');


insert into t97_recipe(no, id, title , content , manage, hits ,photo) 
               values (s_recipe_no.nextval,'id','title','content','manage',1,'사진');
       
       
insert into t97_recipe(no, id, title , content , manage,hits,photo) 
       values (s_recipe_no.nextval,'id','title2','content2','manage2',2,'사진2');
       
insert into t97_recipe(no, id, title , content , manage,hits, photo) 
       values (s_recipe_no.nextval,'id','title3','content3','manage3',3,'사진3');
       
 update t97_recipe 
 set title = 'rkrkrk'
 where no = 7 ;
