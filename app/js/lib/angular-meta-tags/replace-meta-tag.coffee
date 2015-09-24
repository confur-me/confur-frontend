'use strict'

$ = require('jquery')
_ = require('lodash')

module.exports = ($document) ->
  restrict: 'E'
  link: (scope, element, attributes) ->
    $document.ready ->
      $('[ng-meta-tag="'+attributes.metaTagName+'"]').remove()
      attributesString = ''
      _.forOwn attributes, (value, key) ->
        if typeof(key) == 'string' && key.substring(0,1) != '$' && key != 'metaTagName'
          attributesString += key+'='+'"'+value+'" '

      meta = $('<meta ng-meta-tag="'+attributes.metaTagName+'" '+attributesString+' />')
      $('head').append(meta)
