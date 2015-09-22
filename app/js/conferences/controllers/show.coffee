'use strict'

_ = require('lodash')

module.exports = ($scope, $routeParams, Conference, Video, Event) ->
  $scope.conference = Conference.find($routeParams.conferenceSlug)
  $scope.conference.$promise.then (conference) ->
    #$scope.videos = Video.byConference(conference_slug: conference.slug)
    $scope.events = Event.byConference(conference_slug: conference.slug)

