package com.ruoyi.api.hello;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.api.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.hello.domain.Banji;
import com.ruoyi.hello.service.IBanjiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 班级信息Controller
 *
 * @author bobydog
 * @date 2026-03-12
 */
@RestController
@RequestMapping("/hello/banji")
public class BanjiController extends BaseController {
    @Autowired
    private IBanjiService banjiService;

    /**
     * 查询班级信息列表
     */
    @PreAuthorize("@ss.hasPermi('hello:banji:list')")
    @GetMapping("/list")
    public TableDataInfo list(Banji query) {
        System.out.println(new Throwable().getStackTrace()[0]);
        startPage();
        query.setCond(StringUtils.cond(query.getCond()));
        List<Banji> all = banjiService.list(query);
        return getDataTable(all);
    }

    /**
     * 导出班级信息列表
     */
    @PreAuthorize("@ss.hasPermi('hello:banji:export')")
    @Log(title = "班级信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Banji banji) {
        System.out.println(new Throwable().getStackTrace()[0]);
        List<Banji> list = banjiService.list(banji);
        ExcelUtil<Banji> util = new ExcelUtil<Banji>(Banji.class);
        util.exportExcel(response, list, "班级信息数据");
    }

    /**
     * 获取班级信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('hello:banji:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getOne(@PathVariable("id") String id) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return success(banjiService.getOne(id));
    }

    /**
     * 新增班级信息
     */
    @PreAuthorize("@ss.hasPermi('hello:banji:add')")
    @Log(title = "班级信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Banji banji) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(banjiService.add(banji));
    }

    /**
     * 修改班级信息
     */
    @PreAuthorize("@ss.hasPermi('hello:banji:edit')")
    @Log(title = "班级信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult update(@RequestBody Banji banji) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(banjiService.update(banji));
    }

    /**
     * 删除班级信息
     */
    @PreAuthorize("@ss.hasPermi('hello:banji:remove')")
    @Log(title = "班级信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(banjiService.remove(ids));
    }
}
