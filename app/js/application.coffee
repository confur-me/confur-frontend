'use strict'

$             = require('jquery')
window.jQuery = $
Angular       = require('angular')
videojs       = require('video.js')

require('bootstrap-styl/js/scrollspy')
require('bootstrap-styl/js/transition')
require('bootstrap-styl/js/button')
require('bootstrap-styl/js/affix')
require('bootstrap-styl/js/modal')
require('bootstrap-styl/js/carousel')

require('angular-bindonce')
require('angular-loading-bar')
require('./lib/angular-bootstrap')
require('./lib/angular-confur')
require('./lib/angular-truncate')
require('./lib/angular-videojs')
require('./lib/location-change-hack')
require('./lib/angular-focus')
require('./lib/angular-highlight-phrase')
require('./lib/confur-tags')
require('./lib/confur-confcrumbs')
require('./lib/confur-pagination')
require('./lib/paginate-anything')
require('./lib/angular-trim-http')
require('./lib/angular-meta-tags')

App = Angular
  .module('confur', [
    'location-change-hack',
    require('angular-resource'),
    require('angular-sanitize'),
    require('angular-route'),
    require('angular-animate'),
    require('angular-cookies'),
    'angular-loading-bar',
    'angular-confur',
    'angular-bootstrap',
    'angular-truncate',
    'angular-videojs',
    'pasvaz.bindonce',
    'angular-focus',
    'angular-highlight-phrase',
    'confur-tags',
    'confur-pagination',
    'confur-confcrumbs',
    'bgf.paginateAnything',
    'angular-trim-http',
    'angular-meta-tags'
  ])

App
  .config(['cfpLoadingBarProvider', (cfpLoadingBarProvider) ->
    cfpLoadingBarProvider.latencyThreshold = 0
    cfpLoadingBarProvider.includeSpinner = true
  ])
  .config(['$locationProvider', ($locationProvider) ->
    $locationProvider.html5Mode(true)
  ])
  .config(['$httpProvider', ($httpProvider) ->
    $httpProvider.interceptors.push('requestErrorInterceptor')
  ])
  .config(['$routeProvider', ($routeProvider) ->
    $routeProvider.otherwise
      templateUrl: '/templates/main/404.html'
      controller: '404Ctrl'
  ])

App.run ($rootScope) ->
  $rootScope.$on '$routeChangeSuccess', (event, current, previous) ->
    $rootScope.title = current.$$route.title

require('videojs-youtube')
require('videojs-playlist')
require('videojs-persistvolume')

require('./main')
require('./search')
require('./welcome')
require('./conferences')
require('./videos')
require('./events')
require('./tags')
