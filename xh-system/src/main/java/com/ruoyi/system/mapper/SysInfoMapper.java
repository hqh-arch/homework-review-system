package com.ruoyi.system.mapper;

import java.util.List;

import com.ruoyi.system.domain.SysInfo;

/**
 * 系统信息Mapper接口
 *
 * @author bobydog
 * @date 2026-06-12
 */
public interface SysInfoMapper {
    /**
     * 查询系统信息
     *
     * @param id 系统信息主键
     * @return 系统信息
     */
    public SysInfo getOne(String id);

    /**
     * 查询系统信息列表
     *
     * @param vo 系统信息
     * @return 系统信息集合
     */
    public List<SysInfo> list(SysInfo vo);

    /**
     * 新增系统信息
     *
     * @param vo 系统信息
     * @return 结果
     */
    public int add(SysInfo vo);

    /**
     * 修改系统信息
     *
     * @param vo 系统信息
     * @return 结果
     */
    public int update(SysInfo vo);

    /**
     * 删除系统信息
     *
     * @param id 系统信息主键
     * @return 结果
     */
    public int delete(String id);

    /**
     * 批量删除系统信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int remove(String[] ids);
}
