'use strict'

module.exports = ($resource) ->

  thumbnailPlaceholder = '<div class="thumbnail-icon"><i class="material-icon">local_offer</i></div>'

  Tag =
    $resource '/api/tags/:slug', slug: '@slug',
      search:
        url: '/api/tags'
        isArray: true
        method: 'GET'

  Tag.new = (attrs) ->
    tag = new Tag(attrs)
    tag.init()
    tag

  Tag.find = (slug) ->
    tag = Tag.get(slug: slug)
    tag.$promise.then ->
      tag.init()
    tag

  Tag::init = ->
    # init

  Tag::thumbnailTag = ->
    thumbnailPlaceholder

  Tag
