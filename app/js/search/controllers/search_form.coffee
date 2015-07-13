'use strict'

module.exports = ($scope, Search) ->
  $scope.suggest = []

  $scope.$watch 'query', (q) ->
    $scope.suggest = []
    if q && q != ""
      Search.search(q).then (results) ->
        $scope.suggest = results.data

  $scope.cancel = ->
    $scope.suggest = []
