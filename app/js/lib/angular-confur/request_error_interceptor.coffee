'use strict'

module.exports = ($q, $location) ->
  responseError: (rejection) ->
    if rejection.status == 404
      $location.path('/404')
    if rejection.status == 503
      $location.path('/500')
    return $q.reject(rejection)
