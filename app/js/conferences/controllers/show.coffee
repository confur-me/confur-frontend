'use strict'

_ = require('lodash')

module.exports = ($scope, $routeParams, $rootScope, Conference, Video, Event) ->
  $scope.conference = Conference.find($routeParams.conferenceSlug)
  $scope.conference.$promise.then (conference) ->
    $rootScope.title = conference.title + ' events and videos'
    #$scope.videos = Video.byConference(conference_slug: conference.slug)
    $scope.events = Event.byConference(conference_slug: conference.slug)

