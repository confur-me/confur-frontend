'use strict'

_ = require('lodash')

module.exports = ($scope, Conference) ->
  Conference.query().$promise.then (confs) ->
    $scope.conferences = confs
