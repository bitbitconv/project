create table t97_sale (
	productName varchar2(200) not null,
	imageURL varchar2(4000) not null,
	price varchar2(100) not null,
	event varchar2(30) not null,
	convName varchar2(30) not null
);

select * from t97_sale;



 select rownum, imageurl
from (select imageurl
      from t97_sale)
where rownum between 1 and 6 ;

commit;

 
 
 