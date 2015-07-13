'use strict'

module.exports = ($scope, $routeParams, Video) ->

  $scope.video = Video.get(id: $routeParams.id)
