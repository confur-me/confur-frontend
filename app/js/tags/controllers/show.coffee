'use strict'

module.exports = ($scope, $routeParams, Tag, Video) ->

  $scope.tag = Tag.find($routeParams.tagSlug)

  #$scope.tag.$promise.then ->
    #$scope.videos = Video.byTag(tag_slug: $scope.tag.slug)
