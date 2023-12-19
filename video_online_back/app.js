require('dotenv').config()
var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var queryType = require('query-types').middleware;

var videosRouter = require('./routes/videos');
var authRouter = require('./routes/auth');
var adminRouter = require('./routes/admin');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(queryType())

app.use('/videos', videosRouter);
app.use('/auth', authRouter);
app.use('/admin', adminRouter);

app.use('/healthcheck', require('express-healthcheck')({
  test: require('./config/healthcheck')
}));

// Videos folder setup
app.set('videos_folder', process.env.VIDEOS_FOLDER)

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  console.error(err);
  res.status(err.status || 500);
  res.render('error')
});

module.exports = app;
