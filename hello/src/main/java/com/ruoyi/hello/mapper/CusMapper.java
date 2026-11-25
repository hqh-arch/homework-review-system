package com.ruoyi.hello.mapper;

import com.ruoyi.hello.domain.Cus;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CusMapper {
    @Select("select * from hello_cus where id in(select cusid from hello_stu_cus where stuid = #{stuid})")
    List<Cus> listByStuid(String stuid);
    Cus getOne(String id);

    List<Cus> list(Cus query);

    int add(Cus cus);

    int update(Cus cus);

    int delete(String id);

    int remove(String[] ids);
}
