create database news;
use news;
create table information(
    id varchar(20) not null primary key,
    password varchar(16) not null,
    title varchar(40) not null,
    source varchar(30) not null,
    content varchar(1000) not null,
    time varchar(20) not null
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
insert into information values('tom','123','标题1','来源1','内容1','时间1');