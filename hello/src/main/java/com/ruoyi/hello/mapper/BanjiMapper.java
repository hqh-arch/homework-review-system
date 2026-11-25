package com.ruoyi.hello.mapper;

import com.ruoyi.hello.domain.Banji;

import java.util.List;

public interface BanjiMapper {
    Banji getOne(String id);

    List<Banji> list(Banji query);

    int add(Banji vo);

    int update(Banji banji);

    int delete(String id);

    int remove(String[] ids);
}
