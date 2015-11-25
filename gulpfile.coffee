gulp = require 'gulp'

coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
concat = require 'gulp-concat'
header = require 'gulp-header'
karma = require 'karma'
ngAnnotate = require 'gulp-ng-annotate'
order = require 'gulp-order'
plumber = require 'gulp-plumber'
sequence = require 'gulp-sequence'
uglify = require 'gulp-uglify'
watch = require 'gulp-watch'

pkg = require './package.json'

dest = (path) ->
    d = 'dist'
    if path != undefined then d = d + path
    return d

coffeeOptions =
    bare: true

lintOptions = 
    no_empty_param_list: true

banner = [
    '/**'
    ' * <%= pkg.name %> - <%= pkg.description %>'
    ' * @version v<%= pkg.version %> - <%= new Date().toUTCString() %>'
    ' * @link <%= pkg.homepage %>'
    ' * @author <%= pkg.author %>'
    ' * @license <%= pkg.license %>'
    ' */'
    ''].join '\n'

gulp.task 'coffee', ->
    gulp.src 'src/**/*.coffee'
    .pipe plumber()
    .pipe coffee coffeeOptions
    .pipe ngAnnotate()
    .pipe header banner, { pkg: pkg }
    .pipe concat pkg.name + '.js'
    .pipe gulp.dest dest()

gulp.task 'lint', ->
    gulp.src 'src/**/*.coffee'
        .pipe coffeelint()
        .pipe coffeelint.reporter()

gulp.task 'minify', ->
    gulp.src 'dist/' + pkg.name + '.js'
    .pipe uglify()
    .pipe header banner, { pkg: pkg }
    .pipe concat pkg.name + '.min.js'
    .pipe gulp.dest dest()

gulp.task 'watch', ->
    watch 'src/**/*.coffee', -> gulp.start ['coffee']

gulp.task 'build', sequence('lint', 'coffee', 'minify')

gulp.task 'default', ['build']
