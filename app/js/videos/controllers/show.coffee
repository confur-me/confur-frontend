'use strict'

module.exports = ($scope, $routeParams, $rootScope, Video) ->
  $scope.video = Video.find($routeParams.id)

  $scope.video.$promise.then (video) ->
    $rootScope.title = video.title
