package com.ruoyi.hello.service;

import com.ruoyi.hello.domain.Stu;

import java.util.List;

/**
 * 学生信息 Service 接口
 *
 * @author bobydog
 * @date 2026-03-12
 */
public interface IStuService {
    Stu getOne(String id);

    List<Stu> list(Stu query);

    int add(Stu vo);

    int update(Stu vo);

    int remove(String[] ids);

    int delete(String id);
}
