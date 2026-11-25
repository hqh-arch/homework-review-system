package com.ruoyi.hello.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.TreeEntity;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 地区信息对象 hello_area
 *
 * @author bobydog
 * @date 2026-03-12
 */
@Data
public class Area {
    private static final long serialVersionUID = 1L;

    private String id;

    @JsonIgnore
    private String cond;

    @Excel(name = "上级 ID")
    private String pid;

    @Excel(name = "名称")
    private String name;

    @Excel(name = "全名")
    private String fullname;

    @Excel(name = "编码")
    private String code;

    @Excel(name = "排序")
    private Integer sort;

}
