<template>
  <div class="app-container">
    <div>
      <el-button v-if="blank" type="primary" @click="closeWindow()">关闭窗口</el-button>
      <el-button v-if="!blank" type="primary" @click="closeTab">关闭当前标签</el-button>
    </div>
    <stu-info :vo="vo"/>
  </div>
</template>

<script>
import StuInfo from "@/components/vo/stu.vue";
import {getStu} from "@/api/if";
import {closeTab, closeWindow} from "@/utils/ruoyi";

export default {
  name: "ViewStu",
  components: {
    StuInfo,
  },
  data() {
    return {
      id: this.$route.query.id, // 取得路由传过来的id
      vo: {}, //学生 信息
      blank: false,
      name: this.$route.query.name, // 取得路由传过来的name
    }
  },
  created() {
    alert(this.name)
    getStu(this.id).then(res => {
      this.vo = res.data
      document.title = `查看学生资料：${this.vo.name}`
    })
    if (location.href.indexOf("/viewStu") > 0) {
      this.blank = true
    }
  },
  methods: {
    closeTab,
    closeWindow,
    close() { //关闭当前标签页
      this.$tab.closePage()
    },
  },
}
</script>

<style scoped>

</style>
