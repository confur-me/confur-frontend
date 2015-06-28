'use strict'

$             = require('jquery')
window.jQuery = $
Angular = require('angular')

require('bootstrap-styl/js/scrollspy')
require('bootstrap-styl/js/transition')
require('bootstrap-styl/js/button')
require('bootstrap-styl/js/affix')
require('bootstrap-styl/js/modal')
require('bootstrap-styl/js/carousel')

require('angular-loading-bar')

App = Angular
  .module('confur', [
    require('angular-resource'),
    require('angular-sanitize'),
    require('angular-route'),
    require('angular-animate'),
    'angular-loading-bar'
  ])

App
  .config(['cfpLoadingBarProvider', (cfpLoadingBarProvider) ->
    cfpLoadingBarProvider.latencyThreshold = 0
    cfpLoadingBarProvider.includeSpinner = true
  ])
  .config(['$locationProvider', ($locationProvider) ->
    $locationProvider.html5Mode(true)
  ])

require('./main')
require('./welcome')
require('./conferences')
require('./videos')
require('./events')
