package com.ruoyi.hello.service.impl;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.hello.domain.Person;
import com.ruoyi.hello.mapper.PersonMapper;
import com.ruoyi.hello.service.IPersonService;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class PersonServiceImpl implements IPersonService {
    @Resource
    private PersonMapper mapper;
    @Resource
    private JdbcTemplate jdbcTemplate;

    @Override
    public Person getOne(String id) {
        System.out.println(new Throwable().getStackTrace()[0]);
        Person vo = mapper.getOne(id);
        //比如隐藏手机号
        return vo;
    }

    @Override
    public void genTestData(int count) {
        System.out.println(new Throwable().getStackTrace()[0] + "正在产生测试数据, count = " + count);
        String sql = "INSERT INTO hello_person (id, name, age) VALUES (?, ?, ?)";
        List<Object[]> batchArgs = new ArrayList<>();
        List<String> names = StringUtils.genRandNames(100);
        for (int i = 0; i < count; i++) {
            String id = IdUtils.guid();
            String name = names.get(i);
            int age = (int) (Math.random() * 80) + 1;
            batchArgs.add(new Object[]{id, name, age});
        }
        jdbcTemplate.batchUpdate(sql, batchArgs);
    }

    @Override
    public List<Person> list(Person query) {
        System.out.println(new Throwable().getStackTrace()[0]);
        int i = jdbcTemplate.queryForObject("select count(1) from hello_person", Integer.class);
        System.out.println("当前数据量 = " + i);
        if(i < 100) {
            System.out.println("正在产生测试数据");
            genTestData(100);
        }
        return mapper.list(query);
    }

    @Override
    public int add(Person vo) {
        System.out.println(new Throwable().getStackTrace()[0]);
        vo.setId(IdUtils.guid());
        return mapper.add(vo);
    }

    @Override
    public int update(Person vo) {
        System.out.println(new Throwable().getStackTrace()[0] + ", vo = " + vo);
        return mapper.update(vo);
    }

    @Override
    public int remove(String[] ids) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return mapper.remove(ids);
    }

    @Override
    public int delete(String id) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return mapper.delete(id);
    }
}
