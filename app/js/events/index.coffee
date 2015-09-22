'use strict'

App = require('angular')
  .module('confur')
  .factory('Event', require('./models/event'))
  .factory('Video', require('../videos/models/video'))
  .controller('ListEventsCtrl', require('./controllers/list'))
  .controller('ShowEventCtrl', require('./controllers/show'))
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider.when '/events',
      templateUrl: '/templates/events/index.html'
      controller: 'ListEventsCtrl'
      title: 'Events'

    $routeProvider.when '/events/:eventId',
      templateUrl: '/templates/events/show.html'
      controller: 'ShowEventCtrl'
      title: 'Event'
  ]
