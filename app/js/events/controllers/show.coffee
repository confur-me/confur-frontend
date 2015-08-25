'use strict'

_ = require('lodash')

module.exports = ($scope, $routeParams, Event, Video) ->
  if eventId = $routeParams.eventId
    $scope.event = Event.find(eventId)

    #$scope.event.$promise.then ->
      #$scope.videos = Video.byEvent(event_id: $scope.event.id)
