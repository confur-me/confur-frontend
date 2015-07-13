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
        console.log 'destroying old player'
        if playerEl()
          videojs(playerEl()).dispose()

      initPlayer = ->
        $document.ready ->
          destroyOld()
          $(el).html(playerTemplate)
          player = videojs(playerEl(),
            preload: 'auto'
            autoplay: true,
            # autoplay: false,
            controls: true
            techOrder: ["youtube"]
            src: scope.video.url
            poster: scope.video.thumbnail
            #plugins:
              #persistVolume:
                #namespace: 'confur'
          )
          player.on 'ended', ->
            console.log scope
            scope.playNext()
            #console.log('awww...over so soon?')
          player

      scope.$watch 'video', (newVideo) ->
        return unless scope.video
        if scope.video.$promise
          scope.video.$promise.then ->
            initPlayer()
        else
          initPlayer()

#data-setup='{ "techOrder": ["youtube"], "src": "http://www.youtube.com/watch?v=xjS6SftYQaQ" }'
