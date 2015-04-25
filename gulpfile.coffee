# Dependencies.
gulp       = require "gulp"
gutil      = require "gulp-util"
connect    = require "gulp-connect"
flatten    = require "gulp-flatten"
addsrc     = require "gulp-add-src"
concat     = require "gulp-concat"
uglify     = require "gulp-uglify"
sourcemaps = require "gulp-sourcemaps"
sass       = require "gulp-sass"
ngannotate = require "gulp-ng-annotate"
coffee     = require "gulp-coffee"

# Paths.
paths =
  styles:
    src: "./app/components/**/*.scss"
    libs: [
      "./bower_components/bootstrap/dist/css/bootstrap.min.css"
    ]
    dest: "./app/assets/css/"
  layouts:
    src: "./app/components/**/*.html"
    dest: "./app/assets/html/"
  scripts:
    src: "./app/components/**/*.coffee"
    libs: [
      "./bower_components/jquery/dist/jquery.js"
      "./bower_components/bootstrap/dist/js/bootstrap.js"
      "./bower_components/angular/angular.js"
      "./bower_components/angular-ui-router/release/angular-ui-router.js"
    ]
    dest: "./app/assets/js/"



# Livereload server.
gulp.task "dev-server", ->
  connect.server
    port: process.env.PORT || 4200
    livereload: true


# Layouts. Maybe this isn't really useful but it can be
# modified to use a html engine like jade.
gulp.task "dev-layouts", ->
  gulp.src paths.layouts.src
    .pipe flatten()
    .pipe gulp.dest(paths.layouts.dest)
    .pipe connect.reload()

gulp.task "layouts", ->
  gulp.src paths.layouts.src
    .pipe flatten()
    .pipe gulp.dest(paths.layouts.dest)


# Style compilation.
gulp.task "dev-styles", ->
  gulp.src paths.styles.src
    .pipe sourcemaps.init()
    .pipe sass().on("error", gutil.log)
    .pipe addsrc(paths.styles.libs)
    .pipe concat("styles.css")
    .pipe sourcemaps.write("./maps")
    .pipe gulp.dest(paths.styles.dest)
    .pipe connect.reload()

gulp.task "styles", ->
  gulp.src paths.styles.src
    .pipe sass()
    .pipe addsrc(paths.styles.libs)
    .pipe concat("styles.scss")
    .pipe gulp.dest(paths.styles.dest)


# scripts compilation.
gulp.task "dev-scripts-app", ->
  gulp.src paths.scripts.src
    .pipe sourcemaps.init()
    .pipe coffee({bare: true}).on("error", gutil.log)
    .pipe ngannotate()
    .pipe concat("app.js")
    .pipe sourcemaps.write()
    .pipe gulp.dest(paths.scripts.dest)
    .pipe connect.reload()

# Due to long compilation times and debugging, during dev the
# third-party scripts are compiled separated from the main app.
gulp.task "dev-scripts-libs", ->
  gulp.src paths.scripts.libs
    .pipe concat("libs.js")
    .pipe gulp.dest(paths.scripts.dest)

gulp.task "scripts", ->
  gulp.src paths.scripts.src
    .pipe coffee({bare: true}).on("error", gutil.log)
    .pipe addsrc(paths.scripts.libs)
    .pipe ngannotate()
    .pipe concat("app.js")
    .pipe uglify()
    .pipe gulp.dest(paths.scripts.dest)



# Development tasks
gulp.task "dev", [
  "dev-layouts",
  "dev-scripts-app",
  "dev-scripts-libs"
  "dev-server",
  "dev-styles",
], ->
  gulp.watch paths.layouts.src, ["dev-layouts"]
  gulp.watch paths.styles.src,  ["dev-styles"]
  gulp.watch paths.scripts.src, ["dev-scripts-app"]


# Production task
gulp.task "build", [
  "layouts",
  "styles",
  "scripts"
]
