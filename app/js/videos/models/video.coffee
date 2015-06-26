'use strict'

module.exports = ($resource) ->
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

  Video
