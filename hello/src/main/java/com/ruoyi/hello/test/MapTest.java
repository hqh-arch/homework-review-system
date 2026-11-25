package com.ruoyi.hello.test;

import com.ruoyi.hello.test.domain.Dog;
import com.ruoyi.hello.test.domain.Donkey;
import java.util.HashMap;
import java.util.Map;

public class MapTest {
    public static void main(String[] args) {
        Map<String, Object> map = new HashMap<>();
        map.put("name", "张三");
        map.put("age", 18);
        Donkey donkey = new Donkey();
        donkey.setName("小黑");
        donkey.setAge(3);
        donkey.setType("长毛");
        map.put("donkey", donkey);
        Dog dog = new Dog();
        dog.setName("小黄");
        dog.setMaose("金黄");
        dog.setType("金毛");
        map.put("dog", dog);
//        System.out.println(map);
        //强制类型转换
//        Donkey d = (Donkey) map.get("donkey");
//        System.out.println("map.donkey.name = " + d.getName());
        map.put("name", "老登");
//        System.out.println("map.name = " + map.get("name"));
        for (String key : map.keySet()) {
            System.out.println("Key = " + key + ", value = " + map.get(key));
        }
    }
}
