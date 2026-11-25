<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="关键词" prop="cond">
        <el-input v-model="queryParams.cond" ref="cond" placeholder="" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="名称" prop="fullname" v-show="false">
        <el-input v-model="queryParams.fullname" placeholder="请输入名称" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="编码" prop="code" v-show="false">
        <el-input v-model="queryParams.code" placeholder="请输入编码" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="排序" prop="sort" v-show="false">
        <el-input v-model="queryParams.sort" placeholder="请输入排序" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['hello:area:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="info" plain icon="el-icon-sort" size="mini" @click="toggleExpandAll">展开/折叠</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-if="refreshTable" v-loading="loading" :data="areaList" row-key="id" :default-expand-all="isExpandAll" :tree-props="{children: 'children', hasChildren: 'hasChildren'}" :max-height="screenHeight - 250">
      <el-table-column label="名称" prop="name" class-name="small-padding fixed-width"/>
      <el-table-column label="全名" prop="fullname"/>
      <el-table-column label="编码" prop="code"/>
      <el-table-column label="排序" align="center" prop="sort"/>
      <el-table-column label="PID" align="center" prop="pid"/>
      <el-table-column label="ID" align="center" prop="id" :show-overflow-tooltip="true"/>
      <el-table-column label="操作" align="center" width="200">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['hello:area:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-plus" @click="handleAdd(scope.row)" v-hasPermi="['hello:area:add']">新增</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['hello:area:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加或修改地区信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" @keyup.ctrl.enter.native="submitForm">
        <el-form-item label="上级ID" prop="name">
          <treeselect v-model="form.pid" :flat="true" :options="areaOptions" :normalizer="normalizer" placeholder="请选择上级" @select="handleAreaSelect"/>
        </el-form-item>
        <el-form-item label="上级全名" prop="name">
          {{ form.fullname }}
        </el-form-item>
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" ref="name" placeholder="请输入名称"/>
        </el-form-item>
        <el-form-item label="编码" prop="code">
          <el-input v-model="form.code" placeholder="请输入编码"/>
        </el-form-item>
        <el-form-item label="排序" prop="sort">
          <el-input-number v-model="form.sort" placeholder="请输入排序"/>
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
import {addArea, delArea, getArea, listArea, updateArea} from "@/api/hello/area"
import Treeselect from "@riophae/vue-treeselect"
import "@riophae/vue-treeselect/dist/vue-treeselect.css"
import {normalizer} from "@/utils/ruoyi";

export default {
  name: "Area",
  components: {
    Treeselect
  },
  data() {
    return {
      screenHeight: 0,
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 地区信息表格数据
      areaList: [],
      // 地区信息树选项
      areaOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否展开，默认全部展开
      isExpandAll: false,
      // 重新渲染表格状态
      refreshTable: true,
      // 查询参数
      queryParams: {
        cond: null,
        pid: null,
        name: null,
        fullname: null,
        code: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {}
    }
  },
  created() {
    this.screenHeight = window.innerHeight;
    this.getList()
  },
  methods: {
    normalizer,
    /** 查询地区信息列表 */
    getList() {
      this.loading = true
      listArea(this.queryParams).then(res => {
        this.areaList = this.handleTree(res.data, "id", "pid")
        console.log("areaList", this.areaList)
        this.loading = false
      })
      this.$nextTick().then(() => {
        this.$refs.cond.focus()
      })
    },
    /** 查询地区信息下拉树结构 */
    getTreeselect(id) {
      listArea().then(res => {
        let arr = []
        res.data.forEach((node, index) => {
          if (id !== null && node.id === id) {
            node.isDisabled = true //不可把自己作为父节点
          }
          node.name = node.name + "(" + node.code + ")"
          arr.push(node)
        })
        this.areaOptions = []
        const data = {id: 0, name: '顶级节点', children: []}
        data.children = this.handleTree(arr, "id", "pid")
        this.areaOptions.push(data)
      })
    },
    handleAreaSelect(node) {
      //alert(JSON.stringify(node)) //小白专用
      console.log("node", node) //进阶在浏览器控制台查看
      this.form.fullname = node.fullname
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
        pid: null,
        name: null,
        fullname: null,
        code: null,
        sort: null
      }
      this.resetForm("form")
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    /** 新增按钮操作 */
    handleAdd(row) {
      this.reset()
      this.getTreeselect()
      if (row != null && row.id) {
        this.form.pid = row.id
        this.form.code = row.code
      } else {
        this.form.pid = 0
      }
      this.open = true
      this.title = "添加地区信息，按Ctrl + Enter保存"
      this.$nextTick().then(() => {
        this.$refs.name.focus()
      })
    },
    /** 展开/折叠操作 */
    toggleExpandAll() {
      this.refreshTable = false
      this.isExpandAll = !this.isExpandAll
      this.$nextTick(() => {
        this.refreshTable = true
      })
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      this.getTreeselect(row.id)
      if (row != null) {
        this.form.pid = row.pid
      }
      getArea(row.id).then(res => {
        this.form = res.data
        this.open = true
        this.title = "修改地区信息，按Ctrl + Enter保存"
        this.$nextTick().then(() => {
          this.$refs.name.focus()
        })
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateArea(this.form).then(res => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addArea(this.form).then(res => {
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
      this.$modal.confirm('是否确认删除地区信息编号为"' + row.id + '"的数据项？').then(function () {
        return delArea(row.id)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {
      })
    }
  }
}
</script>
