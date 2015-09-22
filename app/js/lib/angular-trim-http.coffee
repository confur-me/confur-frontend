'use strict'

Angular = require('angular')

Angular
  .module('angular-trim-http', [])
  .filter 'trimHttp', -> (text) ->
    return unless text
    text.replace(/https?:\/\//i, '')
