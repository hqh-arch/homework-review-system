package com.ruoyi.api.hello;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.api.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.hello.domain.Stu;
import com.ruoyi.hello.service.IStuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 学生信息Controller
 *
 * @author bobydog
 * @date 2026-03-12
 */
@RestController
@RequestMapping("/hello/stu")
public class StuController extends BaseController {
    @Autowired
    private IStuService service;

    /**
     * 获取学生信息详细信息
     */
    //@PreAuthorize("@ss.hasPermi('hello:stu:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getOne(@PathVariable("id") String id) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return success(service.getOne(id));
    }

    /**
     * 查询学生信息列表
     */
    @PreAuthorize("@ss.hasPermi('hello:stu:list')")
    @GetMapping("/list")
    public TableDataInfo list(Stu query) {
        System.out.println(new Throwable().getStackTrace()[0] + ", before: query.cond = " + query.getCond());
        query.setCond(StringUtils.cond(query.getCond()));
        System.out.println("after cond: query.cond = " + query.getCond());
        startPage();
        List<Stu> all = service.list(query);
        return getDataTable(all);
    }

    /**
     * 导出学生信息列表
     */
    @PreAuthorize("@ss.hasPermi('hello:stu:export')")
    @Log(title = "学生信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Stu stu) {
        System.out.println(new Throwable().getStackTrace()[0]);
        List<Stu> list = service.list(stu);
        ExcelUtil<Stu> util = new ExcelUtil<Stu>(Stu.class);
        util.exportExcel(response, list, "学生信息数据");
    }


    /**
     * 新增学生信息
     */
    @PreAuthorize("@ss.hasPermi('hello:stu:add')")
    @Log(title = "学生信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Stu vo) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(service.add(vo));
    }

    /**
     * 修改学生信息
     */
    @PreAuthorize("@ss.hasPermi('hello:stu:edit')")
    @Log(title = "学生信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult update(@RequestBody Stu vo) {
        System.out.println(new Throwable().getStackTrace()[0] + ", cusIds = " + vo.getCusIds() + ", areaIds = " + vo.getAreaIds());
        return toAjax(service.update(vo));
    }

    /**
     * 删除学生信息
     */
    @PreAuthorize("@ss.hasPermi('hello:stu:remove')")
    @Log(title = "学生信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return toAjax(service.remove(ids));
    }
}
