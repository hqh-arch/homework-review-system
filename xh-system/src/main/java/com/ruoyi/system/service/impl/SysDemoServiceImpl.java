package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.system.domain.SysDemo;
import com.ruoyi.system.mapper.SysDemoMapper;
import com.ruoyi.system.service.ISysDemoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 系统例子Service业务层处理
 *
 * @author bobydog
 * @date 2026-06-12
 */
@Service
@Transactional
public class SysDemoServiceImpl implements ISysDemoService {
    @Resource
    private SysDemoMapper mapper;

    @Override
    public SysDemo getOne(String id) {
        return mapper.getOne(id);
    }

    @Override
    public List<SysDemo> list(SysDemo vo) {
        return mapper.list(vo);
    }

    @Override
    public int add(SysDemo vo) {
        //调用了工具类中的自动生成GUID的方法
        vo.setId(IdUtils.guid());
        return mapper.add(vo);
    }

    @Override
    public int update(SysDemo vo) {
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
