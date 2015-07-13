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
require('./lib/angular-confur')
require('./lib/angular-truncate')
require('./lib/angular-videojs')
require('./lib/location-change-hack')

App = Angular
  .module('confur', [
    'location-change-hack',
    require('angular-resource'),
    require('angular-sanitize'),
    require('angular-route'),
    require('angular-animate'),
    'angular-loading-bar',
    'angular-confur',
    'angular-truncate',
    'angular-videojs',
    'pasvaz.bindonce'
  ])

App
  .config(['cfpLoadingBarProvider', (cfpLoadingBarProvider) ->
    cfpLoadingBarProvider.latencyThreshold = 0
    cfpLoadingBarProvider.includeSpinner = true
  ])
  .config(['$locationProvider', ($locationProvider) ->
    $locationProvider.html5Mode(true)
  ])

require('videojs-youtube')
require('videojs-playlist')
require('videojs-persistvolume')

require('./main')
require('./search')
require('./welcome')
require('./conferences')
require('./videos')
require('./events')
