package com.ruoyi.hello.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

@Data
public class Cus extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private String id;

    @Excel(name = "名称")
    private String name;

    @Excel(name = "编码")
    private String code;
}
