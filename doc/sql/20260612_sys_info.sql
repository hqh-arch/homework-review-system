drop table if exists sys_info;
create table sys_info(
                         id varchar(100) primary key comment 'ID',
                         name varchar(200) default '名称' comment '名称'
);

insert into sys_info(id, name) values('1', '名称1');
insert into sys_info(id, name) values('2', '名称2');
insert into sys_info(id, name) values('3', '名称3');
insert into sys_info(id, name) values('4', '名称4');
