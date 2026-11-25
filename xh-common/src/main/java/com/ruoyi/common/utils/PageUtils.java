package com.ruoyi.common.utils;

import com.github.pagehelper.PageHelper;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.utils.sql.SqlUtil;

/**
 * 分页工具类
 *
 * @author ruoyi
 */
public class PageUtils extends PageHelper {
    /**
     * 设置请求分页数据
     */
    public static void startPage() {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String orderBy = pageDomain.getOrderBy();
        System.out.println(new Throwable().getStackTrace()[0] + ", orderBy = " + orderBy);
        Boolean reasonable = pageDomain.getReasonable();
        
        if (orderBy.contains("convert") || orderBy.contains("(")) {
            String convertPattern = "convert\\s*\\(\\s*([a-zA-Z0-9_]+)\\s+name\\s+using\\s+gbk\\)";
            java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(convertPattern, java.util.regex.Pattern.CASE_INSENSITIVE);
            java.util.regex.Matcher matcher = pattern.matcher(orderBy);
            if (matcher.find()) {
                String fieldName = matcher.group(1);
                if (fieldName.matches(".*\\s.*")) {
                    throw new RuntimeException("convert 函数中的字段名不能包含空格");
                }
            }
            PageHelper.startPage(pageNum, pageSize).setReasonable(reasonable).setUnsafeOrderBy(orderBy);
        } else {
            PageHelper.startPage(pageNum, pageSize, SqlUtil.escapeOrderBySql(orderBy)).setReasonable(reasonable);
        }
    }

    /**
     * 清理分页的线程变量
     */
    public static void clearPage() {
        PageHelper.clearPage();
    }
}
