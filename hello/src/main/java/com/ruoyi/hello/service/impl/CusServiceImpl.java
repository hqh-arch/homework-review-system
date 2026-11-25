package com.ruoyi.hello.service.impl;

import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.hello.domain.Cus;
import com.ruoyi.hello.mapper.CusMapper;
import com.ruoyi.hello.service.ICusService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 课程信息Service业务层处理
 *
 * @author bobydog
 * @date 2026-03-13
 */
@Service
public class CusServiceImpl implements ICusService {
    @Resource
    private CusMapper mapper;

    @Override
    public Cus getOne(String id) {
        return mapper.getOne(id);
    }

    @Override
    public List<Cus> list(Cus query) {
        return mapper.list(query);
    }

    @Override
    public int add(Cus vo) {
        vo.setId(IdUtils.guid());
        return mapper.add(vo);
    }

    @Override
    public int update(Cus vo) {
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
