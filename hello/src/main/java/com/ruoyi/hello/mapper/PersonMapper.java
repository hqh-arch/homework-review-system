package com.ruoyi.hello.mapper;

import com.ruoyi.hello.domain.Person;
import lombok.experimental.Delegate;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PersonMapper {
    @Select("select * from hello_person where id = #{id}")
    Person getOne(String id);

    List<Person> list(Person query);

    int add(Person vo);

    int update(Person vo);

    @Delete("delete from hello_person where id = #{id}")
    int delete(String id);

    int remove(String[] ids);
}
