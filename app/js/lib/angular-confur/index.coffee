Angular = require('angular')

Angular
  .module('angular-confur', [])
  #.filter('videoSrc', require('./embeds/video-src'))
  #.filter('videoThumbnail', require('./embeds/video-thumbnail'))

  #.directive('confurRenderConference', require('./suggest/conference'))
  #.directive('confurRenderEvent', require('./suggest/event'))
  #.directive('confurRenderVideo', require('./suggest/video'))
  #.directive('confurRenderTag', require('./suggest/tag'))
