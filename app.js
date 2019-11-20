
const express = require('express');
const bodyParser = require('body-parser');
const ejsBlocks = require('ejs-blocks');
const ejsLocals = require('ejs-locals');
const path = require('path');

// create express app
const app = express();

var PORT_NUMBER = process.env.PORT || 2019;

// parse requests of content-type - application/json
app.use(bodyParser.json());

//set public directory
app.use(express.static(path.join(__dirname, 'public')));

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.engine('ejs', ejsLocals); // Layout, blocks & partial concepts
app.set('view engine', 'ejs'); // Set View Engine, Example: pug, ejs, mustache etc... 

// Add headers
app.use(function (req, res, next) {

    // Website you wish to allow to connect

    var allowedOrigins = ['http://localhost:4200', 'http://localhost:4201'];

    var origin = req.headers.origin;
    if(allowedOrigins.indexOf(origin) > -1){
        res.setHeader('Access-Control-Allow-Origin', origin);
    }
    
    //res.setHeader('Access-Control-Allow-Origin', 'http://localhost:4200'); //single website
    //res.setHeader('Access-Control-Allow-Origin', '*'); //for any website

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    res.locals.currentPageUrl= req.path.toLowerCase();

    // Pass to next layer of middleware
    next();
});

// Require routing file
require('./routing/baseRouting')(app);

// listen for requests
app.listen(PORT_NUMBER, () => {
    console.log(`Server is listening at ${PORT_NUMBER}`);
});