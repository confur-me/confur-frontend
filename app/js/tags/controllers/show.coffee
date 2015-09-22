'use strict'

module.exports = ($scope, $routeParams, $rootScope, Tag, Video) ->

  $scope.tag = Tag.find($routeParams.tagSlug)

  $scope.tag.$promise.then (tag) ->
    $rootScope.title = 'Videos by tag ' + tag.slug

  #$scope.tag.$promise.then ->
    #$scope.videos = Video.byTag(tag_slug: $scope.tag.slug)
