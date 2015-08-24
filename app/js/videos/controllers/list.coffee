'use strict'

_   = require('lodash')
Ps  = require('perfect-scrollbar')
$   = require('jquery')
tpl = require('mnml-tpl')


module.exports = ($scope, $routeParams, $location, $q, location, Video) ->

  deferredVideos         = $q.defer()
  playlistContainer      = angular.element('#playlist')[0]
  $scope.videos          = []
  $scope.videos.$promise = deferredVideos.promise
  $scope.videos.$promise.then (videos) ->
    $scope.videos = videos

  $scope.initScroll = ->
    playlistContainer = angular.element('#playlist')[0]
    Ps.initialize(playlistContainer)

  $scope.paginateVideos = (data) ->
    if $scope.videos.$promise
      deferredVideos.resolve(data)
    else
      $scope.videos = data
    data

  init = ->
    $scope.nowPlaying      = null

    $scope.page =
      if $location.search().page
        parseInt($location.search().page, 10) - 1
      else
        0

    $scope.$watch 'page', (page) -> $location.search('page', page + 1)

    $scope.$on '$locationChangeSuccess', ->
      page = $location.search().page - 1
      if page >= 0
        $scope.page = page

    #$scope.repeat         = false
    #$scope.shuffle        = false
    #$scope.mute           = false
    #$scope.autoplay       = true

    $scope.videosUrl =
      if $routeParams.conferenceSlug
        tpl(Video.urls.byConference)(conference_slug: $routeParams.conferenceSlug)
      else if $routeParams.eventId
        tpl(Video.urls.byEvent)(event_id: $routeParams.eventId)
      else if $routeParams.tagSlug
        tpl(Video.urls.byTag)(tag_slug: $routeParams.tagSlug)
      else
        tpl(Video.urls.main)(id: "")+"?shuffle=true"

    #unless $scope.videos
      #$scope.videos =
        #if $routeParams.conferenceSlug
          #Video.byConference(conference_slug: $routeParams.conferenceSlug)
        #else if $routeParams.eventId
          #Video.byEvent(event_id: $routeParams.eventId)
        #else if $routeParams.tag
          #Video.byTag(tag: $routeParams.tag)
        #else
          #Video.query()

    if $scope.videos.$promise
      $scope.videos.$promise.then ->
        $scope.play($location.hash())
        Ps.update(playlistContainer)
    else
      $scope.play($location.hash())

  $scope.play = (videoId) ->
    console.log $scope.videos
    videoId = parseInt(videoId)
    return unless videoId > 0
    return if $scope.nowPlaying && videoId == $scope.nowPlaying.id
    $scope.nowPlaying = _.find $scope.videos, (video) ->
      video.id == videoId

    if $scope.nowPlaying
      console.log "playin " + $scope.nowPlaying.id
      location.skipReload().hash($scope.nowPlaying.id)
      # TODO: scroll to video element

    videoItem = $(playlistContainer).find('#video-'+videoId)
    if videoItem.length > 0
      offsetTop = $(videoItem).position().top
      playlistContainer.scrollTop = playlistContainer.scrollTop + offsetTop
      Ps.update(playlistContainer)

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
