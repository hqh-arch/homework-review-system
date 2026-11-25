import request from '@/utils/request'

// 查询班级信息列表
export function listBanji(query) {
  return request({
    url: '/hello/banji/list',
    method: 'get',
    params: query
  })
}

// 查询班级信息详细
export function getBanji(id) {
  return request({
    url: '/hello/banji/' + id,
    method: 'get'
  })
}

// 新增班级信息
export function addBanji(data) {
  return request({
    url: '/hello/banji',
    method: 'post',
    data: data
  })
}

// 修改班级信息
export function updateBanji(data) {
  return request({
    url: '/hello/banji',
    method: 'put',
    data: data
  })
}

// 删除班级信息
export function delBanji(id) {
  return request({
    url: '/hello/banji/' + id,
    method: 'delete'
  })
}
