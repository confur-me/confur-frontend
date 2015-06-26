'use strict'

_ = require('lodash')

module.exports = ($scope, $routeParams, Event) ->
  $scope.events =
    if $routeParams.conferenceSlug
      Event.byConference
        conference_slug: $routeParams.conferenceSlug
    else
      Event.query()
