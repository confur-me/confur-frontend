'use strict'

module.exports = ($scope, $location, $q, Search, Video, Conference, Event, Tag) ->
  init = ->
    deferredEvents      = $q.defer()
    deferredConferences = $q.defer()
    deferredTags        = $q.defer()
    deferredVideos      = $q.defer()

    $scope.events      = events      = []
    $scope.conferences = conferences = []
    $scope.videos      = videos      = []
    $scope.tags        = tags        = []

    $scope.events.$promise      = deferredEvents.promise
    $scope.conferences.$promise = deferredConferences.promise
    $scope.videos.$promise      = deferredVideos.promise
    $scope.tags.$promise        = deferredTags.promise
    $scope.query                = $location.$$search.q

    $scope.events.$promise.then      (items) -> $scope.events      = items
    $scope.conferences.$promise.then (items) -> $scope.conferences = items
    $scope.videos.$promise.then      (items) -> $scope.videos      = items
    $scope.tags.$promise.then        (items) -> $scope.tags        = items

    resolvePromises = ->
      deferredEvents.resolve(events)
      deferredConferences.resolve(conferences)
      deferredVideos.resolve(videos)
      deferredTags.resolve(tags)

    if $scope.query && $scope.query != ""
      results = Search.search(q: $scope.query)
      results.$promise.then (results) ->
        console.log results
        for item in results
          switch item.type
            when 'video'
              videos.push new Video(item.resource)
            when 'conference'
              conferences.push new Conference(item.resource)
            when 'event'
              events.push new Event(item.resource)
            when 'tag'
              tags.push new Tag(item.resource)
        resolvePromises()
    else
      resolvePromises()

  init()
