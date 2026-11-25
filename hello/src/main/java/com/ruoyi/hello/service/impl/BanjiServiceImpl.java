package com.ruoyi.hello.service.impl;

import com.ruoyi.hello.domain.Banji;
import com.ruoyi.hello.mapper.BanjiMapper;
import com.ruoyi.hello.service.IBanjiService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 班级信息Service业务层处理
 *
 * @author bobydog
 * @date 2026-03-12
 */
@Service
public class BanjiServiceImpl implements IBanjiService {
    @Resource
    private BanjiMapper mapper;

    @Override
    public Banji getOne(String id) {
        return mapper.getOne(id);
    }

    @Override
    public List<Banji> list(Banji query) {
        return mapper.list(query);
    }

    @Override
    public int add(Banji vo) {
        return mapper.add(vo);
    }

    @Override
    public int update(Banji vo) {
        return mapper.update(vo);
    }

    @Override
    public int remove(String[] ids) {
        return mapper.remove(ids);
    }

    @Override
    public int delete(String id) {
        return mapper.delete(id);
    }
}
