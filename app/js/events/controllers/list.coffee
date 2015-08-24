'use strict'

_ = require('lodash')

module.exports = ($scope, $routeParams, Event) ->
  unless $scope.events?.length > 0
    $scope.events =
      if $routeParams.conferenceSlug
        Event.byConference
          conference_slug: $routeParams.conferenceSlug
      else
        Event.query(shuffle: 'true')
