'use strict'

module.exports = ($resource) ->

  thumbnailPlaceholder = '<div class="thumbnail-icon"><i class="material-icon">school</i></div>'

  Conference =
    $resource '/api/conferences/:slug',
      slug: '@slug'
    ,

  Conference.new = (attrs) ->
    conference = new Conference(attrs)
    conference.init()
    conference

  Conference.find = (slug) ->
    conference = Conference.get(slug: slug)
    conference.$promise.then ->
      conference.init()
    conference

  Conference::init = ->
    # init

  Conference::thumbnailTag = ->
    if @thumbnail
      '<img src="'+@thumbnail+'" />'
    else
      thumbnailPlaceholder

  Conference
