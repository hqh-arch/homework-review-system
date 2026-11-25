package com.ruoyi.api.hello;

import com.ruoyi.common.core.api.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.hello.domain.Person;
import com.ruoyi.hello.service.IPersonService;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping("/hello/person")//入口
public class PersonController extends BaseController {
    @Resource
    private IPersonService service;

    @GetMapping("/list")
    public TableDataInfo list(Person query) {
        System.out.println(new Throwable().getStackTrace()[0] + "，query = " + query);
        startPage();
        List<Person> all = service.list(query);
        return getDataTable(all);
    }

    @PostMapping("/export")
    public void export(HttpServletResponse res, Person vo) {
        System.out.println(new Throwable().getStackTrace()[0]);
        List<Person> list = service.list(vo);
        ExcelUtil<Person> util = new ExcelUtil<Person>(Person.class);
        util.exportExcel(res, list, "person 管理数据");
    }

    @GetMapping(value = "/{id}") //http://localhost:8080/hello-api/hello/person/id
    public AjaxResult getOne(@PathVariable("id") String id) {
        System.out.println(new Throwable().getStackTrace()[0]);
        return success(service.getOne(id));
    }

    @PostMapping
    public AjaxResult add(@RequestBody Person vo) {
        System.out.println(new Throwable().getStackTrace()[0] + ", vo = " + vo);
        AjaxResult res = toAjax(service.add(vo));
        res.put("msg", "添加成功：" + vo.getName());
        return res;
    }

    @PutMapping
    public AjaxResult update(@RequestBody Person vo) {
        System.out.println(new Throwable().getStackTrace()[0]);
        AjaxResult res = toAjax(service.update(vo));
        res.put("msg", "更新操作执行成功：" + vo.getName());
        return res;
    }

    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids) {
        System.out.println(new Throwable().getStackTrace()[0] + "，删除个数 = " + ids.length);
        return toAjax(service.remove(ids));
    }
}
