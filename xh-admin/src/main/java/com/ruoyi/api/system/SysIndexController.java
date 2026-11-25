package com.ruoyi.api.system;

import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.utils.StringUtils;

@RestController
@RequestMapping("/")
public class SysIndexController {
    @Autowired
    private RuoYiConfig ruoyiConfig;

    @RequestMapping("/hello")
    public AjaxResult hello() {
        System.out.println(new Throwable().getStackTrace()[0]);
        AjaxResult res = AjaxResult.success("/hello, world!");
        res.put("name", ruoyiConfig.getName());
        res.put("age", "560");
        return res;
    }
    
    @GetMapping("/")
    public AjaxResult index() {
        //这个语句的作用是在控制台中会引导用户点高亮的链接找到当前的代码
        System.out.println(new Throwable().getStackTrace()[0]);
        return AjaxResult.success(StringUtils.format("222222222 欢迎使用{}后台管理框架，当前版本：v{}，请通过前端地址访问。", ruoyiConfig.getName(), ruoyiConfig.getVersion()));
    }
}
