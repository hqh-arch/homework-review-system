package com.ruoyi.hello.test.domain;

import lombok.Data;

@Data
public class Animal {
    private String name;
    private Integer age;

    public void xiao(String voice) {// 方法
        System.out.println("它发出了" + voice + "的声音");
    }
}
