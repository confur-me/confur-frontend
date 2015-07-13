'use strict'

module.exports = (Youtube, Vimeo) ->
  (video) ->
    console.log "videoThumb"
    return if !video
    return video.thumbnail if video.thumbnail
    switch video.service
      when 'youtube'
        Youtube.thumbnail(video.url)
      when 'vimeo'
        Vimeo.thumbnail(video.url)
