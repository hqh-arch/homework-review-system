package com.ruoyi.hello.test.domain;

import lombok.Data;

@Data
public class Dog {
    private String type; // 类型
    private String name; // 名字
    private String maose; // 毛色

    public void barking(String voice) {
        //System.out.println(new Throwable().getStackTrace()[0]);
        System.out.println(voice);
    }

    public void ywb() {
//        System.out.println(new Throwable().getStackTrace()[0]);
        System.out.println("摇尾巴");
    }


}
