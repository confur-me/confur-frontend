Angular = require('angular')

Angular
  .module('location-change-hack', [])
  .factory 'location', [
    '$location', '$route', '$rootScope', ($location, $route, $rootScope) ->
      $location.skipReload = ->
        lastRoute = $route.current
        un = $rootScope.$on '$locationChangeSuccess', ->
          $route.current = lastRoute
          un()
        $location
      $location
  ]
