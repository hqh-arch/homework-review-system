package com.ruoyi.hello.service;

import java.util.List;
import com.ruoyi.hello.domain.Area;

/**
 * 地区信息Service接口
 * 
 * @author bobydog
 * @date 2026-03-12
 */
public interface IAreaService {
    void test(String name);

    Area add(String id);

    List<Area> list(Area query);

    int add(Area vo);

    int update(Area vo);

    int remove(String[] ids);

    int delete(String id);
}
