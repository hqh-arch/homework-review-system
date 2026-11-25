<template>
  <div class="big">
    {{ title }}
    <h1 v-html="txt"></h1>
  </div>
</template>

<script>
import {getCodeImg} from "@/api/login"
import Cookies from "js-cookie"
import {encrypt, decrypt} from '@/utils/jsencrypt'
import defaultSettings from '@/settings'

export default {
  name: "Login",
  data() {
    return {
      title: 'hello, world!',
      txt: '文本',
    }
  },
  created() {
    alert(1)
  },
  methods: {
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .big {
    font-size: 20px;
    color: red;
  }
</style>
