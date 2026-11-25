import request from '@/utils/request'

// 查询课程信息列表
export function listCus(query) {
  return request({
    url: '/hello/cus/list',
    method: 'get',
    params: query
  })
}

// 查询课程信息详细
export function getCus(id) {
  return request({
    url: '/hello/cus/' + id,
    method: 'get'
  })
}

// 新增课程信息
export function addCus(data) {
  return request({
    url: '/hello/cus',
    method: 'post',
    data: data
  })
}

// 修改课程信息
export function updateCus(data) {
  return request({
    url: '/hello/cus',
    method: 'put',
    data: data
  })
}

// 删除课程信息
export function delCus(id) {
  return request({
    url: '/hello/cus/' + id,
    method: 'delete'
  })
}
