'use strict'

Angular = require('angular')

Angular
  .module('confur-pagination', [])
  #.directive 'paginator', ($document) ->
    #templateUrl: '/templates/shared/_pagination.html'
    #restrict: 'AE'
    #scope:
      #page: '='
      #count: '='
      #limit: '='
    #link: (scope, element, attributes) ->
      #if scope.count && scope.limit
        #scope.pages = _.range(1, Math.ceil(scope.count / scope.limit))
      #else
        #scope.pages = [1]
