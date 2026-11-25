package com.ruoyi.api.hello;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.api.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.hello.domain.Area;
import com.ruoyi.hello.service.IAreaService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 地区信息Controller
 *
 * @author bobydog
 * @date 2026-03-12
 */
@RestController
@RequestMapping("/hello/area")
public class AreaController extends BaseController {
    @Resource
    private IAreaService service;

    @PreAuthorize("@ss.hasPermi('hello:area:list')")
    @GetMapping("/list")
    public AjaxResult list(Area query) {
        System.out.println(new Throwable().getStackTrace()[0]);
        //设置模糊查询
        query.setCond(StringUtils.cond(query.getCond()));
        List<Area> all = service.list(query);
        //System.out.println("all = " + all);
        return success(all);
    }

    @PreAuthorize("@ss.hasPermi('hello:area:export')")
    @Log(title = "地区信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Area query) {
        System.out.println(new Throwable().getStackTrace()[0]);
        List<Area> list = service.list(query);
        ExcelUtil<Area> util = new ExcelUtil<Area>(Area.class);
        util.exportExcel(response, list, "地区信息数据");
    }

    @PreAuthorize("@ss.hasPermi('hello:area:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getOne(@PathVariable("id") String id) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return success(service.add(id));
    }

    @PreAuthorize("@ss.hasPermi('hello:area:add')")
    @Log(title = "地区信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Area vo) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(service.add(vo));
    }

    @PreAuthorize("@ss.hasPermi('hello:area:edit')")
    @Log(title = "地区信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult update(@RequestBody Area vo) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(service.update(vo));
    }

    @PreAuthorize("@ss.hasPermi('hello:area:remove')")
    @Log(title = "地区信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(service.remove(ids));
    }
}
