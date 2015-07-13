'use strict'

module.exports = ($resource, Youtube, Vimeo) ->
  Video =
    $resource '/api/videos/:id',
      id: '@id'
    ,
      byConference:
        method: 'GET'
        isArray: true
        url: '/api/conferences/:conference_slug/videos'
        params:
          conference_slug: '@conference_slug'
          limit: 21
      byEvent:
        method: 'GET'
        isArray: true
        url: '/api/events/:event_id/videos'
        params:
          event_id: '@event_id'
          limit: 21

  Video::embedSrc = ->
    return @embed_src if @embed_src
    switch @service
      when 'youtube'
        @service_id ||= Youtube.parseId(@url)
        @embed_src = Youtube.embedSrc(@service_id)
      when 'vimeo'
        @service_id ||= Vimeo.parseId(@url)
        @embed_src = Vimeo.embedSrc(@service_id)

  Video
