package com.ruoyi.api.system;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.api.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysInfo;
import com.ruoyi.system.service.ISysInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 系统信息Controller
 *
 * @author bobydog
 * @date 2026-06-12
 */
@RestController
@RequestMapping("/system/info")
public class SysInfoController extends BaseController {
    @Resource
    private ISysInfoService service;

    /**
     * 查询系统信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysInfo query) {
        System.out.println(new Throwable().getStackTrace()[0]);
        query.setCond(StringUtils.cond(query.getCond()));
        startPage();
        List<SysInfo> list = service.list(query);
        return getDataTable(list);
    }

    /**
     * 导出系统信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:info:export')")
    @Log(title = "系统信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysInfo query) {
        System.out.println(new Throwable().getStackTrace()[0]);
        List<SysInfo> list = service.list(query);
        ExcelUtil<SysInfo> util = new ExcelUtil<SysInfo>(SysInfo.class);
        util.exportExcel(response, list, "系统信息数据");
    }

    /**
     * 获取系统信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getOne(@PathVariable("id") String id) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return success(service.getOne(id));
    }

    /**
     * 新增系统信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:add')")
    @Log(title = "系统信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysInfo vo) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(service.add(vo));
    }

    /**
     * 修改系统信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:edit')")
    @Log(title = "系统信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult update(@RequestBody SysInfo vo) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(service.update(vo));
    }

    /**
     * 删除系统信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:remove')")
    @Log(title = "系统信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(service.remove(ids));
    }
}
