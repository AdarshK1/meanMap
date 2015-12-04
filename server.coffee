express = require('express')
mongoose = require('mongoose')
port = process.env.port || 3000

morgan = require('morgan')
bodyParser = require('body-parser')
methodOverride = require('method-override')
app = express()



mongoose.connect("mongodb://localhost/MeanMapApp")

#// Logging and Parsing
app.use(express.static(__dirname + '/public'));                 #// sets the static files location to public
app.use('/bower_components',  express.static(__dirname + '/bower_components')); #// Use BowerComponents
app.use(morgan('dev'));                                         #// log with Morgan
app.use(bodyParser.json());                                     #// parse application/json
app.use(bodyParser.urlencoded({extended: true}));               #// parse application/x-www-form-urlencoded
app.use(bodyParser.text());                                     #// allows bodyParser to look at raw text
app.use(bodyParser.json({ type: 'application/vnd.api+json'}));  #// parse application/vnd.api+json as json
app.use(methodOverride());

#// Routes
#// ------------------------------------------------------
#// require('./app/routes.js')(app);

#Listen
app.listen(port);
console.log('App listening on port ' + port);