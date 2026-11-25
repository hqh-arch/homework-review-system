use hello2026;
-- 学生视图，求出籍贯和班级名
create or replace view v_hello_stu as
select t.*,
       t1.fullname as areaname,
       t2.name     as banjiname
from (hello_stu t
    left join hello_area t1 on t.areaid = t1.id)
         left join hello_banji t2 on t.banjiid = t2.id;
-- 学生选课视图：求出学生学号及姓名、课程名、课程代码
create or replace view v_hello_stu_cus
as
select t.*,
       t1.name as stuname,
       t1.code as stucode,
       t2.name as cusname,
       t2.code as cuscode
from (hello_stu_cus t
    left join hello_stu t1 on t.stuid = t1.id)
         left join hello_cus t2 on t.cusid = t2.id;
-- 学生打卡地视图：求出学生名和打卡地名
create or replace view v_hello_stu_area
as
select t.*, t1.name stuname, t2.fullname as areaname
from (hello_stu_area t
    left join hello_stu t1 on t.stuid = t1.id)
         left join hello_area t2 on t.areaid = t2.id
order by stuname, areaname;

-- 函数：求area树表每个节点的全名，在维护单个节点的时候调用这个函数取出来放在area.fullname字段，减少数据库查询负担
delimiter $$
drop function if exists fn_get_area_fullname $$
create function fn_get_area_fullname(f_area_id varchar(100))
    returns varchar(500)
    deterministic
begin
    declare v_full_name varchar(500) default '';
    declare v_current_id varchar(100);
    declare v_current_name varchar(100);
    declare v_pid varchar(100);
    declare done int default 0;
    -- 游标用于遍历父节点
    declare cur_area cursor for
        select id, pid, name from hello_area where id = v_current_id;
    declare continue handler for not found set done = 1;
    set v_current_id = f_area_id;
    set v_full_name = '';
    -- 循环向上查找父节点
    while done = 0
        do
            open cur_area;
            fetch cur_area into v_current_id, v_pid, v_current_name;

            if done = 0 then
                if v_full_name = '' then
                    set v_full_name = v_current_name;
                else
                    set v_full_name = concat(v_current_name, '/', v_full_name);
                end if;

                if v_pid = '0' or v_pid is null or v_pid = v_current_id then
                    set done = 1;
                else
                    set v_current_id = v_pid;
                end if;
            end if;
            close cur_area;
        end while;
    return v_full_name;
end$$
delimiter ;