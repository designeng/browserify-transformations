'use strict'
gulp       = require 'gulp'
path       = require 'path'
browserify = require 'browserify'
source     = require 'vinyl-source-stream'

# alternate
coffee      = require 'gulp-coffee'
gutil       = require 'gulp-util'

mainCoffeeFile = './source/main.coffee'

gulp.task 'compile-coffee', () ->
    gulp.src('./source/**/*.coffee')
        .pipe coffee({bare: true}).on('error', gutil.log)
        .pipe gulp.dest('./source/js')

# JS
gulp.task 'js', ['compile-coffee'], () ->
    browserify
        entries: ['./source/js/main.js']
        extensions: ['.js']
        standalone: 'main'
    .transform 'deamdify'
    # .transform './transformers/clearWrapper'
    # .transform 'debowerify'
    # .transform 'uglifyify'
    .bundle()
    .pipe source 'main.js'
    .pipe gulp.dest 'dist'