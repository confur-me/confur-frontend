'use strict'

App = require('angular')
  .module('confur')
  .factory('Conference', require('./models/conference'))
  .factory('Video', require('../videos/models/video'))
  .factory('Event', require('../events/models/event'))
  .controller('ConferencesCtrl', require('./controllers/conferences'))
  .controller('VideosCtrl', require('../videos/controllers/videos'))
  .controller('EventsCtrl', require('../events/controllers/events'))
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider.when '/conferences',
      templateUrl: '/templates/conferences/list.html'
      controller: 'ConferencesCtrl'
  ]
