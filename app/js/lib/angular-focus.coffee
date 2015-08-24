'use strict'

Angular = require('angular')

Angular
  .module('angular-focus', [])
  .directive 'focus', ($document) ->
    restrict: 'A'
    link: (scope, element, attributes) ->
      $document.ready ->
        element.focus()
