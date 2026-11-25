package com.ruoyi.api.hello;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.api.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.hello.domain.Cus;
import com.ruoyi.hello.service.ICusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 课程信息Controller
 *
 * @author bobydog
 * @date 2026-03-13
 */
@RestController
@RequestMapping("/hello/cus")
public class CusController extends BaseController {
    @Autowired
    private ICusService service;

    /**
     * 查询课程信息列表
     */
    //@PreAuthorize("@ss.hasPermi('hello:cus:list')")
    @GetMapping("/list")//全路径：ctx/hello/cus/list
    public TableDataInfo list(Cus query) {
        System.out.println(new Throwable().getStackTrace()[0]);
        query.setCond(StringUtils.cond(query.getCond()));
        startPage();
        List<Cus> all = service.list(query);
        return getDataTable(all);
    }

    /**
     * 导出课程信息列表
     */
    @PreAuthorize("@ss.hasPermi('hello:cus:export')")
    @Log(title = "课程信息" , businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Cus query) {
        System.out.println(new Throwable().getStackTrace()[0]);
        List<Cus> list = service.list(query);
        ExcelUtil<Cus> util = new ExcelUtil<Cus>(Cus.class);
        util.exportExcel(response, list, "课程信息数据");
    }

    /**
     * 获取课程信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('hello:cus:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getOne(@PathVariable("id") String id) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return success(service.getOne(id));
    }

    /**
     * 新增课程信息
     */
    @PreAuthorize("@ss.hasPermi('hello:cus:add')")
    @Log(title = "课程信息" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Cus vo) {
        System.out.println(new Throwable().getStackTrace()[0] + ", vo = " + vo);
        return toAjax(service.add(vo));
    }

    /**
     * 修改课程信息
     */
    @PreAuthorize("@ss.hasPermi('hello:cus:edit')")
    @Log(title = "课程信息" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult update(@RequestBody Cus vo) {
        System.out.println(new Throwable().getStackTrace()[0] + ", vo = " + vo);
        return toAjax(service.update(vo));
    }

    /**
     * 删除课程信息
     */
    @PreAuthorize("@ss.hasPermi('hello:cus:remove')")
    @Log(title = "课程信息" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(service.remove(ids));
    }
}
