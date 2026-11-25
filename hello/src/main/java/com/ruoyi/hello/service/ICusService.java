package com.ruoyi.hello.service;

import com.ruoyi.hello.domain.Cus;

import java.util.List;

public interface ICusService {
    Cus getOne(String id);

    List<Cus> list(Cus query);

    int add(Cus vo);

    int update(Cus vo);

    int remove(String[] ids);

    int delete(String id);
}
