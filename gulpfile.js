'use strict';

/**
 * Dependencies
 */
var path         = require('path'),
    gulp         = require('gulp'),
    stylus       = require('gulp-stylus'),
    bootstrap    = require('bootstrap-styl'),
    coffee       = require('gulp-coffee'),
    gutil        = require('gulp-util'),
    gulpJade     = require('gulp-jade'),
    jade         = require('jade'),
    autoprefixer = require('gulp-autoprefixer'),
    sourcemaps   = require('gulp-sourcemaps'),
    watch        = require('gulp-watch'),
    browserify   = require('gulp-browserify'),
    rename       = require('gulp-rename'),
    symlink      = require('gulp-symlink'),
    pkg          = require('./package'),
    dependencies = Object.keys(pkg.dependencies);

var appCss          = './app/styles/application.styl',
    vendorCss       = './app/styles/vendor.styl',
    cssGlob         = './app/styles/**/*.styl',
    appJs           = './app/js/application.coffee',
    appImages       = './app/images/**',
    vendorJs        = './app/js/vendor.coffee',
    jsGlob          = './app/js/**/*.coffee',
    jadeGlob        = './app/views/**/*.jade',
    outputAssetsDir = './public/assets',
    outputTemplatesDir = './public/templates',
    outputFontsDir = './public/fonts';

var paths = {};

paths.styles = []
  .concat(path.resolve('./app/styles'))
  .concat(path.resolve('./node_modules'))
  .concat(path.resolve('./node_modules/bootstrap-styl'));

paths.js = []
  .concat(path.resolve('./app/js'))
  .concat(path.resolve('./node_modules'));

var gulp_log = function(e, p) {
  console.log('File ' + p + ' was ' + e + ', running tasks...');
};

gulp.task('app:js', function() {
  return gulp.src(appJs, { read: false })
    //.pipe(sourcemaps.init())
    //.pipe(coffee({bare: true}))
    .pipe(browserify({
      //insertGlobals : true,
      transform: ['coffeeify'],
      extensions: ['.coffee', '.js'],
      paths: paths.js,
      external: dependencies
    }))
    //.pipe(rev())
    .pipe(rename('application.js'))
    //.pipe(sourcemaps.write())
    .pipe(gulp.dest(outputAssetsDir))
  ;
});

gulp.task('app:images', function() {
  return gulp.src(appImages)
    .pipe(gulp.dest(outputAssetsDir))
  ;
});

gulp.task('vendor:js', function() {
  return gulp.src(vendorJs, { read: false})
    .pipe(browserify({
      transform: ['coffeeify'],
      extensions: ['.coffee', '.js'],
      paths: paths.js,
      require: dependencies,
      //external: dependencies
      //,
      //debug: true,
      cache: {},
      packageCache: {},
      fullPaths: true
    }))
    .pipe(rename('vendor.js'))
    .pipe(gulp.dest(outputAssetsDir))
  ;
});

gulp.task('app:css', function() {
  return gulp.src(appCss)
    .pipe(sourcemaps.init())
    .pipe(stylus({
      paths         : paths.styles,
      'include css' : true
    }))
    .pipe(autoprefixer({
        cascade: false
      }))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(outputAssetsDir))
  ;
});

gulp.task('vendor:css', function() {
  return gulp.src(vendorCss)
    .pipe(stylus({
      paths         : paths.styles,
      'include css' : true
    }))
    .pipe(gulp.dest(outputAssetsDir))
  ;
});

gulp.task('jade', function () {
  return gulp.src(jadeGlob)
    .pipe(gulpJade({
      jade: jade,
      pretty: true
    }))
    .pipe(gulp.dest(outputTemplatesDir))
});

gulp.task('symlinks', function () {
  return gulp.src([
    './public/templates/index.html',
    './public/templates/welcome.html'
    ], { read: false })
    .pipe(symlink([
        './public/index.html',
        './public/welcome.html'
        ], { force: true }))
});

gulp.task('vendor:fonts', function() {
  return gulp.src([
    './node_modules/bootstrap-styl/fonts/*',
    './node_modules/material-design-icons/iconfont/*',
    './node_modules/video.js/dist/video-js/font/*'
    ])
    .pipe(gulp.dest(outputFontsDir))
  ;
});

// watch for css
gulp.task('watch-css', function() {
  gulp.watch([ cssGlob, '!'+vendorCss ],
    ['app:css']
  ).on('change', function(event) {
    gulp_log(event.type, event.path);
  });
});

// watch for js
gulp.task('watch-js', function() {
  gulp.watch(jsGlob,
    ['app:js']
  ).on('change', function(event) {
    gulp_log(event.type, event.path);
  });
});

// watch for jade
gulp.task('watch-jade', function() {
  gulp.watch(jadeGlob,
    ['jade']
  ).on('change', function(event) {
    gulp_log(event.type, event.path);
  });
});

gulp.task('app', ['app:js', 'app:css', 'app:images', 'jade', 'symlinks']);
gulp.task('vendor', ['vendor:js', 'vendor:css', 'vendor:fonts']);
gulp.task('default', ['app', 'vendor']);
gulp.task('watch', ['default', 'watch-js', 'watch-css', 'watch-jade']);
