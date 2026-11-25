package com.ruoyi.hello.service.impl;

import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.hello.domain.Area;
import com.ruoyi.hello.mapper.AreaMapper;
import com.ruoyi.hello.service.IAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 地区信息Service业务层处理
 *
 * @author bobydog
 * @date 2026-03-12
 */
@Service
public class AreaServiceImpl implements IAreaService {
    @Resource
    private AreaMapper mapper;

    @Override
    public void test(String name) {
        System.out.println("name = " + name);
    }

    @Override
    public Area add(String id) {
        return mapper.getOne(id);
    }

    @Override
    public List<Area> list(Area query) {
        return mapper.list(query);
    }

    @Override
    public int add(Area vo) {
        vo.setId(IdUtils.guid());
        int i = mapper.add(vo);
        updateFullname(vo.getId());
        return i;
    }

    @Resource
    private JdbcTemplate jdbcTemplate;

    void updateFullname(String id) {
        //升级后的做法
        jdbcTemplate.update("update hello_area set fullname = fn_get_area_fullname(?) where id = ?", id, id);
//        //查出来
//        Area vo = mapper.getOne(id);
//        //更新fullname，直接用jdbcTemplate和调用mapper.getFullname效果一样
//        vo.setFullname(jdbcTemplate.queryForObject("select ", String.class, id));
//
//        //vo.setFullname(mapper.getFullname(id));
//        mapper.update(vo);
    }

    @Override
    public int update(Area vo) {
        int i = mapper.update(vo);
        updateFullname(vo.getId());
        return i;
    }

    @Override
    public int remove(String[] ids) {
        return mapper.remove(ids);
    }

    @Override
    public int delete(String id) {
        return mapper.delete(id);
    }
}
