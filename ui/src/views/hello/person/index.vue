<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="ID" prop="id">
        <el-input v-model="queryParams.id" placeholder="请输入 ID" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="名称" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入名称" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="年龄" prop="age">
        <el-input v-model="queryParams.age" placeholder="请输入年龄" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
      <el-form-item>
        个数：{{ personList.length }}
      </el-form-item>
      <!--      <el-form-item>-->
      <!--        queryParams = {{ queryParams }}-->
      <!--      </el-form-item>-->
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['hello:person:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate" v-hasPermi="['hello:person:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['hello:person:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport" v-hasPermi="['hello:person:export']">导出</el-button>
      </el-col>
      <el-col :span="1.5">
        个数：{{ personList.length }}
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="personList" @selection-change="handleSelectionChange" :max-height="screenHeight - 270">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="ID" align="center" prop="id"/>
      <el-table-column label="名称" align="center" prop="name"/>
      <el-table-column label="名称HTML" align="center">
        <template slot-scope="scope">
          <div v-html="scope.row.name"/>
        </template>
      </el-table-column>
      <el-table-column label="年龄" align="center" prop="age"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList"/>
    <!-- 添加或修改 person 管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body @opened="handleDialogOpened">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" class="el-form-dialog">
        <div class="big_red">您正在编辑：{{ form.name }}，年龄age = {{ form.age }}</div>
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" ref="name" placeholder="请输入名称"/>
        </el-form-item>
        <el-form-item label="年龄" prop="age">
          <el-input-number v-model="form.age" placeholder="请输入年龄"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {addPerson, delPerson, getPerson, listPerson, updatePerson} from "@/api/hello/person"

export default {
  name: "Person",
  data() {
    return {
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
      // person管理表格数据
      personList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 100,
        id: null,
        name: null,
        age: this.$route.query.age || null,
        orderByColumn: "convert(name using gbk)",
        isAsc: "asc"
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        id: [
          {required: true, message: "ID不能为空", trigger: "blur"}
        ],
        name: [
          {required: true, message: "名称不能为空", trigger: "blur"}
        ],
        age: [
          {required: true, message: "年龄不能为空", trigger: "blur"}
        ]
      }
    }
  },
  created() {
    this.screenHeight = window.innerHeight//处理冻结首行用的变量
    this.getList()
  },
  methods: {
    handleDialogOpened() {
      this.$nextTick(() => {
        this.$refs["name"].focus()
      })
    },
    getList() {
      this.loading = true
      listPerson(this.queryParams).then(res => {
        this.personList = res.rows
        this.total = res.total
        this.loading = false
        console.log(res.rows)
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
        name: null,
        age: null
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
      // console.log(selection)
      this.ids = selection.map(item => item.id)
      console.log(this.ids)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加person管理"
    },
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getPerson(id).then(res => {
        this.form = res.data
        this.open = true
        this.title = `修改【${this.form.name}】`
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePerson(this.form).then(res => {
              this.$modal.msgSuccess(res.msg)
              this.open = false
              this.getList()
            })
          } else {
            addPerson(this.form).then(res => {
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
      this.$modal.confirm('删除操作不可恢复，是否继续？').then(function () {
        return delPerson(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('hello/person/export', {
        ...this.queryParams
      }, `person_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
<style scoped>
.big_red {
  font-size: 24px;
  color: red;
  font-weight: bold;
  text-align: center;
}
h1 .big_green {
  font-size: 24px;
  color: green;
  font-weight: bold;
  text-align: center;
}

.el-form-dialog {
  margin-top: -40px;
}
</style>
