package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysDemo;

import java.util.List;

public interface ISysDemoService {
    SysDemo getOne(String id);

    List<SysDemo> list(SysDemo vo);

    int add(SysDemo vo);

    int update(SysDemo vo);

    int remove(String[] ids);

    int delete(String id);
}
