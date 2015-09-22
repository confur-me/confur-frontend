'use strict'

App = require('angular')
  .module('confur')
  .factory('Video', require('./models/video'))
  .controller('IndexVideosCtrl', require('./controllers/index'))
  .controller('ListVideosCtrl', require('./controllers/list'))
  .controller('ShowVideoCtrl', require('./controllers/show'))
  .directive 'videosGrid', require('./directives/videos-grid')
  .directive 'videosList', require('./directives/videos-list')
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider.when '/',
      templateUrl: '/templates/videos/index.html'
      controller: 'IndexVideosCtrl'
      title: 'Videos'

    $routeProvider.when '/videos',
      templateUrl: '/templates/videos/index.html'
      controller: 'IndexVideosCtrl'
      reloadOnSearch: false
      title: 'Videos'

    $routeProvider.when '/videos/:id',
      templateUrl: '/templates/videos/show.html'
      controller: 'ShowVideoCtrl'
      title: 'Video'
  ]
