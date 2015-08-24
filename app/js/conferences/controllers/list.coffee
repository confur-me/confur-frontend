'use strict'

_ = require('lodash')

module.exports = ($scope, Conference) ->
  unless $scope.conferences?.length > 0
    $scope.conferences = Conference.query(shuffle: 'true')
