package com.ruoyi.api.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.api.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysDemo;
import com.ruoyi.system.service.ISysDemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统例子Controller
 *
 * @author bobydog
 * @date 2026-06-12
 */
@RestController
@RequestMapping("/system/demo")
public class SysDemoController extends BaseController {
    @Resource
    private ISysDemoService service;

    @PreAuthorize("@ss.hasPermi('system:demo:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysDemo query) {
        System.out.println(new Throwable().getStackTrace()[0] + "，query.cond = " + query.getCond());
        String cond = StringUtils.cond(query.getCond());
        //把前端送过来的条件变成完全模糊的条件
        query.setCond(cond);

        startPage();
        List<SysDemo> list = service.list(query);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('system:demo:export')")
    @Log(title = "系统例子", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysDemo query) {
        System.out.println(new Throwable().getStackTrace()[0]);
        List<SysDemo> list = service.list(query);
        ExcelUtil<SysDemo> util = new ExcelUtil<SysDemo>(SysDemo.class);
        util.exportExcel(response, list, "系统例子数据");
    }

//    @PreAuthorize("@ss.hasPermi('system:demo:query')")
    //前端：/system/demo/' + id
    //这种叫路径参数
    //http://localhost:8080/hello-api/system/demo/1
    @GetMapping(value = "/{id}")
    public AjaxResult getOne(@PathVariable("id") String id) {
        System.out.println(new Throwable().getStackTrace()[0]);
        AjaxResult res = success(service.getOne(id));
        System.out.println(res);
        return res;
    }

    @PreAuthorize("@ss.hasPermi('system:demo:add')")
    @Log(title = "系统例子", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysDemo vo) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(service.add(vo));
    }

    @PreAuthorize("@ss.hasPermi('system:demo:edit')")
    @Log(title = "系统例子", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult update(@RequestBody SysDemo vo) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(service.update(vo));
    }

    @PreAuthorize("@ss.hasPermi('system:demo:remove')")
    @Log(title = "系统例子", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(service.remove(ids));
    }
}
