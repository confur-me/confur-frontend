'use strict'

App = require('angular')
  .module('confur')
  .factory('Search', require('./models/search'))
  .controller('SearchCtrl', require('./controllers/search'))
  .controller('SearchFormCtrl', require('./controllers/search_form'))
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider.when '/search',
      templateUrl: '/templates/search/index.html'
      controller: 'SearchCtrl'
  ]
