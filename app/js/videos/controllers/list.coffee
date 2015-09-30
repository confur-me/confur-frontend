'use strict'

_   = require('lodash')
Ps  = require('perfect-scrollbar')
$   = require('jquery')
tpl = require('mnml-tpl')

module.exports = ($scope, $routeParams, $location, $q, location, $rootScope, Video) ->

  playlistContainer = angular.element('#playlist')[0]
  deferredVideos    = $q.defer()

  if $scope.videos == undefined
    $scope.videos = []

  $scope.videos.$promise = deferredVideos.promise
  $scope.videos.$promise.then (videos) ->
    $scope.videos = _.map videos, (video) ->
      v = new Video(video)
      v.init()
      v

  $scope.initScroll = ->
    playlistContainer = angular.element('#playlist')[0]
    Ps.initialize(playlistContainer)

  $scope.initializeVideos = (data) ->
    videos = _.map data, (video) ->
      v = new Video(video)
      v.init()
      v

    if $scope.videos.$promise
      deferredVideos.resolve(videos)
    else
      $scope.videos = videos
    angular.element('.videos-list').removeClass('loading')
    videos

  playVideoFromUrl = ->
    if $location.search().play
      $scope.play parseInt($location.search().play, 10)

  init = ->
    $scope.nowPlaying = null

    $scope.page =
      if $location.search().page
        parseInt($location.search().page, 10) - 1
      else
        0

    $scope.$watch 'page', (page, oldPage) ->
      pageParam =
        if page > 0
          page + 1
        else
          null

      if $location.search().page
        if parseInt($location.search().page, 10) != pageParam
          location.skipReload().search('page', pageParam)
          angular.element('.videos-list').addClass('loading')
      else if page > 0
        location.skipReload().search('page', pageParam)
        angular.element('.videos-list').addClass('loading')

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

    if $scope.videos.$promise
      $scope.videos.$promise.then ->
        playVideoFromUrl()
        Ps.update(playlistContainer)
    else
      playVideoFromUrl()

  $scope.play = (videoId) ->
    videoId = parseInt(videoId)
    return unless videoId > 0
    return if $scope.nowPlaying && videoId == $scope.nowPlaying.id
    $scope.nowPlaying = _.find $scope.videos, (video) ->
      video.id == videoId

    if $scope.nowPlaying
      location.skipReload().search('play', $scope.nowPlaying.id)
      $scope.$applyAsync()
      $rootScope.title = $scope.nowPlaying.title
      # TODO: scroll to video element

    videoItem = $(playlistContainer).find('#video-'+videoId)
    if videoItem.length > 0
      offsetTop = $(videoItem).position().top
      playlistContainer.scrollTop = playlistContainer.scrollTop + offsetTop
      Ps.update(playlistContainer)

  $scope.playNext = ->
    #return $scope.play(_.sample($scope.videos).id) if $scope.shuffle
    videosLength = $scope.videos.length
    return unless videosLength > 0
    idx = nowPlayingIdx()
    idx ||= 0
    idx += 1
    idx = 0 if idx >= (videosLength - 1) # && $scope.repeat
    nextVideo = $scope.videos[idx]
    return $scope.play(nextVideo.id) if nextVideo

  $scope.playPrev = ->
    return $scope.play(_.sample($scope.videos).id) if $scope.shuffle
    videosLength = $scope.videos.length
    return unless videosLength > 0
    idx = nowPlayingIdx()
    idx ||= $scope.videos.length
    idx -= 1
    idx = videosLength - 1 if idx <= 0 # && $scope.repeat
    nextVideo = $scope.videos[idx]
    return $scope.play(nextVideo.id) if nextVideo

  nowPlayingIdx = ->
    return unless $scope.nowPlaying
    _.findIndex $scope.videos, (video) ->
      video.id == $scope.nowPlaying.id

  init()
