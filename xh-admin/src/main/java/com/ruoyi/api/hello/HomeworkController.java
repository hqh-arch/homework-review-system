package com.ruoyi.api.hello;

import com.ruoyi.common.core.api.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;
import java.util.*;
import java.math.BigDecimal;

@RestController
@RequestMapping("/homework")
public class HomeworkController extends BaseController {
    private long uid() { return SecurityUtils.getUserId(); }
    private boolean member(String cls, String role) {
        return jdbcTemplate.queryForObject("select count(*) from hw_member where user_id=? and class_id=? and role=?", Integer.class, uid(), cls, role) > 0;
    }
    private Map<String,Object> assignment(long id) {
        List<Map<String,Object>> rows = jdbcTemplate.queryForList("select * from hw_assignment where id=? and deleted_at is null", id);
        if (rows.isEmpty()) throw new IllegalArgumentException("作业不存在");
        return rows.get(0);
    }
    private String str(Object v) { return v == null ? "" : v.toString().trim(); }
    private boolean teacher(Map<String,Object> a) { return ((Number)a.get("teacher_id")).longValue()==uid() && member(str(a.get("class_id")), "teacher"); }
    @GetMapping("/classes")
    public AjaxResult classes() { return success(jdbcTemplate.queryForList("select m.class_id, m.role, b.name from hw_member m join hello_banji b on b.id=m.class_id where m.user_id=?",uid())); }
    @GetMapping("/assignments")
    public AjaxResult assignments() { return success(jdbcTemplate.queryForList("select distinct a.*, b.name class_name, s.id submission_id, s.graded_at, s.returned_at from hw_assignment a join hello_banji b on b.id=a.class_id join hw_member m on m.class_id=a.class_id and m.user_id=? and ((m.role='teacher' and a.teacher_id=m.user_id) or m.role='student') left join hw_submission s on s.assignment_id=a.id and s.student_id=? where a.deleted_at is null order by a.created_at desc",uid(),uid())); }
    @PostMapping("/assignments")
    public AjaxResult create(@RequestBody Map<String,Object> body) {
        String cls=str(body.get("classId")), title=str(body.get("title")), desc=str(body.get("description")), deadline=str(body.get("deadline"));
        if (!member(cls,"teacher")) return error("您不是该班级的教师");
        if (title.isEmpty() || title.length()>200 || desc.length()>10000) return error("请填写不超过200字的标题，说明不超过10000字");
        jdbcTemplate.update("insert into hw_assignment(class_id,teacher_id,title,description,deadline) values(?,?,?,?,?)",cls,uid(),title,desc,deadline.isEmpty()?null:deadline);
        return success();
    }
    @DeleteMapping("/assignments/{id}")
    public AjaxResult deleteAssignment(@PathVariable long id) {
        Map<String,Object> a=assignment(id); if(!teacher(a)) return error("无权删除该作业");
        int n=jdbcTemplate.update("update hw_assignment set deleted_at=now() where id=? and teacher_id=? and deleted_at is null",id,uid());
        return n==1?success():error("作业已删除");
    }
    @PutMapping("/submissions/{id}/return")
    public AjaxResult returnSubmission(@PathVariable long id,@RequestBody Map<String,Object> body) {
        List<Map<String,Object>> rows=jdbcTemplate.queryForList("select * from hw_submission where id=?",id);
        if(rows.isEmpty()) return error("提交不存在");
        Map<String,Object> s=rows.get(0), a=assignment(((Number)s.get("assignment_id")).longValue());
        if(!teacher(a)) return error("无权打回该作业");
        String reason=str(body.get("reason"));
        if(reason.isEmpty() || reason.length()>2000) return error("请填写打回原因，最多2000字");
        if(!Objects.equals(str(body.get("version")),str(s.get("version")))) return error("作业已变化，请重新打开");
        int n=jdbcTemplate.update("update hw_submission set returned_at=now(),return_reason=?,score=null,comment=null,annotations=null,graded_at=null,version=version+1 where id=? and version=? and returned_at is null",reason,id,s.get("version"));
        return n==1?success():error("作业已变化或已打回，请重新打开");
    }
    @GetMapping("/assignments/{id}/submissions")
    public AjaxResult submissions(@PathVariable long id) {
        Map<String,Object> a=assignment(id); if(!teacher(a)) return error("无权查看提交列表");
        return success(jdbcTemplate.queryForList("select s.id,s.student_id,s.submitted_at,s.score,s.graded_at,s.returned_at,u.nick_name from hw_submission s join sys_user u on u.user_id=s.student_id where s.assignment_id=? order by s.submitted_at",id));
    }
    @GetMapping("/assignments/{id}/mine")
    public AjaxResult mine(@PathVariable long id) {
        Map<String,Object> a=assignment(id); if(!member(str(a.get("class_id")),"student")) return error("无权查看该作业");
        List<Map<String,Object>> rows=jdbcTemplate.queryForList("select * from hw_submission where assignment_id=? and student_id=?",id,uid());
        return success(rows.isEmpty()?null:rows.get(0));
    }
    @PostMapping("/assignments/{id}/submit")
    @Transactional
    public AjaxResult submit(@PathVariable long id,@RequestBody Map<String,Object> body) {
        Map<String,Object> a=assignment(id); if(!member(str(a.get("class_id")),"student")) return error("无权提交该作业");
        Object deadline=a.get("deadline");
        Integer returned=jdbcTemplate.queryForObject("select count(*) from hw_submission where assignment_id=? and student_id=? and returned_at is not null",Integer.class,id,uid());
        if(deadline instanceof Date && ((Date)deadline).before(new Date()) && returned==0) return error("提交已截止");
        String content=str(body.get("content")); if(content.isEmpty() || content.length()>100000) return error("请填写作业内容，最多100000字");
        jdbcTemplate.update("insert into hw_submission(assignment_id,student_id,content) values(?,?,?) on duplicate key update content=values(content),version=version+1,submitted_at=now(),score=null,comment=null,annotations=null,graded_at=null,returned_at=null,return_reason=null",id,uid(),content);
        return success();
    }
    @GetMapping("/submissions/{id}")
    public AjaxResult submission(@PathVariable long id) {
        List<Map<String,Object>> rows=jdbcTemplate.queryForList("select * from hw_submission where id=?",id); if(rows.isEmpty()) return error("提交不存在");
        Map<String,Object> s=rows.get(0), a=assignment(((Number)s.get("assignment_id")).longValue());
        if(!teacher(a)) return error("无权查看该提交"); return success(s);
    }
    @PutMapping("/submissions/{id}/grade")
    public AjaxResult grade(@PathVariable long id,@RequestBody Map<String,Object> body) {
        List<Map<String,Object>> rows=jdbcTemplate.queryForList("select * from hw_submission where id=?",id); if(rows.isEmpty()) return error("提交不存在");
        Map<String,Object> s=rows.get(0), a=assignment(((Number)s.get("assignment_id")).longValue()); if(!teacher(a)) return error("无权批改该提交");
        BigDecimal score; try { score=new BigDecimal(str(body.get("score"))); } catch(Exception e) { return error("请输入0到100的分数"); }
        if(score.compareTo(BigDecimal.ZERO)<0 || score.compareTo(new BigDecimal("100"))>0 || score.scale()>2) return error("分数应为0到100，最多两位小数");
        if (!Objects.equals(str(body.get("version")), str(s.get("version")))) return error("学生已重新提交，请重新打开后批改");
        String comment=str(body.get("comment")), annotations=str(body.get("annotations")); if(comment.length()>10000 || annotations.length()>100000) return error("评语或批注过长");
        int n=jdbcTemplate.update("update hw_submission set score=?,comment=?,annotations=?,graded_at=now(),returned_at=null,return_reason=null,version=version+1 where id=? and version=? and returned_at is null",score,comment,annotations,id,s.get("version"));
        return n==1?success():error("作业已变化，请重新打开后批改");
    }
}
