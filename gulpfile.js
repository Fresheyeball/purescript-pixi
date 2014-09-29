var 

gulp       = require('gulp'),
purescript = require('gulp-purescript'),
concat     = require('gulp-concat'),
gulpif     = require('gulp-if'),
gulpFilter = require('gulp-filter'),

paths      = {
  test : {
    src : [
      "bower_components/purescript-*/src/**/*.purs",
      "bower_components/purescript-*/src/**/*.purs.hs",
      "src/**/*.purs"
    ],
    dest : 'tmp'
  }
},

options    = {
  test :{
    output : 'Test.js',
    main : false,
    runtimeTypeChecks : false,
    externs : "extern.purs"
  }
},

build = function(k){
  return function(){

    var x   = paths[k],
        o   = options[k],
        psc = purescript.psc(o),
        dot = purescript.dotPsci();

      psc.on('error', function(e){
        console.error(e.message);
        psc.end();  
      });

      gulp.src(x.src)
        .pipe(gulpif(/purs/,  dot));

      return gulp.src(x.src)
        .pipe(gulpif(/purs/,  psc))
        .pipe(concat(o.output))
        .pipe( gulp.dest(x.dest));
 
  };
}; // var

gulp.task('build:test',    build('test'));

gulp.task('docgen', function(){
  var noBower = gulpFilter(["*", "!bower_components/**/*"]);
  gulp.src("src/**/*.purs")
    .pipe(purescript.docgen())
    .pipe( gulp.dest("DocGen.md"));
});