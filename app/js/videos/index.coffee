'use strict'

App = require('angular')
  .module('confur')
  .service('Youtube', require('./services/youtube'))
  .service('Vimeo', require('./services/vimeo'))
  .factory('Video', require('./models/video'))
  .factory('Tag', require('../tags/models/tag'))
  .controller('ListVideosCtrl', require('./controllers/list'))
  .controller('ShowVideoCtrl', require('./controllers/show'))
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider.when '/videos',
      templateUrl: '/templates/videos/index.html'
      controller: 'ListVideosCtrl'

    $routeProvider.when '/videos/:id',
      templateUrl: '/templates/videos/show.html'
      controller: 'ShowVideoCtrl'
  ]
