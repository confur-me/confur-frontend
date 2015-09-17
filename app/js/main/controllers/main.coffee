'use strict'

module.exports = ($scope, $route, $routeParams, $location, $sce) ->
  $scope.$route = $route
  $scope.$location = $location
  $scope.$routeParams = $routeParams

  $scope.trustSrc = (src) ->
    $sce.trustAsResourceUrl(src)

  $scope.isPlaying = ->
    parseInt($location.search().play, 10) > 0
