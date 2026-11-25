package com.ruoyi.hello.test;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.hello.test.domain.Donkey;

public class JsonArrayTest {
    public static void main(String[] args) {
        JSONArray arr = new JSONArray();
        String name = "学员";
        int age = 100;
        for(int i = 0; i < 10; i++) {
            JSONObject obj = new JSONObject();
            obj.put("name", name + i);
            obj.put("age", age + i);
            arr.add(obj);
        }
        //System.out.println(arr);
        JSONObject o = new JSONObject();
        o.put("id", "001");
        o.put("name", "老登");
        o.put("age", "56");
        Donkey d = new Donkey();
        d.setName("小黑");
        d.setAge(3);
        d.setType("长毛");
        o.put("donkey", d);
        System.out.println(o);

        arr.add(o);

        System.out.println(arr);
        arr.remove(o);
        System.out.println("arr.size = " + arr.size());
        System.out.println(arr);
    }

}
