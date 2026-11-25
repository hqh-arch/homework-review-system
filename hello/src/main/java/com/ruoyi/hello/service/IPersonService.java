package com.ruoyi.hello.service;

import com.ruoyi.hello.domain.Person;

import java.util.List;

public interface IPersonService {
    Person getOne(String id);

    //产生一百个测试数据
    void genTestData(int coun);

    List<Person> list(Person query);

    int add(Person vo);

    int update(Person vo);

    int remove(String[] ids);

    int delete(String id);
}
