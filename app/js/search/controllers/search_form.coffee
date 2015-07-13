'use strict'

Ps = require('perfect-scrollbar')

module.exports = ($scope, Search) ->
  searchContainer = angular.element('#search-suggest')[0]

  init = ->
    $scope.suggest  = []
    Ps.initialize(searchContainer)

  $scope.$watch 'query', (q) ->
    $scope.suggest = []
    if q && q != ""
      Search.search(q).then (results) ->
        $scope.suggest = results.data
        Ps.update(searchContainer)

  $scope.cancel = ->
    $scope.suggest = []

  init()
