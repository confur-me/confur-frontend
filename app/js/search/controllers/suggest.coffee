'use strict'

Ps = require('perfect-scrollbar')

module.exports = ($scope, $location, $q, Search, Video, Tag, Event, Conference) ->
  searchContainer = angular.element('#search-suggest')[0]
  $scope.suggest = []

  init = ->
    $scope.query ||= $location.$$search.q

    $scope.$watch 'query', (q, old) ->
      deferredSuggest = newSearch()

      if q && q != "" && old != q
        Search.search(q: q).$promise.then (suggest) ->
          suggestList = []
          for item in suggest
            switch item.type
              when 'video'
                item.resource = Video.new(item.resource)
              when 'conference'
                item.resource = Conference.new(item.resource)
              when 'event'
                item.resource = Event.new(item.resource)
              when 'tag'
                item.resource = Tag.new(item.resource)
            suggestList.push(item)
          deferredSuggest.resolve(suggestList)
          Ps.update(searchContainer)

  newSearch = ->
    deferredSuggest = $q.defer()
    $scope.suggest = []
    $scope.suggest.$promise = deferredSuggest.promise
    $scope.suggest.$promise.then (items) ->
      $scope.suggest = items
    deferredSuggest

  $scope.cancel = (e = null) ->
    return unless !e || e.keyCode == 27
    if e && e.keyCode == 13
      $scope.query.$rollbackViewValue()
    $scope.suggest = []

  $scope.initSearch = ->
    Ps.initialize(searchContainer)

  $scope.select = (item) ->
    $location.path(item.showPath()).search('play', null)
    $scope.cancel()

  $scope.doSearch = ->
    return if $scope.query.length == 0
    $scope.cancel()
    $location.path('/search').search('q', $scope.query).search('play', null)

  init()
