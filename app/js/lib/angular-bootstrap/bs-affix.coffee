'use strict'

$ = require('jquery')

module.exports = ($document, $timeout) ->
  restrict: 'A'
  scope:
    affixTimeout: '='
  link: (scope, element, attributes) ->
    timeout = parseInt(scope.affixTimeout, 10) || 2000
    $document.ready ->
      $timeout ->
        $(element).affix()
      , timeout
