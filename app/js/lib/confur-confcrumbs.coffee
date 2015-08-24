'use strict'

Angular = require('angular')

Angular
  .module('confur-confcrumbs', [])
  .directive 'confcrumbs', ($document) ->
    templateUrl: '/templates/shared/_confcrumbs.html'
    restrict: 'AE'
    scope:
      conference: '='
      event: '='
    link: (scope, element, attributes) ->
      return false unless scope.conference
