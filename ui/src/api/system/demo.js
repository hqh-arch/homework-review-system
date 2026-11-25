import request from '@/utils/request'

// 查询系统例子列表
export function listDemo(query) {
    return request({
        url: '/system/demo/list',
        method: 'get',
        params: query
    })
}

// 查询系统例子详细
export function getDemo(id) {
    return request({
        url: '/system/demo/' + id,
        method: 'get'
    })
}

// 新增系统例子
export function addDemo(data) {
    return request({
        url: '/system/demo',
        method: 'post',
        data: data
    })
}

// 修改系统例子
export function updateDemo(data) {
    return request({
        url: '/system/demo',
        method: 'put',
        data: data
    })
}

// 删除系统例子
export function delDemo(id) {
    return request({
        url: '/system/demo/' + id,
        method: 'delete'
    })
}
