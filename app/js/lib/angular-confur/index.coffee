'use strict'

Angular = require('angular')

Angular
  .module('angular-confur', [])
  .factory('requestErrorInterceptor', require('./request_error_interceptor'))
