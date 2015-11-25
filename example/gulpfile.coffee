gulp = require 'gulp'

bower = require 'gulp-bower'
concat = require 'gulp-concat'
plumber = require 'gulp-plumber'
sass = require 'gulp-sass'
sequence = require 'gulp-sequence'
watch = require 'gulp-watch'

pkg = require './package.json'

dest = (path) ->
    d = 'dist'
    if path != undefined then d = d + path
    return d

sassOptions =
    outputStyle: 'expanded'


gulp.task 'bower-install', ->
    bower()

gulp.task 'sass', ->
    gulp.src 'scss/**/*.scss'
    .pipe plumber()
    .pipe sass(sassOptions).on 'error', sass.logError
    .pipe concat 'app.css'
    .pipe gulp.dest 'css'

gulp.task 'watch', ->
    watch '**/*.scss', -> gulp.start ['sass']

gulp.task 'build', sequence('bower-install', ['sass'])

gulp.task 'default', ['build']
