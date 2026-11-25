package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.uuid.IdUtils;

import java.util.List;

import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysInfoMapper;
import com.ruoyi.system.domain.SysInfo;
import com.ruoyi.system.service.ISysInfoService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 系统信息Service业务层处理
 *
 * @author bobydog
 * @date 2026-06-12
 */
@Service
@Transactional
public class SysInfoServiceImpl implements ISysInfoService {
    @Resource
    private SysInfoMapper mapper;

    /**
     * 查询系统信息
     *
     * @param id 系统信息主键
     * @return 系统信息
     */
    @Override
    public SysInfo getOne(String id) {
        return mapper.getOne(id);
    }

    /**
     * 查询系统信息列表
     *
     * @param vo 系统信息
     * @return 系统信息
     */
    @Override
    public List<SysInfo> list(SysInfo vo) {
        return mapper.list(vo);
    }

    /**
     * 新增系统信息
     *
     * @param vo 系统信息
     * @return 结果
     */
    @Override
    public int add(SysInfo vo) {
        vo.setId(IdUtils.guid());
        return mapper.add(vo);
    }

    /**
     * 修改系统信息
     *
     * @param vo 系统信息
     * @return 结果
     */
    @Override
    public int update(SysInfo vo) {
        return mapper.update(vo);
    }

    /**
     * 批量删除系统信息
     *
     * @param ids 需要删除的系统信息主键
     * @return 结果
     */
    @Override
    public int remove(String[] ids) {
        return mapper.remove(ids);
    }

    /**
     * 删除系统信息信息
     *
     * @param id 系统信息主键
     * @return 结果
     */
    @Override
    public int delete(String id) {
        return mapper.delete(id);
    }
}
