<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="ID" prop="id" v-show="false">
        <el-input v-model="queryParams.id" placeholder="请输入ID" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="关键词" prop="cond">
        <el-input v-model="queryParams.cond" ref="cond" placeholder="请输入学号" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="性别" prop="sex">
        <el-select v-model="queryParams.sex" placeholder="请选择性别" clearable>
          <el-option v-for="dict in dict.type.sys_user_sex" :key="dict.value" :label="dict.label" :value="dict.value"/>
        </el-select>
      </el-form-item>
      <el-form-item label="地区ID" prop="areaid" v-show="false">
        <el-input v-model="queryParams.areaid" placeholder="请输入地区ID" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="班级ID" prop="banjiid" v-show="false">
        <el-input v-model="queryParams.banjiid" placeholder="请输入班级ID" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="籍贯" prop="areaname" v-show="false">
        <el-input v-model="queryParams.areaname" placeholder="请输入籍贯" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="班级" prop="banjiname" v-show="false">
        <el-input v-model="queryParams.banjiname" placeholder="请输入班级" clearable @keyup.enter.native="handleQuery"/>
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

    <el-table v-loading="loading" :data="stuList" @selection-change="handleSelectionChange" :max-height="screenHeight - 250">
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-form label-position="left" inline class="demo-table-expand">
            <stu-info :vo="props.row"/>
            <el-form-item label="学生 ID:">
              <span>{{ props.row.id }}</span>
            </el-form-item>
            <el-form-item label="学号:">
              <span>{{ props.row.code }}</span>
            </el-form-item>
            <el-form-item label="姓名:">
              <span>{{ props.row.name }}</span>
            </el-form-item>
            <el-form-item label="年龄:">
              <span>{{ props.row.age }}</span>
            </el-form-item>
            <el-form-item label="性别:">
              <dict-tag :options="dict.type.sys_user_sex" :value="props.row.sex"/>
            </el-form-item>
            <br/>
            <el-form-item label="籍贯:">
              <span>{{ props.row.areaname }}</span>
            </el-form-item>
            <el-form-item label="班级 ID:">
              <span>{{ props.row.banjiid }}</span>
            </el-form-item>
            <el-form-item label="班级名称:">
              <span>{{ props.row.banjiname }}</span>
            </el-form-item>
            <br/>
            <el-form-item label="去过的地方:" style="width: 100%;">
              <el-tag
                v-for="(area, index) in props.row.areas"
                :key="index"
                size="small"
                style="margin-right: 8px; margin-bottom: 8px;"
              >
                {{ area.fullname.replaceAll("/", "") }}
              </el-tag>
              <span v-if="!props.row.areas || props.row.areas.length === 0">暂无打卡记录</span>
            </el-form-item>
            <br/>
            <el-form-item label="所选课程:" style="width: 100%;">
              <el-tag
                v-for="(cus, index) in props.row.cuses"
                :key="index"
                size="small"
                type="success"
                style="margin-right: 8px; margin-bottom: 8px;"
              >
                {{ cus.name }}
              </el-tag>
              <span v-if="!props.row.cuses || props.row.cuses.length === 0">暂未选课</span>
            </el-form-item>
          </el-form>
        </template>
      </el-table-column>
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="学号" align="center" prop="code"/>
      <el-table-column label="姓名" align="center" prop="name"/>
      <el-table-column label="年龄" align="center" prop="age"/>
      <el-table-column label="性别" align="center" prop="sex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.sex"/>
        </template>
      </el-table-column>
      <el-table-column label="打卡">
        <template slot-scope="scope">
          <span v-for="(item, index) in scope.row.areas">{{ index + 1 }}. {{ item.fullname.replaceAll("/", "") }}<br/></span>
        </template>
      </el-table-column>
      <el-table-column label="班级ID" align="center" prop="banjiid"/>
      <el-table-column label="籍贯" prop="areaname"/>
      <el-table-column label="班级" align="center" prop="banjiname"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['hello:stu:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['hello:stu:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList"/>

    <!-- 添加或修改学生信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="960px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="头像" prop="img">
              <image-upload v-model="form.img" :limit="1"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="附件" prop="attaches">
              <file-upload v-model="form.attaches" :limit="5"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="班级" prop="banjiid">
              <el-select v-model="form.banjiid" placeholder="请选择班级" filterable clearable>
                <el-option v-for="item in banjiOptions" :key="item.id" :label="item.name" :value="item.id"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="学号" prop="code">
              <el-input v-model="form.code" placeholder="请输入学号"/>
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
              <el-input v-model="form.age" placeholder="请输入年龄"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="6">
            <el-form-item label="性别" prop="sex">
              <el-select v-model="form.sex" placeholder="请选择性别">
                <el-option v-for="dict in dict.type.sys_user_sex" :key="dict.value" :label="dict.label" :value="dict.value"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="籍贯" prop="areaid">
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
              <treeselect v-model="form.areaIds" multiple :options="areaOptions" :flat="true" :normalizer="normalizer" placeholder="可多选" @select="handleAreaSelect"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-form-item label="已选课程" prop="cusIds">
              <el-checkbox-group v-model="form.cusIds">
                <el-checkbox v-for="cus in cusOptions" :key="cus.id" :label="cus.id">{{ cus.name }}</el-checkbox>
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
import {normalizer} from "@/utils/ruoyi";
import Treeselect from "@riophae/vue-treeselect"
import "@riophae/vue-treeselect/dist/vue-treeselect.css"
import {listCus} from "@/api/hello/cus";
import StuInfo from "@/components/vo/stu.vue";
import {getToken} from "@/utils/auth";

export default {
  name: "Stu",
  components: {
    StuInfo,
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
        isAsc: "asc"
      },
      // 表单参数
      form: {
        areaIds: [],
      },
      // 表单校验
      rules: {
        id: [
          {required: true, message: "ID 不能为空", trigger: "blur"}
        ],
      },
      // 上传头像的请求头
      headers: {
        "Authorization": "Bearer " + getToken()
      }
    }
  },
  created() {
    this.screenHeight = window.innerHeight;
    listBanji().then(res => {
      this.banjiOptions = res.rows
    })
    listArea().then(res => {
      this.areaOptions = this.handleTree(res.data, "id", "pid")
    })
    listCus({
      orderByColumn: "convert(name using gbk)",
      isAsc: "asc"
    }).then(res => {
      this.cusOptions = res.rows
    })
    this.getList()
  },
  methods: {
    normalizer,
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
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getStu(id).then(res => {
        this.form = res.data
        this.open = true
        this.title = "修改学生信息"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
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
.demo-table-expand {
  margin-left: 40px;
  border: red 1px solid;
  font-size: 0;
}

.demo-table-expand label {
  width: 90px;
  color: #99a9bf;
}

.demo-table-expand .el-form-item {
  margin-right: 0;
  margin-bottom: 0;
  width: 50%;
}

.demo-table-expand .el-form-item__content {
  font-size: 14px;
  color: #606266;
}

.demo-table-expand span {
  font-weight: 500;
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 148px;
  height: 148px;
  line-height: 148px;
  text-align: center;
}

.avatar {
  width: 148px;
  height: 148px;
  display: block;
}

</style>
