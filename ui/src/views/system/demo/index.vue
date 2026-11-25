<template>
  <div class="app-container">
    <div>
      {{ data }}
    </div>
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="关键词" prop="cond">
        <el-input v-model="queryParams.cond" ref="cond" placeholder="请输入学号" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <!--      <el-form-item label="ID" prop="id">-->
      <!--        <el-input v-model="queryParams.id" placeholder="请输入ID" clearable @keyup.enter.native="handleQuery"/>-->
      <!--      </el-form-item>-->
      <el-form-item label="名称" prop="name" v-show="false">
        <el-input v-model="queryParams.name" placeholder="请输入名称" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['system:demo:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate" v-hasPermi="['system:demo:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['system:demo:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport" v-hasPermi="['system:demo:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="demoList" @selection-change="handleSelectionChange" :max-height="screenHeight - 250">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="ID" align="center" prop="id"/>
      <el-table-column label="名称" align="center" prop="name"/>
      <el-table-column label="年龄" align="center" prop="age"/>
      <el-table-column label="备注" align="center" prop="remark"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:demo:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['system:demo:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList"/>

    <!-- 添加或修改系统例子对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" @keyup.ctrl.enter.native="submitForm">
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" ref="name" placeholder="请输入名称"/>
        </el-form-item>
        <el-form-item label="年龄" prop="age">
          <el-input-number v-model="form.age" placeholder="请输入年龄"/>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注"/>
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
import {addDemo, delDemo, getDemo, listDemo, updateDemo} from "@/api/system/demo"

export default {
  name: "Demo",
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
      // 系统例子表格数据
      demoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        orderByColumn: "convert(name using gbk)",
        isAsc: "asc",
        cond: null,
        pageNum: 1,
        pageSize: 10,
        id: null,
        name: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
      data: {}
    }
  },
  created() {
    //冻结窗口
    this.screenHeight = window.innerHeight;
    this.getList()
  },
  methods: {
    /** 查询系统例子列表 */
    getList() {
      this.loading = true
      listDemo(this.queryParams).then(res => {
        this.demoList = res.rows
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
        name: null
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
      this.title = "添加系统例子"
      this.$nextTick().then(() => {
        this.$refs["name"].focus()
      })
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      //alert(row.name)
      this.reset()
      const id = row.id || this.ids
      getDemo(id).then(res => {
        this.data = res
        //alert(JSON.stringify(res)) //把对象变成字符串显示
        console.log(res) //要按F12打开控制台才能看见
        this.form = res.data
        this.open = true
        this.title = "修改系统例子"
        this.$nextTick().then(() => {
          this.$refs["name"].focus()
        })
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateDemo(this.form).then(res => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addDemo(this.form).then(res => {
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
      this.$modal.confirm('是否确认删除系统例子编号为"' + ids + '"的数据项？').then(function () {
        return delDemo(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/demo/export', {
        ...this.queryParams
      }, `demo_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
