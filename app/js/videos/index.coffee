'use strict'

App = require('angular')
  .module('confur')
  .factory('Video', require('./models/video'))
  .controller('ListVideosCtrl', require('./controllers/list'))
  .controller('ShowVideoCtrl', require('./controllers/show'))
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider.when '/',
      templateUrl: '/templates/videos/index.html'
      controller: 'ListVideosCtrl'

    $routeProvider.when '/videos',
      templateUrl: '/templates/videos/index.html'
      controller: 'ListVideosCtrl'
      reloadOnSearch: false

    $routeProvider.when '/videos/:id',
      templateUrl: '/templates/videos/show.html'
      controller: 'ShowVideoCtrl'
  ]
