package com.ruoyi.hello.mapper;

import com.ruoyi.hello.domain.Area;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 地区信息 Mapper 接口
 *
 * @author bobydog
 * @date 2026-03-12
 */
public interface AreaMapper {
    //求出学生打卡地
    @Select("select * from hello_area where id in(select areaid from hello_stu_area where stuid = #{stuid}) order by convert(fullname using gbk)")
    List<Area> listByStuid(String stuid);

    @Select("select * from hello_area where id = #{id}")
    Area getOne(String id);
    //调用mapper查fullname
    @Select("select fn_get_area_fullname(#{id})")
    String getFullname(String id);

    List<Area> list(Area query);

    int add(Area vo);

    int update(Area vo);
    @Delete("delete from hello_area where id = #{id}")
    int delete(String id);

    int remove(String[] ids);
}
