<template>
  <div style="color: red;">
    name = {{ name }}, vo.name = {{ vo.name }}, age = {{ age }}, vo.age = {{ vo.age }}
  </div>
</template>

<script>

export default {
  name: 'HelloStuInfo',
  props: ['vo', 'name', 'age'], // 父组件传递的参数，是数组，用逗号分割
  data() {
    return {
    }
  },
  mounted() {
  },
  methods: {
  }
}
</script>
