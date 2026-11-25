package com.ruoyi.hello.test;

import java.util.HashSet;
import java.util.Set;

public class SetTest {
    public static void main(String[] args) {
        Set<String> set = new HashSet<>();
        set.add("张三");
        set.add("张三");
        set.add("张三");
        set.add("张三1");
        set.add("张三2");
        set.add("张三3");
        set.add("张三4");

        System.out.println("set = " + set + ", set.size = " + set.size());
    }
}
