package com.ruoyi.api.common;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.hello.domain.Person;
import com.ruoyi.hello.mapper.StuMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/if") // http://localhost:8080/hello-api/if/getOne
public class IfController {

    @GetMapping("/getStu/{id}")
    public AjaxResult getStu(@PathVariable String id) {
        System.out.println(new Throwable().getStackTrace()[0] + ", id = " + id);
        return AjaxResult.success(SpringUtils.getBean(StuMapper.class).getOne(id));
    }

    @GetMapping("/getOne") //http://localhost:8080/hello-api/if/getOne?id=001
    public JSONObject getOne(String id) {
        System.out.println(new Throwable().getStackTrace()[0] + ", 拿到的id为：" + id);
        Person vo = new Person();
        vo.setId(id);
        vo.setName("张三" + id);
        vo.setAge(18);
        JSONObject o = new JSONObject();
        o.put("code", 200);
        o.put("msg", "成功查询到一个用户！");
        o.put("data", vo);
        return o;
    }

    @GetMapping("/listPerson") // http://localhost:8080/hello-api/if/listPerson?name=张三&age=18
    public AjaxResult listPerson(Person params) {
        System.out.println(new Throwable().getStackTrace()[0] + ", params = " + params);
        int tot = 5;
        AjaxResult res = AjaxResult.success("成功列表出 " + tot + " 个用户！");
        res.put("params", params);
        res.put("total", tot);
        List<Person> all = new ArrayList<>();
        for (int i = 0; i < tot; i++) {
            Person e = new Person();
            e.setId(params.getId() + i);
            e.setName(params.getName() + i);
            if (params.getAge() != null) {
                e.setAge(params.getAge() + i);
            }
            all.add(e);
        }
        res.put("rows", all);
        return res;
    }

    @PutMapping("/update")
    public AjaxResult update(@RequestBody Person vo) {
        System.out.println(new Throwable().getStackTrace()[0] + ", vo = " + vo);
        return AjaxResult.success(vo);
    }

    @Resource
    private JdbcTemplate jdbcTemplate;

    @PostMapping("/addPerson")
    public AjaxResult addPerson(@RequestBody Person data) {
        System.out.println(new Throwable().getStackTrace()[0] + ", data = " + data);
        AjaxResult res = AjaxResult.success("成功添加一个用户！");
        //保留原始数据
        res.put("data", data);
        //生成输出数据
        Person out = new Person();
        out.setId(data.getId());
        out.setName(data.getName() + data.getId());
        out.setAge(data.getAge() + 1);
        res.put("out", out);
        //从hello world --> 业务（把数据持久化）是很简单的
        int rows = jdbcTemplate.update("insert into person(id, name) values(?, ?)", data.getId(), data.getName());
        return res;
    }

    @DeleteMapping("/remove")
    public AjaxResult remove(String[] arr) {
        System.out.println(new Throwable().getStackTrace()[0] + ", arr = " + Arrays.toString(arr));
        return AjaxResult.success(arr);
    }

}
