package com.ruoyi.hello.test.domain;

import lombok.Data;

@Data
public class PersonDomain {
    private String name;
    private Integer age;
    private String sex;
    private Dog dog;
    private Donkey donkey;
}
