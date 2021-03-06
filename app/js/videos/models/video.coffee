'use strict'

tpl = require('mnml-tpl')
$   = require('jquery')

module.exports = ($resource, $location) ->

  thumbnailPlaceholder = '<div class="thumbnail-icon"><i class="material-icon">movie</i></div>'
  thumbnailPicture = '<div class="thumbnail-cover" style="background-image: url(:thumbnailUrl)"></div>'

  urls =
    main: '/api/videos/:id'
    byConference: '/api/conferences/:conference_slug/videos'
    byEvent: '/api/events/:event_id/videos'
    byTag: '/api/tags/:tag_slug/videos'

  Video =
    $resource urls.main,
      id: '@id'
    ,
      byConference:
        method: 'GET'
        isArray: true
        url: urls.byConference
        params:
          conference_slug: '@conference_slug'
          limit: 20

      byEvent:
        method: 'GET'
        isArray: true
        url: urls.byEvent
        params:
          event_id: '@event_id'
          limit: 20

      byTag:
        method: 'GET'
        isArray: true
        url: urls.byTag
        params:
          tag_slug: '@tag_slug'
          limit: 20

  Video.urls = urls

  Video.new = (attrs) ->
    video = new Video(attrs)
    video.init()
    video

  Video.find = (id) ->
    video = Video.get(id: id)
    video.$promise.then ->
      video.init()
    video

  Video::init = ->
    # init

  Video::isPlaying = ->
    parseInt($location.hash()) == @id

  Video::thumbnailTag = ->
    if @thumbnail
      tpl(thumbnailPicture)(thumbnailUrl: @thumbnail)
    else
      thumbnailPlaceholder

  Video::linkToShow = ->
    location.origin + '/videos/'+@id

  Video::linkToPlay = ->
    params = $.extend({}, $location.search())
    params.play = @id
    $location.path() + '?' + $.param(params)

  Video
