'use strict'

module.exports = ($document) ->
  templateUrl: '/templates/videos/_list.html'
  restrict: 'AE'
  scope:
    videos: '='
    limit: '='
    pagination: '='
    page: '='
    heading: '='
  link: (scope, element, attributes) ->
    scope.pagination = true unless scope.pagination?
    return
