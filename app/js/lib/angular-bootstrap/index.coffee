'use strict'

Angular = require('angular')

Angular
  .module('angular-bootstrap', [])
  .directive('bsAffix', require('./bs-affix'))
