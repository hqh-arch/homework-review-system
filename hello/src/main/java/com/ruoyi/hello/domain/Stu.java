package com.ruoyi.hello.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.*;

@Data
public class Stu extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private String id;

    private List<String> cusIds = new ArrayList<>();//DTO属性：选了课ids
    private List<String> areaIds = new ArrayList<>();//DTO属性：打卡地ids

    private List<Cus> cuses = new ArrayList<>();//选了的课，需要mapper
    private List<Area> areas = new ArrayList<>();//去过的地方

    private String img; //头像
    private String attaches; //附件

    @Excel(name = "学号")
    private String code;

    @Excel(name = "姓名")
    private String name;

    @Excel(name = "年龄")
    private Integer age;

    @Excel(name = "性别")
    private String sex;

    private String areaid;

    private String banjiid;

    @Excel(name = "籍贯")
    private String areaname;

    @Excel(name = "班级")
    private String banjiname;
}
