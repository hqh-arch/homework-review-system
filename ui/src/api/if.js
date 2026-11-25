import request from '@/utils/request'

export function getStu(id) {
  return request({
    url: '/if/getStu/' + id,
    method: 'get'
  })
}