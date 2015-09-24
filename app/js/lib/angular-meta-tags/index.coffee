'use strict'

Angular = require('angular')

Angular
  .module('angular-meta-tags', [])
  .directive('replaceMetaTag', require('./replace-meta-tag'))
