package com.ruoyi.hello.service;

import com.ruoyi.hello.domain.Banji;

import java.util.List;

/**
 * 班级信息Service接口
 *
 * @author bobydog
 * @date 2026-03-12
 */
public interface IBanjiService {
    Banji getOne(String id);

    List<Banji> list(Banji query);

    int add(Banji vo);

    int update(Banji vo);

    int remove(String[] ids);

    int delete(String id);
}
