package com.ruoyi.hello.mapper;

import com.ruoyi.hello.domain.Stu;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface StuMapper {
    @Select("select * from v_hello_stu where id = #{id}")
    public Stu getOne(String id);

    public List<Stu> list(Stu query);

    public int add(Stu vo);

    public int update(Stu vo);

    @Delete("delete from hello_stu where id = #{id}")
    public int delete(String id);

    public int remove(String[] ids);
}
