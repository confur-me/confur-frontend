'use strict'

module.exports = ($scope, $cookies) ->
  $scope.welcome = ->
    now = new Date()
    $cookies.put 'welcome', 'true',
      expires: new Date(now.getTime() + 3 * 24 * 60 * 60 * 1000)
    window.location.reload()
