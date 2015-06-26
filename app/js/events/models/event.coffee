'use strict'

module.exports = ($resource) ->
  Event =
    $resource '/api/events/:id',
      id: '@id'
    ,
      byConference:
        method: 'GET'
        isArray: true
        url: '/api/conferences/:conference_slug/events'
        params:
          conference_slug: '@conference_slug'

  Event

