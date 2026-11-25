package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

@Data
public class SysDemo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    @Excel(name = "ID")
    private String id;

    @Excel(name = "名称")
    private String name;

    @Excel(name = "年龄")
    private Integer age;

    @Excel(name = "备注")
    private String remark;

}
