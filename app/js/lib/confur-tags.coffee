'use strict'

Angular = require('angular')

Angular
  .module('confur-tags', [])
  .directive 'confurTags', ($document) ->
    templateUrl: '/templates/tags/_inline_list.html'
    restrict: 'AE'
    scope:
      tags: '='
      limit: '='
    link: (scope, element, attributes) ->
      return false unless scope.tags && scope.tags.length > 0
      # limit = null unless limit
