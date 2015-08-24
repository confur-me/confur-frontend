'use strict'

Ps = require('perfect-scrollbar')

module.exports = ($scope, $location, Search, Video, Tag, Event, Conference) ->
  searchContainer = angular.element('#search-suggest')[0]

  init = ->
    $scope.suggest = []
    $scope.query ||= $location.$$search.q
    $scope.$watch 'query', (q, old) ->
      $scope.suggest = []
      if q && q != "" && old != q
        Search.search(q: q).$promise.then (suggest) ->
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
            $scope.suggest.push(item)
          Ps.update(searchContainer)

  $scope.cancel = ->
    $scope.suggest = []

  $scope.initSearch = ->
    Ps.initialize(searchContainer)

  $scope.select = (item) ->
    $location.path(item.showPath())
    $location.hash(null)
    #e.preventDefault()
    $scope.cancel()

  init()
