'use strict'

module.exports = ($scope, $route, $routeParams, $location, $sce) ->
  $scope.$route = $route
  $scope.$location = $location
  $scope.$routeParams = $routeParams

  $scope.trustSrc = (src) ->
    $sce.trustAsResourceUrl(src)
