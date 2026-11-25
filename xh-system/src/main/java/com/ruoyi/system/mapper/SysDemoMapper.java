package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.SysDemo;

import java.util.List;

public interface SysDemoMapper {
    SysDemo getOne(String id);

    List<SysDemo> list(SysDemo vo);

    int add(SysDemo vo);

    int update(SysDemo vo);

    int delete(String id);

    int remove(String[] ids);
}
