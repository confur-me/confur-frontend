'use strict'

module.exports = (Youtube, Vimeo) ->
  (video) ->
    console.log video
    return if !video
    switch video.service
      when 'youtube'
        Youtube.embedSrc(video.url)
      when 'vimeo'
        Vimeo.embedSrc(video.url)
