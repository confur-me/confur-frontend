'use strict'

#_ = require('lodash')

module.exports = ($resource, $http) ->
  Search =
    $resource '/api/search', {},
      search:
        url: '/api/search'
        isArray: true
        method: 'GET'

  Search::showPath = ->
    '/' + @type + 's/' + (@resource.id || @resource.slug)

  Search
