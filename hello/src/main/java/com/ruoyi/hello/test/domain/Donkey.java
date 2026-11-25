package com.ruoyi.hello.test.domain;

import lombok.Data;

// 驴
@Data
public class Donkey extends Animal {
    public String type;
    //拉磨
    public void lamo(int days) {
        System.out.println("老板，我已经拉了" + days + "天磨子了");
    }
}
