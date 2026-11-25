<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="关键词" prop="cond">
        <el-input v-model="queryParams.cond" ref="cond" placeholder="学号、姓名、籍贯、备注等" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="性别" prop="sex">
        <el-select v-model="queryParams.sex" placeholder="请选择性别" clearable @change="handleQuery">
          <el-option v-for="dict in dict.type.sys_user_sex" :key="dict.value" :label="dict.label" :value="dict.value"/>
        </el-select>
      </el-form-item>
      <el-form-item label="班级" prop="banjiid">
        <el-select v-model="queryParams.banjiid" placeholder="请选择班级" filterable clearable @change="handleQuery">
          <el-option v-for="(item, index) in banjiOptions" :key="index" :label="item.code + ' - ' + item.name" :value="item.id"/>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['hello:stu:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate" v-hasPermi="['hello:stu:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['hello:stu:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport" v-hasPermi="['hello:stu:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="stuList" @selection-change="handleSelectionChange" :max-height="screenHeight - 260" @sort-change="handleSortChange">
      <el-table-column type="expand" label="展开" align="center">
        <template slot-scope="props">
          <hello-stu-info :vo="props.row" :name="props.row.name" :age="props.row.age"/>
        </template>
      </el-table-column>
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="学号" align="center" prop="code" sortable="custom" :sort-orders="['descending', 'ascending']"/>
      <el-table-column label="姓名" align="center" prop="convert(name using gbk)" sortable="custom" :sort-orders="['descending', 'ascending']">
        <template slot-scope="scope">
          <el-tag>{{ scope.row.name }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="班级" align="center" prop="banjiname"/>
      <el-table-column label="年龄" align="center" prop="age" sortable="custom" :sort-orders="['descending', 'ascending']"/>
      <el-table-column label="姓名、性别及年龄" align="center" prop="sex">
        <template slot-scope="scope">
          {{ scope.row.name }}
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.sex"/>
          {{ scope.row.age }}
        </template>
      </el-table-column>
      <el-table-column label="籍贯" prop="areaname" sortable="custom" :sort-orders="['descending', 'ascending']" class-name="small-padding fixed-width"/>
      <el-table-column label="备注" align="center" prop="remark">
        <template slot-scope="scope">
          <el-input v-model="scope.row.remark" placeholder="" clearable @blur="save(scope.row)" @keyup.enter.native="save(scope.row)"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="600px">
        <template slot-scope="scope">
          <router-link :to="{path: '/hello/stu/view', query: {id: scope.row.id, name: scope.row.name}}">
            <el-button size="mini" type="text" icon="el-icon-view">
              router-link查看，调用/router/index.js中的静态路由/hello/stu/view
            </el-button>
          </router-link>
          <br/>
          <el-button size="mini" type="text" icon="el-icon-view" @click="viewPushStu(scope.row)">
            router.push查看，调用/router/index.js中的静态路由/hello/stu/view
          </el-button>
          <br/>
          <a :href="'/viewStu?id=' + scope.row.id + '&name=' + scope.row.name" target="_blank">
            <el-button size="mini" type="text" icon="el-icon-view">href链接新窗口查看，调用router/index.js/viewStu</el-button>
          </a>
          <br/>
          <el-button size="mini" type="text" icon="el-icon-view" @click="viewStu(scope.row)">
            window.open()新窗口查看，调用router/index.js/viewStu
          </el-button>
          <br/>
          <router-link :to="{path: '/viewStu', query: {id: scope.row.id, name: scope.row.name}}">
            <el-button size="mini" type="danger" plain icon="el-icon-view" style="color: red;">主页会直接跳转，非预期</el-button>
          </router-link>
          <br/>
          <router-link :to="{path: '/hello/view/stu', query: {id: scope.row.id, name: scope.row.name}}">
            <el-button size="mini" type="text" icon="el-icon-view">router-link查看，调用菜单建立的动态路由/hello/view/stu</el-button>
          </router-link>
          <br/>
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['hello:stu:remove']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['hello:stu:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList"/>

    <!-- 添加或修改学生信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1280px" append-to-body @keyup.ctrl.enter.native="submitForm">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="头像" prop="img">
              <image-upload v-model="form.img" :limit="1"/>
              保存在数据库中的是后端定义好的相对路径，以profile开始，见application.yml。<br/>
              form.img = 【{{ form.img }}】<br/>
              getFileUrl(form.img) = <a :href="getFileUrl(form.img)" target="_blank">
              <el-tag type="danger">{{ getFileUrl(form.img) }}</el-tag>
            </a>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="附件" prop="attaches">
              <file-upload v-model="form.attaches" :limit="5" :file-type="['pdf', 'txt', 'zip', 'doc', 'docx']"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="班级" prop="banjiid">
              <el-select v-model="form.banjiid" placeholder="请选择班级" filterable clearable>
                <el-option v-for="item in banjiOptions" :key="item.id" :label="item.code + ' ' + item.name" :value="item.id"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="学号" prop="code">
              <el-input v-model="form.code" ref="code" placeholder="请输入学号"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="姓名" prop="name">
              <el-input v-model="form.name" placeholder="请输入姓名"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="年龄" prop="age">
              <el-input-number controls-position="right" :min="20" :max="9000" v-model="form.age" placeholder="请输入年龄"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="6">
            <el-form-item label="性别" prop="sex">
              <el-select v-model="form.sex" clearable placeholder="请选择性别">
                <el-option v-for="(item, index) in dict.type.sys_user_sex" :key="item.index" :label="item.label" :value="item.value"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="籍贯" prop="areaname">
              {{ form.areaname }}
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="选择籍贯" prop="areaid">
              <treeselect v-model="form.areaid" :options="areaOptions" :normalizer="normalizer" placeholder="请选择" @select="handleAreaSelect"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="打卡地" prop="areaIds">
              <treeselect v-model="form.areaIds" multiple :options="areaOptions" :flat="true" :normalizer="normalizer" placeholder="可多选"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="已选课程" prop="cusIds">
              <el-checkbox-group v-model="form.cusIds">
                <el-checkbox v-for="cus in cusOptions" :value="cus.id" :key="cus.id" :label="cus.id">{{ cus.code }} - {{ cus.name }}id={{ cus.id }}</el-checkbox>
              </el-checkbox-group>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {addStu, delStu, getStu, listStu, updateStu} from "@/api/hello/stu"
import {listBanji} from "@/api/hello/banji";
import {listArea} from "@/api/hello/area";
import {getFileUrl, handleSortChange, normalizer} from "@/utils/ruoyi";
import Treeselect from "@riophae/vue-treeselect"
import "@riophae/vue-treeselect/dist/vue-treeselect.css"
import HelloStuInfo from "@/components/vo/hellostu.vue";
import {listCus} from "@/api/hello/cus";
import StuInfo from "@/components/vo/stu.vue";
import {getToken} from "@/utils/auth";

export default {
  name: "Stu",
  components: {
    StuInfo,
    HelloStuInfo,
    Treeselect
  },
  dicts: ['sys_user_sex'],
  data() {
    return {
      banjiOptions: [],
      areaOptions: [],
      cusOptions: [],
      screenHeight: 0,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 学生信息表格数据
      stuList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        id: null,
        code: null,
        name: null,
        age: null,
        sex: null,
        areaid: null,
        banjiid: null,
        areaname: null,
        banjiname: null,
        orderByColumn: "convert(name using gbk)",
        isAsc: "asc, age desc"
      },
      // 表单参数
      form: {
        areaIds: [],
      },
      // 表单校验
      rules: {
        code: [
          {required: true, message: "学号不能为空", trigger: "blur"}
        ],
        sex: [
          {required: true, message: "性别不能为空", trigger: "blur"}
        ],
        banjiid: [
          {required: true, message: "不能为空", trigger: "blur"}
        ],
        name: [
          {required: true, message: "不能为空", trigger: "blur"}
        ],
        areaid: [
          {required: true, message: "不能为空", trigger: "blur"}
        ],
      },
      // 上传头像的请求头
      headers: {
        "Authorization": "Bearer " + getToken()
      }
    }
  },
  created() {
    this.screenHeight = window.innerHeight;//获取屏幕高度，便于冻结表头
    // 初始化班级下拉列表，以名称排序
    listBanji({
      orderByColumn: "convert(name using gbk)",
      isAsc: "asc"
    }).then(res => this.banjiOptions = res.rows)
    listArea().then(res => this.areaOptions = this.handleTree(res.data, "id", "pid"))
    listCus({
      orderByColumn: "convert(name using gbk)",
      isAsc: "asc"
    }).then(res => {
      this.cusOptions = res.rows
    })
    this.getList()
  },
  methods: {
    // 审核按钮操作
    ShenHe(row) {
      this.$modal.msgSuccess("审核成功：" + row.code + row.name)
    },

    viewPushStu(row) {
      alert(row.id)
      if(row.id == 2) {
        alert('私密资料，不允许查看')
        return
      }
      this.$router.push({path: '/hello/stu/view', query: {id: row.id, name: row.name}})
    },
    viewStu(row) {
      // alert('您要在新窗口中打开' + row.code + row.name)
      window.open('/viewStu?id=' + row.id + '&name=' + row.name)
    },
    getToken,
    getFileUrl,
    handleSortChange,
    normalizer,
    save(row) {
      updateStu(row).then(res => {
        this.$modal.msgSuccess("修改成功")
      })
    },
    /** 处理地区节点选中事件 */
    handleAreaSelect(node) {
      this.form.areaname = node.fullname
    },
    /** 查询学生信息列表 */
    getList() {
      this.loading = true
      listStu(this.queryParams).then(res => {
        this.stuList = res.rows
        this.total = res.total
        this.loading = false
        this.$nextTick().then(() => {
          this.$refs["cond"].focus()
        })
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        code: null,
        name: null,
        age: null,
        sex: null,
        areaid: null,
        banjiid: null,
        areaname: null,
        banjiname: null,
        areaIds: [],
        cusIds: []
      }
      this.resetForm("form")
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加学生信息"
      this.$nextTick().then(() => {
        this.$refs.code.focus()
      })
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getStu(id).then(res => {
        this.form = res.data
        this.open = true
        this.title = "修改学生信息"
        this.$nextTick().then(() => {
          this.$refs.code.focus()
        })
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        //alert(this.form.areaIds)
        alert('选了课程ids' + this.form.cusIds)
        if (valid) {
          if (this.form.id != null) {
            updateStu(this.form).then(res => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addStu(this.form).then(res => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除学生信息编号为"' + ids + '"的数据项？').then(function () {
        return delStu(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('hello/stu/export', {
        ...this.queryParams
      }, `stu_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>

<style scoped>


</style>
