'use strict'

Angular = require('angular')
$ = require('jquery')

Angular
  .module('angular-videojs', [])
  .directive 'ngVideojs', ($document) ->
    restrict: 'E'
    scope:
      video: '='
      playNext: '&playNext'
    link: (scope, element, attributes) ->
      el             = $(element)[0]
      playerTemplate = '<video id="player" class="video-js vjs-default-skin vjs-big-play-centered"></video>'

      playerEl = ->
        $(el).children('#player')[0]

      destroyOld = ->
        if playerEl()
          videojs(playerEl()).dispose()

      initPlayer = ->
        $document.ready ->
          destroyOld()
          $(el).html(playerTemplate)
          player = videojs(playerEl(),
            preload: 'auto'
            autoplay: true
            controls: true
            techOrder: ["youtube"]
            src: scope.video.url
            poster: scope.video.thumbnail
            #plugins:
              #persistVolume:
                #namespace: 'confur'
          )
          player.on 'ended', ->
            scope.playNext()
          player

      scope.$watch 'video', (newVideo) ->
        return unless newVideo
        if scope.video.$promise
          scope.video.$promise.then ->
            initPlayer()
        else
          initPlayer()
