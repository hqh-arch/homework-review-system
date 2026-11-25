package com.ruoyi.hello.test;

import com.ruoyi.hello.test.domain.Animal;
import org.checkerframework.checker.units.qual.A;

import java.util.ArrayList;
import java.util.List;

public class ListTest {
    public static void main(String[] args) {
        System.out.println("hello, list");
        List<String> list = new ArrayList<>();
        list.add("张三");
        list.add("张三");
        list.add("李四");
        System.out.println("list = " + list);
        List<Animal> animals = new ArrayList<>();
        for(int i = 0; i < 3; i++) {
            Animal a = new Animal();
            a.setName("小黑" + i);
            a.setAge(i);
            animals.add(a);
        }
        System.out.println("animals = " + animals);
    }
}
