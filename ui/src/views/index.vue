<template>
  <div class="app-container home">
    <h1>Hello, world!</h1>
    <el-button type="success" @click="admin_stu">学生信息管理</el-button>
    <el-button type="primary" @click="admin_person">person管理</el-button>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "3.9.1"
    }
  },
  methods: {
    admin_person() {
      this.$router.push({path: "/hello/person", query: {}})
    },
    admin_stu() {
      this.$router.push({path: "/hello/stu", query: {}})
    },
    goTarget(href) {
      window.open(href, "_blank")
    }
  }
}
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
}
</style>

