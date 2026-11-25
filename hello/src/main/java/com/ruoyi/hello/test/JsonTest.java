package com.ruoyi.hello.test;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.hello.test.domain.Donkey;

public class JsonTest {
    public static void main(String[] args) {
        JSONObject o = new JSONObject();
        o.put("id", "001");
        o.put("name", "老登");
        o.put("age", "56");
        System.out.println("o.age = " + o.getInteger("age"));

        Donkey d = new Donkey();
        d.setName("小黑");
        d.setAge(3);
        d.setType("长毛");
        o.put("donkey", d);
        System.out.println(o);
        //如何从JSONObject中获取Donkey
        Donkey donkey = o.getObject("donkey", Donkey.class);
        System.out.println("o.donkey.name = " + donkey.getName());
        //转换成JSON字符串
        String s = o.toJSONString();
        System.out.println("o.toJSONString() = " + s);
        //转换成JSONObject
        JSONObject o2 = JSONObject.parseObject(s);
        System.out.println("o2 = " + o2);
    }
}
