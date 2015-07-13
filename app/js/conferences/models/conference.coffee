'use strict'

module.exports = ($resource) ->

  Conference =
    $resource '/api/conferences/:slug',
      slug: '@slug'
    ,

  Conference.find = (slug) ->
    Conference.get(slug: slug)

  Conference
