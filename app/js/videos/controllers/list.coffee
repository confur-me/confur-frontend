'use strict'

_ = require('lodash')

module.exports = ($scope, $routeParams, $location, location, Video) ->

  $scope.repeat     = false
  $scope.shuffle    = false

  init = ->
    $scope.nowPlaying = null

    unless $scope.videos
      $scope.videos =
        if $routeParams.conferenceSlug
          Video.byConference
            conference_slug: $routeParams.conferenceSlug
        else if $routeParams.eventId
          Video.byEvent
            event_id: $routeParams.eventId
        else if $routeParams.tag
          Video.byTag
            Tag: $routeParams.tag
        else
          Video.query()

    $scope.play($location.hash())

  $scope.play = (videoId) ->
    videoId = parseInt(videoId)
    return unless videoId > 0
    $scope.videos.$promise.then (videos) ->
      $scope.nowPlaying = _.find videos, (video) ->
        video.id == videoId
      console.log "playin " + $scope.nowPlaying.id

      if $scope.nowPlaying
        location.skipReload().hash($scope.nowPlaying.id)

  $scope.playNext = ->
    return $scope.play(_.sample($scope.videos).id) if $scope.shuffle
    videosLength = $scope.videos.length
    return unless videosLength > 0
    idx = nowPlayingIdx()
    idx ||= 0
    idx += 1
    idx = 0 if idx >= (videosLength - 1) && $scope.repeat
    nextVideo = $scope.videos[idx]
    return $scope.play(nextVideo.id) if nextVideo

  $scope.playPrev = ->
    return $scope.play(_.sample($scope.videos).id) if $scope.shuffle
    videosLength = $scope.videos.length
    idx = nowPlayingIdx()
    idx ||= $scope.videos.length
    idx -= 1
    idx = videosLength - 1 if idx <= 0 && $scope.repeat
    nextVideo = $scope.videos[idx]
    return $scope.play(nextVideo.id) if nextVideo

  nowPlayingIdx = ->
    return unless $scope.nowPlaying
    _.findIndex $scope.videos, (video) ->
      video.id == $scope.nowPlaying.id

  init()
