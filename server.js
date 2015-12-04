(function() {
  var app, bodyParser, express, methodOverride, mongoose, morgan, port;

  express = require('express');

  mongoose = require('mongoose');

  port = process.env.port || 3000;

  morgan = require('morgan');

  bodyParser = require('body-parser');

  methodOverride = require('method-override');

  app = express();

  mongoose.connect("mongodb://localhost/MeanMapApp");

  app.use(express["static"](__dirname + '/public'));

  app.use('/bower_components', express["static"](__dirname + '/bower_components'));

  app.use(morgan('dev'));

  app.use(bodyParser.json());

  app.use(bodyParser.urlencoded({
    extended: true
  }));

  app.use(bodyParser.text());

  app.use(bodyParser.json({
    type: 'application/vnd.api+json'
  }));

  app.use(methodOverride());

  app.listen(port);

  console.log('App listening on port ' + port);

}).call(this);

