package com.ruoyi.common.core.domain;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * Tree基类
 *
 * @author ruoyi
 */
@Data
public class TreeEntity extends BaseEntity {
    private static final long serialVersionUID = 1L;
    private String cond;
    private String parentName;
    private Long parentId;
    private Integer orderNum;
    private String ancestors;
    private List<?> children = new ArrayList<>();
}
