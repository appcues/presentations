gulp = require('gulp')
less = require('gulp-less')
gutil = require('gulp-util')
jade = require('gulp-jade')


gulp.task 'css', ->
    gulp.src(['./lib/*.less'])
        .pipe(less({
            paths: ['./lib']
            compress: false
        }))
        .pipe(gulp.dest('./lib/'))


gulp.task 'templates', ->
    gulp.src(['./bnt/*.jade'])
        .pipe(jade())
        .pipe(gulp.dest('./bnt/'))


gulp.task 'default', ->
    gulp.run 'css'
    gulp.run 'templates'


gulp.task 'watch', ->
    gulp.watch './lib/**/*.less', ->
        gulp.run 'css'

    gulp.watch './bnt/**/*.jade', ->
        gulp.run 'templates'