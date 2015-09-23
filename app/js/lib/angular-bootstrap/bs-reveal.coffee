'use strict'

$ = require('jquery')

module.exports = ($document, $timeout) ->
  restrict: 'A'
  scope:
    revealTimeout: '='
  link: (scope, element, attributes) ->
    timeout = parseInt(scope.revealTimeout, 10) || 1000
    $document.ready ->
      $(element).hide()
      $timeout ->
        $(element).fadeIn(500)
      , timeout
