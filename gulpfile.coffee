gulp = require('gulp')
less = require('gulp-less')
gutil = require('gulp-util')


gulp.task 'css', ->
    gulp.src(['./lib/**/*.less'])
        .pipe(less({
            paths: ['./lib']
            compress: false
        }))
        .pipe(gulp.dest('./lib/'))

gulp.task 'default', ->
    gulp.watch './lib/**/*.less', ->
        gulp.run 'css'
