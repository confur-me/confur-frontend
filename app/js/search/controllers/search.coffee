'use strict'

module.exports = ($scope, $location, Search) ->
  $scope.results = []
  $scope.videos = []
  $scope.events = []
  $scope.conferences = []

  query = $location.$$search.q
  console.log query

  if query && query != ""
    Search.search(query).then (results) ->
      $scope.results = results.data
      for item in $scope.results
        switch item.type
          when 'video'
            $scope.videos.push item.resource
          when 'conference'
            $scope.conferences.push item.resource
          when 'event'
            $scope.events.push item.resource
