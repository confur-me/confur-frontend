'use strict'

_ = require('lodash')

module.exports = ($scope, Event) ->
  if eventId = $routeParams.eventId
    $scope.event = Event.find(eventId)
