'use strict'

App = require('angular')
  .module('confur')
  .controller('MainCtrl', require('./controllers/main'))
  .controller('404Ctrl', require('./controllers/404'))
  .controller('500Ctrl', require('./controllers/500'))
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $routeProvider.when '/404',
      templateUrl: '/templates/main/404.html'
      controller: '404Ctrl'
    $routeProvider.when '/500',
      templateUrl: '/templates/main/500.html'
      controller: '500Ctrl'
    $routeProvider.when '/503',
      templateUrl: '/templates/main/500.html'
      controller: '500Ctrl'
    $routeProvider.when '/502',
      templateUrl: '/templates/main/500.html'
      controller: '500Ctrl'
    $routeProvider.when '/504',
      templateUrl: '/templates/main/500.html'
      controller: '500Ctrl'
  ]
