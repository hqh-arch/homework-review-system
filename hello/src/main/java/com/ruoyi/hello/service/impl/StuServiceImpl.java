package com.ruoyi.hello.service.impl;

import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.hello.domain.Area;
import com.ruoyi.hello.domain.Cus;
import com.ruoyi.hello.domain.Stu;
import com.ruoyi.hello.mapper.AreaMapper;
import com.ruoyi.hello.mapper.CusMapper;
import com.ruoyi.hello.mapper.StuMapper;
import com.ruoyi.hello.service.IStuService;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 学生信息Service业务层处理
 *
 * @author bobydog
 * @date 2026-03-12
 */
@Service
@Transactional
public class StuServiceImpl implements IStuService {
    @Resource
    private StuMapper mapper;
    @Resource
    private AreaMapper areaMapper;
    @Resource
    private CusMapper cusMapper;

    @Override
    public Stu getOne(String id) {
        Stu vo = mapper.getOne(id);
        setArray(vo);
        return vo;
    }

    //完善学生打卡地和选课
    void setArray(Stu vo) {
        //搞定学生打卡地
        vo.setAreas(areaMapper.listByStuid(vo.getId()));
        for (Area area : vo.getAreas()) {
            vo.getAreaIds().add(area.getId());
        }
        //搞定学生选课
        vo.setCuses(cusMapper.listByStuid(vo.getId()));
        for (Cus cus : vo.getCuses()) {
            vo.getCusIds().add(cus.getId());
        }
    }

    @Override
    public List<Stu> list(Stu query) {
        List<Stu> all = mapper.list(query);
        for (Stu vo : all) {//导致大量的查询
            setArray(vo);
        }
        return all;
    }

    @Override
    public int add(Stu vo) {
        vo.setId(IdUtils.guid());
        return mapper.add(vo);
    }

    @Resource
    private JdbcTemplate jdbcTemplate;

    //搞定学生打卡地
    void updateAreaIds(Stu vo) {
        //把这个学生打卡地全部删除
        jdbcTemplate.update("delete from hello_stu_area where stuid = ?", vo.getId());
        for (String areaid : vo.getAreaIds()) {
            jdbcTemplate.update("insert into hello_stu_area(stuid, areaid) values(?, ?)", vo.getId(), areaid);
        }
    }

    //搞定学生选课
    void updateCusIds(Stu vo) {
        //把这个学生选课全部删除
        jdbcTemplate.update("delete from hello_stu_cus where stuid = ?", vo.getId());
        for (String cusid : vo.getCusIds()) {
            jdbcTemplate.update("insert into hello_stu_cus(stuid, cusid) values(?, ?)", vo.getId(), cusid);
        }
    }

    @Override
    public int update(Stu vo) {
        updateAreaIds(vo);
        updateCusIds(vo);
        return mapper.update(vo);
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
