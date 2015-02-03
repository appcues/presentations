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
    gulp.src(['./p/**/*.jade'])
        .pipe(jade({
            locals:
                ASSET_PATH: '../../lib'
        }))
        .pipe(gulp.dest('./p/'))


gulp.task 'default', ->
    gulp.run 'css'
    gulp.run 'templates'


gulp.task 'watch', ->
    gulp.watch './lib/**/*.less', ->
        gulp.run 'css'

    gulp.watch './p/**/*.jade', ->
        gulp.run 'templates'
