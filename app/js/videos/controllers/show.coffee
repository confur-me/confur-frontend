'use strict'

module.exports = ($scope, $routeParams, Video) ->
  console.log $routeParams.id
  $scope.video = Video.find($routeParams.id)
  console.log $scope.video
