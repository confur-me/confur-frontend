'use strict'

module.exports = ($scope, $route, $routeParams, $location, $sce) ->
  $scope.$route = $route
  $scope.$location = $location
  $scope.$routeParams = $routeParams

  $scope.trustSrc = (src) ->
    $sce.trustAsResourceUrl(src)

  $scope.goToPage = (page) ->
    console.log 'Paginating to ' + page

  #$scope.perPage = parseInt($location.search().perPage, 10) || 20
  #$scope.page =
    #if $location.search().page
      #parseInt($location.search().page, 10) - 1
    #else
      #0

  #$scope.$watch 'page', (page)       -> $location.search('page', page + 1)
  #$scope.$watch 'perPage', (perPage) -> $location.search('perPage', perPage)

  #$scope.$on '$locationChangeSuccess', ->
    #page = $location.search().page - 1
    #perPage = $location.search().perPage
    #if page >= 0
      #$scope.page = page
    #if perPage >= 0
      #$scope.perPage = perPage
