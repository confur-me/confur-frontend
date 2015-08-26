'use strict'

tpl = require('mnml-tpl')

module.exports = ($resource) ->

  thumbnailPlaceholder = '<div class="thumbnail-icon"><i class="material-icon">event</i></div>'
  thumbnailPicture = '<div class="thumbnail-cover" style="background-image: url(:thumbnailUrl)"></div>'

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

  Event.find = (id) ->
    event = Event.get(id: id)
    event.$promise.then ->
      event.init()
    event

  Event.new = (attrs) ->
    event = new Event(attrs)
    event.init()
    event

  Event::init = ->
    # init

  Event::thumbnailTag = ->
    if @thumbnail
      tpl(thumbnailPicture)(thumbnailUrl: @thumbnail)
    else if @conference?.thumbnail
      tpl(thumbnailPicture)(thumbnailUrl: @conference.thumbnail)
    else
      thumbnailPlaceholder

  Event

