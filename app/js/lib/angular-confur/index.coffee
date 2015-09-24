'use strict'

Angular = require('angular')

Angular
  .module('angular-confur', [])
  .factory('requestErrorInterceptor', require('./request_error_interceptor'))
  .filter('url', require('./url'))
  #.filter('asset-url', require('./url'))
  #.filter('asset-path', require('./url'))
