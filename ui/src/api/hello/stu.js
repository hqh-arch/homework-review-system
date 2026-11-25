import request from '@/utils/request'

// 查询学生信息列表
export function listStu(query) {
  return request({
    url: '/hello/stu/list',
    method: 'get',
    params: query
  })
}
// 查询学生信息详细
export function getStu(id) {
  return request({
    url: '/hello/stu/' + id,
    method: 'get'
  })
}

// 新增学生信息
export function addStu(data) {
  return request({
    url: '/hello/stu',
    method: 'post',
    data: data
  })
}

// 修改学生信息
export function updateStu(data) {
  return request({
    url: '/hello/stu',
    method: 'put',
    data: data
  })
}

// 删除学生信息
export function delStu(id) {
  return request({
    url: '/hello/stu/' + id,
    method: 'delete'
  })
}
