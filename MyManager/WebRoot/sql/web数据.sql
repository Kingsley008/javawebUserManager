create table UserData 
( Uid bigint primary key identity not null, --用户ID为主键，自增
Uname varchar(15) not null,  --用户名
Upw varchar(20) not null,  --用户密码
UEmail varchar(20) not null, --用户邮箱
Uclass varchar(20)  not null); --用户级别
/*用于测试的用户*/
insert UserData values(1,'admin','admin','12345@qq.com',5);
insert UserData values(2,'Kingsely','wbd1234','422323@qq.com',1);
insert UserData values(3,'John','6666666','9998345@qq.com',3);
insert UserData values(4,'God','123123','1234235dss@qq.com',4);
insert UserData values(5,'admin2','admin12','12345@qq.com',5);
insert UserData values(6,'Kingsely2','wbd12345','422323@qq.com',1);
insert UserData values(7,'John2','6666666','9998345@qq.com',3);
insert UserData values(8,'God2','1231231','1234235dss@qq.com',4);
insert UserData values(9,'admin3','admin12','12345@qq.com',5);
insert UserData values(10,'Kingsely3','wbd1234','422323@qq.com',1);
insert UserData values(11,'John3','6666666','9998345@qq.com',3);
insert UserData values(12,'God3','1231231','1234235dss@qq.com',4);
insert UserData values(13,'admin12','admin','12345@qq.com',5);
insert UserData values(14,'Kingsely12','wbd1234','422323@qq.com',1);
insert UserData values(15,'John12','6666666','9998345@qq.com',3);
insert UserData values(16,'God12','123123','1234235dss@qq.com',4);
insert UserData values(17,'admin34','admin12','12345@qq.com',5);
insert UserData values(18,'Kingsely34','wbd12345','422323@qq.com',1);
insert UserData values(19,'John34','6666666','9998345@qq.com',3);
insert UserData values(20,'God34','1231231','1234235dss@qq.com',4);
insert UserData values(21,'admin34','admin12','12345@qq.com',5);
insert UserData values(22,'Kingsely34','wbd1234','422323@qq.com',1);
insert UserData values(23,'John34','6666666','9998345@qq.com',3);
insert UserData values(24,'God34','1231231','1234235dss@qq.com',4);
insert UserData values(25,'admin5','admin','12345@qq.com',5);
insert UserData values(26,'Kingsely5','wbd1234','422323@qq.com',1);
insert UserData values(27,'John5','6666666','9998345@qq.com',3);
insert UserData values(28,'God5','123123','1234235dss@qq.com',4);
insert UserData values(29,'admin6','admin12','12345@qq.com',5);
insert UserData values(30,'Kingsely6','wbd12345','422323@qq.com',1);
insert UserData values(31,'John6','6666666','9998345@qq.com',3);
insert UserData values(32,'God6','1231231','1234235dss@qq.com',4);
insert UserData values(33,'admin7','admin12','12345@qq.com',5);
insert UserData values(34,'Kingsely7','wbd1234','422323@qq.com',1);
insert UserData values(35,'网易','123123','9998345@qq.com',3);
insert UserData values(36,'God7','1231231','1234235dss@qq.com',4);