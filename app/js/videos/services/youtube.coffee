'use strict'

module.exports = ->

  regex = /(?:https?:\/{2})?(?:w{3}\.)?youtu(?:be)?\.(?:com|be)(?:\/watch\?v=|\/)([^\s&]+)/

  parseId: (url) ->
    videoId = url.match(regex)
    return unless videoId
    videoId[1]

  thumbnail: (id, quality = 'default') ->
    ''

  embedSrc: (id) ->
    "//www.youtube.com/embed/" + id
