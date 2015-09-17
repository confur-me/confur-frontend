'use strict'

$ = require('jquery')

module.exports = ($document, $timeout) ->
  restrict: 'A'
  link: (scope, element, attributes) ->
    $document.ready ->
      $timeout ->
        $(element).affix()
      , 2000
