'use strict'

App = require('angular')
  .module('confur')
  .factory('Tag', require('../tags/models/tag'))
  .controller('ShowTagCtrl', require('./controllers/show'))
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider.when '/tags/:tagSlug',
      templateUrl: '/templates/tags/show.html'
      controller: 'ShowTagCtrl'
  ]
