'use strict'

_ = require('lodash')

module.exports = ($scope, $routeParams, Conference, Video, Event) ->
  if conferenceSlug = $routeParams.conferenceSlug
    $scope.conference = Conference.find(conferenceSlug)

    $scope.conference.$promise.then (conference) ->
      #$scope.videos = Video.byConference(conference_slug: conference.slug)
      $scope.events = Event.byConference(conference_slug: conference.slug)

