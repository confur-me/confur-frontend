'use strict'

_ = require('lodash')

module.exports = ($scope, $routeParams, $rootScope, Event, Video) ->
  $scope.event = Event.find($routeParams.eventId)

  $scope.event.$promise.then (event) ->
    $rootScope.title = event.title + ' videos'

    #$scope.event.$promise.then ->
      #$scope.videos = Video.byEvent(event_id: $scope.event.id)
