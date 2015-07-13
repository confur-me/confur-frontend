'use strict'

Angular = require('angular')

Angular
  .module('angular-truncate', [])
  .filter 'truncate', -> (text, length=30) ->
    if text and text.length > length
      return text.substring(0, length)+'...'
    else text
