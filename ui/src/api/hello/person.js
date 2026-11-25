import request from '@/utils/request'

// 查询person管理列表
export function listPerson(query) {
  return request({
    url: '/hello/person/list',
    method: 'get',
    params: query
  })
}

// 查询person管理详细
export function getPerson(id) {
  return request({
    url: '/hello/person/' + id,
    method: 'get'
  })
}

// 新增person管理
export function addPerson(data) {
  return request({
    url: '/hello/person',
    method: 'post',
    data: data
  })
}

// 修改person管理
export function updatePerson(data) {
  return request({
    url: '/hello/person',
    method: 'put',
    data: data
  })
}

// 删除person管理
export function delPerson(ids) {
  return request({
    url: '/hello/person/' + ids,
    method: 'delete'
  })
}
