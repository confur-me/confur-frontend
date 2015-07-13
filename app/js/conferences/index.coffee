'use strict'

App = require('angular')
  .module('confur')
  .factory('Conference', require('./models/conference'))
  .factory('Video', require('../videos/models/video'))
  .factory('Event', require('../events/models/event'))
  .controller('ListConferencesCtrl', require('./controllers/list'))
  .controller('ShowConferenceCtrl', require('./controllers/show'))
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider.when '/conferences',
      templateUrl: '/templates/conferences/list.html'
      controller: 'ListConferencesCtrl'

    $routeProvider.when '/conferences/:conferenceSlug',
      templateUrl: '/templates/conferences/show.html'
      controller: 'ShowConferenceCtrl'
  ]
