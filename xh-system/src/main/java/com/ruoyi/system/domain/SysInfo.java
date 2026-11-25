package com.ruoyi.system.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

@Data
public class SysInfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    @Excel(name = "ID")
    private String id;

    @Excel(name = "名称")
    private String name;

}
