<template>
  <div class="demo-table-expand">
    <el-row :gutter="20">
      <el-col :span="4">
        <el-card shadow="hover" class="stu-card">
          <div slot="header" class="clearfix">
              <span>照片，点击可以放大</span>
          </div>
          <div class="img-content">

            <image-preview v-if="vo.img" :src="vo.img" style="height: 100%;" fit="cover"/>
          </div>
        </el-card>
      </el-col>
      <el-col :span="20">
        <el-card shadow="hover" class="form-card" title="">
          <div slot="header" class="clearfix">
            <div>vo.img = {{ vo.img }}</div>
            <span class="card-title">详细信息</span>
          </div>
          <div class="form-content">
            <el-form inline label-width="120px">
              <el-form-item label="班级名称">
                <span>{{ vo.banjiname }}</span>
              </el-form-item>
              <el-form-item label="籍贯">
                <span>{{ vo.areaname }}</span>
              </el-form-item>
              <el-form-item label="所选课程">
                <span v-if="!vo.cuses || vo.cuses.length === 0">暂未选课</span>
                <el-tag v-else v-for="(cus, index) in vo.cuses" :key="index" size="small" type="success" style="margin-right: 8px; margin-bottom: 8px;">
                  {{ cus.name }}
                </el-tag>
              </el-form-item>
              <el-form-item label="去过的地方">
                <span v-if="!vo.areas || vo.areas.length === 0">暂无打卡记录</span>
                <el-tag v-else v-for="(area, index) in vo.areas" :key="index" size="small" style="margin-right: 8px; margin-bottom: 8px;">
                  {{ area.fullname.replaceAll("/", "") }}
                </el-tag>
              </el-form-item>
              <el-form-item label="其它附件" style="width: 100%">
                <span v-if="!vo.attaches || vo.attaches.length === 0">暂无</span>
                <div v-else v-for="(item, index) in vo.attaches.split(',')" :key="index">
                  <el-button @click="downFile(item)">下载{{ index }}</el-button>
                  <a :href="getFileUrl(item)" target="_blank">{{ getFileUrl(item) }}</a>
                </div>
              </el-form-item>
            </el-form>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import {downFile, getFileName, getFileUrl} from "@/utils/ruoyi";

export default {
  name: 'StuInfo',
  props: ['vo'], // 父组件传递的参数，是数组，用逗号分割
  data() {
    return {
      url: 'http://doc.ruoyi.vip/ruoyi-vue'
    }
  },
  mounted() {
    //this.vo.img = process.env.VUE_APP_BASE_API + this.vo.img
  },
  methods: {
    getFileName,
    getFileUrl,
    downFile
  }
}
</script>
<style scoped>
.demo-table-expand {
  font-size: 0;
}

.form-card {
  height: 300px;
  overflow-y: auto;
  border: red 1px solid;
}

.demo-table-expand label {
  width: 90px;
  color: #99a9bf;
}

.demo-table-expand span {
  font-weight: 500;
}

.stu-card {
  height: 100%;
}

.img-content {
  height: 200px;
}
.form-content {
  height: 200px;
  overflow-y: auto;
  overflow-x: hidden;
  border: green 1px solid;
}
.clearfix {
  font-size: 16px;
  font-weight: bold;
  text-align: center;
}
</style>
