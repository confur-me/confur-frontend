'use strict'

App = require('angular')
  .module('confur')
  .factory('Search', require('./models/search'))
  .factory('Video', require('../videos/models/video'))
  .factory('Conference', require('../conferences/models/conference'))
  .factory('Event', require('../events/models/event'))
  .factory('Tag', require('../tags/models/tag'))
  .controller('SearchCtrl', require('./controllers/search'))
  .controller('SuggestCtrl', require('./controllers/suggest'))
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider.when '/search',
      templateUrl: '/templates/search/index.html'
      controller: 'SearchCtrl'
  ]
