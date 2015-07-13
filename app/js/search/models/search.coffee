'use strict'

module.exports = ($http) ->
  Search = {}
  Search.search = (q) ->
    $http.get('/api/search?q='+q)
  Search
