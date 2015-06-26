'use strict'

App = require('angular')
  .module('confur')
  .factory('Event', require('./models/event'))
  .factory('Video', require('../videos/models/video'))
  .controller('EventsCtrl', require('./controllers/events'))
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider.when '/events',
      templateUrl: '/templates/events/index.html'
      controller: 'EventsCtrl'
  ]
